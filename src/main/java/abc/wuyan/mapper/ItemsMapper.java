package abc.wuyan.mapper;

import abc.wuyan.model.Items;

import java.util.List;

/**
 * @author wangzhe
 * @date 2020/8/5 11:18
 */
public interface ItemsMapper {

    public List<Items> findAll();

    Items findById(Integer id);

    int insert(Items recode);

    int update(Items recode);

    void deleteById(Integer id);

}
