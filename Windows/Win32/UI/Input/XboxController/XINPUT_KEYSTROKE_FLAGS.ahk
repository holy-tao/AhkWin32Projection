#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_KEYSTROKE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_KEYSTROKE_KEYDOWN => 1

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_KEYSTROKE_KEYUP => 2

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_KEYSTROKE_REPEAT => 4
}
