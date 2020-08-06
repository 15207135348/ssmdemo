package abc.wuyan.service;

import abc.wuyan.model.Items;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangzhe
 * @date 2020/8/5 11:25
 */

@Service
public interface IItemsService {

    public List<Items> findAll();

    public Items findById(Integer id);

    public void deleteById(Integer id);

    public void insertOrUpdate(Items items);

    public void insert(Items items);

}
