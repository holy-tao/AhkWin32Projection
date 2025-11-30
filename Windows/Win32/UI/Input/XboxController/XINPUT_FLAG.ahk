#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_FLAG extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static XINPUT_FLAG_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XINPUT_FLAG_GAMEPAD => 1
}
