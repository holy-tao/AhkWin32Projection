#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class XINPUT_DEVTYPE extends Win32Enum {

    /**
     * Native name: XINPUT_DEVTYPE_GAMEPAD
     * @type {Integer (Byte)}
     */
    static GAMEPAD => 0x01
}
