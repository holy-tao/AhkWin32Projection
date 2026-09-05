#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class XINPUT_FLAG extends Win32BitflagEnum {

    /**
     * Native name: XINPUT_FLAG_ALL
     * @type {Integer (UInt32)}
     */
    static ALL => 0

    /**
     * Native name: XINPUT_FLAG_GAMEPAD
     * @type {Integer (UInt32)}
     */
    static GAMEPAD => 1
}
