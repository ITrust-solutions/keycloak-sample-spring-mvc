package pl.konrad.keycloaksamplespringmvc.api;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestApiController {

    @GetMapping("/user")
    public ResponseEntity<String> testAuthentication(){
        return ResponseEntity.ok("authenticated!");
    }

    @GetMapping("/admin")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<String> testAdminEndpoint(){
        return ResponseEntity.ok("you are admin!");
    }

    @GetMapping("/permitAll")
    public ResponseEntity<String> testPermitAll(){
        return ResponseEntity.ok("permitAll works");
    }

}
