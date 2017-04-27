package br.com.treinaweb.clinicaveterinaria.controllers;

import br.com.treinaweb.clinicaveterinaria.modelos.Animal;
import br.com.treinaweb.clinicaveterinaria.modelos.Medico;
import br.com.treinaweb.clinicaveterinaria.services.MedicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/medicos")
public class MedicoController {

    @Autowired
    private MedicoService medicoService;

    @RequestMapping(value = "/listar", method = RequestMethod.GET)
    public String listar(Model model) {
        List<Medico> medicos = this.medicoService.obterTodos();
        model.addAttribute("medicos", medicos);
        return "medicos.listar.tiles";
    }

    @RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
    public String salvar(Model model) {
        model.addAttribute("medico", new Medico());
        return "medicos.cadastrar.tiles";
    }

    @RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
    public String salvar(@ModelAttribute(name = "medico") @Valid Medico medico, BindingResult result) {
        if (result.hasErrors()) {
            return "medicos.cadastrar.tiles";
        }
        this.medicoService.salvar(medico);
        return "redirect:/medicos/listar";
    }

    @RequestMapping(value = "/editar/{id}", method = RequestMethod.GET)
    public String editar(@PathVariable("id") Long id, Model model) {
        Medico medico = this.medicoService.obterPorId(id);
        model.addAttribute("medico", medico);
        return "medicos.editar.tiles";
    }

    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public String editar(@ModelAttribute(name = "medico") @Valid Medico medico, BindingResult result) {
        if (result.hasErrors()) {
            return "medicos.editar.tiles";
        }
        this.medicoService.salvar(medico);
        return "redirect:/medicos/listar";
    }

    @RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
    public String excluir(@PathVariable("id") Long id) {
        this.medicoService.excluir(id);
        return "redirect:/medicos/listar";
    }

    @RequestMapping(value = "porNome", method = RequestMethod.GET)
    public @ResponseBody
    List<Medico> obterPorNome(@RequestParam(name = "nome") String nome) {
        return medicoService.obterPorNome(nome);
    }

}
