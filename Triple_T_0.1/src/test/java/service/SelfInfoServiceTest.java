package service;

import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml","file:src/main/webapp/WEB-INF/spring-mybatis.xml"})


public class SelfInfoServiceTest extends TestCase {
    @Autowired
    SelfInfoService selfInfoService;
    @Test
    public void setSelfInfoService(){
        String email="dongge@qq.com";
        Float gpa=new Float(3.0);
        //selfInfoService.changeSelfInformation(3,email,gpa,null,new Float(5.0));
        selfInfoService.getUserFavourNote(1);
    }

}