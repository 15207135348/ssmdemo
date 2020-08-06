package abc.wuyan.controller;

import abc.wuyan.model.Items;
import abc.wuyan.service.Impl.ItemsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * @author wangzhe
 * @date 2020/8/5 11:46
 */

@Controller
@RequestMapping("items")
public class ItemsController {

    @Autowired
    private ItemsServiceImpl itemsService;

    @RequestMapping("list")
    public String list(Model model) {
//        System.out.println("kkkkk");
        List<Items> itemsList = itemsService.findAll();
        model.addAttribute("itemsList", itemsList);
        return "items/list";
    }

    @RequestMapping("edit")
    public String edit(Integer id, Model model) {
        Items items = itemsService.findById(id);
        model.addAttribute("items", items);
        return "items/edit";
    }

    @RequestMapping("update")
    public String update(Items items) {
        items.setCreatetime(new Date());
        itemsService.insertOrUpdate(items);
        return "redirect:list.do";
    }

    @RequestMapping("delete")
    public String deleteById(Integer id) {
        itemsService.deleteById(id);
        return "redirect:list.do";
    }

    @RequestMapping("add")
    public String add() {
        System.out.println("this is add");
        return "items/add";
    }

    @RequestMapping("insert")
    public String insert(Items items) {
        items.setCreatetime(new Date());
        itemsService.insert(items);
        return "redirect:list.do";
    }

}
