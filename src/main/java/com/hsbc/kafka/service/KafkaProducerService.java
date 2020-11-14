package com.hsbc.kafka.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.ListenableFutureCallback;

import javax.annotation.Resource;
@Slf4j
@Component
public class KafkaProducerService {

    @Resource
    private KafkaTemplate<String,Object> kafkaTemplate;

    public void sendMessage(String topic, String key, Object object){
        ListenableFuture<SendResult<String, Object>> future = kafkaTemplate.send(topic, key, object);
        future.addCallback(new ListenableFutureCallback<SendResult<String, Object>>() {
            @Override
            public void onFailure(Throwable throwable) {
                log.error("发送消息失败: " + throwable.getMessage());
            }

            @Override
            public void onSuccess(SendResult<String, Object> result) {
                log.info("发送消息成功: " + result.toString());
            }
        });
    }

}
