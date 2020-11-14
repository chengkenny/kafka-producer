package com.hsbc.kafka;

import com.hsbc.kafka.service.KafkaProducerService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

//@RunWith(SpringRunner.class)
@SpringBootTest
public class KafkaTest {

    @Autowired
    private KafkaProducerService kafkaProducerService;

    @Test
    public void testProducer(){
        for (int i = 0; i <500 ; i++) {
            kafkaProducerService.sendMessage("datasync","ddacmsp1", "hello kafka, this is sync file..");
        }
    }

}
