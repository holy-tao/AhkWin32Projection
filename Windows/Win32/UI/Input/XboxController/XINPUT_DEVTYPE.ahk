#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_DEVTYPE extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static XINPUT_DEVTYPE_GAMEPAD => 0x01
}
