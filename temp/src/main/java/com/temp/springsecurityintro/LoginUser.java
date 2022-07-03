package com.temp.springsecurityintro;

import java.util.List;

public record LoginUser(String email, String name, String password, List<String> roleList) {
}
