package br.com.treinaweb.clinicaveterinaria.controllers;

import br.com.treinaweb.clinicaveterinaria.modelos.Animal;
import br.com.treinaweb.clinicaveterinaria.modelos.Prontuario;
import br.com.treinaweb.clinicaveterinaria.services.AnimalService;
import br.com.treinaweb.clinicaveterinaria.services.MedicoService;
import br.com.treinaweb.clinicaveterinaria.services.ProntuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/prontuarios")
public class ProntuarioController {

    @Autowired
    private ProntuarioService prontuarioService;

    @Autowired
    private AnimalService animalService;

    @Autowired
    private MedicoService medicoService;

    @RequestMapping(value = "/listar", method = RequestMethod.GET)
    public String listar(Model model) {
        List<Prontuario> prontuarios = this.prontuarioService.obterTodos();
        model.addAttribute("prontuarios", prontuarios);
        return "prontuarios.listar.tiles";
    }

    @RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
    public String cadastrar(Model model) {
        model.addAttribute("prontuario", new Prontuario());
        model.addAttribute("animais", animalService.obterTodos());
        model.addAttribute("medicos", medicoService.obterTodos());
        return "prontuarios.cadastrar.tiles";
    }

    @RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
    public String cadastrar(@ModelAttribute(name = "prontuario") @Valid Prontuario prontuario, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("animais", animalService.obterTodos());
            model.addAttribute("medicos", medicoService.obterTodos());
            return "prontuarios.cadastrar.tiles";
        }
        this.prontuarioService.salvar(prontuario);
        return "redirect:/prontuarios/listar";
    }

    @RequestMapping(value = "/editar/{id}", method = RequestMethod.GET)
    public String editar(@PathVariable("id") Long id, Model model) {
        Prontuario prontuario = this.prontuarioService.obterPorId(id);
        model.addAttribute("prontuario", prontuario);
        model.addAttribute("animais", animalService.obterTodos());
        model.addAttribute("medicos", medicoService.obterTodos());
        return "prontuarios.editar.tiles";
    }

    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public String editar(@ModelAttribute(name = "prontuario") @Valid Prontuario prontuario, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("animais", animalService.obterTodos());
            model.addAttribute("medicos", medicoService.obterTodos());
            return "prontuarios.editar.tiles";
        }
        this.prontuarioService.salvar(prontuario);
        return "redirect:/prontuarios/listar";
    }

    @RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
    public String excluir(@PathVariable("id") Long id) {
        this.prontuarioService.excluir(id);
        return "redirect:/prontuarios/listar";
    }

    @RequestMapping(value = "/porObservacao", method = RequestMethod.GET)
    public @ResponseBody
    List<Prontuario> obterPorObservacao(@RequestParam(name = "observacao") String observacao) {
        return prontuarioService.obterPorObservacao(observacao);
    }

}
