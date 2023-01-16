package com.example.ajax.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class BoardDto {

    private int id;
    private String title;
    private String content;
    private String icode;
    private String cmd;
}
