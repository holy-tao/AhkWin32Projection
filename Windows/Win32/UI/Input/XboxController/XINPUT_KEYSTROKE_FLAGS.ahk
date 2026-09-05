#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class XINPUT_KEYSTROKE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: XINPUT_KEYSTROKE_KEYDOWN
     * @type {Integer (UInt16)}
     */
    static KEYDOWN => 1

    /**
     * Native name: XINPUT_KEYSTROKE_KEYUP
     * @type {Integer (UInt16)}
     */
    static KEYUP => 2

    /**
     * Native name: XINPUT_KEYSTROKE_REPEAT
     * @type {Integer (UInt16)}
     */
    static REPEAT => 4
}
