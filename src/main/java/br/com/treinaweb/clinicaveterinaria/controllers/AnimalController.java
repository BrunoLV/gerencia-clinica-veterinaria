package br.com.treinaweb.clinicaveterinaria.controllers;

import br.com.treinaweb.clinicaveterinaria.modelos.Animal;
import br.com.treinaweb.clinicaveterinaria.services.AnimalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/animais")
public class AnimalController {

    @Autowired
    private AnimalService animalService;

    @RequestMapping(value = "/listar", method = RequestMethod.GET)
    public String listar(Model model) {
        List<Animal> animais = this.animalService.obterTodos();
        model.addAttribute("animais", animais);
        return "animais.listar.tiles";
    }

    @RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
    public String salvar(Model model) {
        model.addAttribute("animal", new Animal());
        return "animais.cadastrar.tiles";
    }

    @RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
    public String salvar(@ModelAttribute(name = "animal") @Valid Animal animal, BindingResult result) {
        if (result.hasErrors()) {
            return "animais.cadastrar.tiles";
        }
        this.animalService.salvar(animal);
        return "redirect:/animais/listar";
    }

    @RequestMapping(value = "/editar/{id}", method = RequestMethod.GET)
    public String editar(@PathVariable("id") Long id, Model model) {
        Animal animal = this.animalService.obterPorId(id);
        model.addAttribute("animal", animal);
        return "animais.editar.tiles";
    }

    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public String editar(@ModelAttribute(name = "animal") @Valid Animal animal, BindingResult result) {
        if (result.hasErrors()) {
            return "animais.editar.tiles";
        }
        this.animalService.salvar(animal);
        return "redirect:/animais/listar";
    }

    @RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
    public String excluir(@PathVariable("id") Long id) {
        this.animalService.excluir(id);
        return "redirect:/animais/listar";
    }

    @RequestMapping(value = "porNome", method = RequestMethod.GET)
    public @ResponseBody List<Animal> obterPorNome(@RequestParam(name = "nome") String nome) {
        return animalService.obterPorNome(nome);
    }

}
