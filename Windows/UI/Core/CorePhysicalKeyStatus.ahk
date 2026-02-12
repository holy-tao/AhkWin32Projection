#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies the set of physical key status items that can be obtained.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corephysicalkeystatus
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CorePhysicalKeyStatus extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The number of times a key was pressed.  See [Repeat Count](/windows/win32/inputdev/about-keyboard-input#repeat-count) for more info.
     * @type {Integer}
     */
    RepeatCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The scan code for a key that was pressed. See [Scan Code](/windows/win32/inputdev/about-keyboard-input#scan-code) for more info.
     * @type {Integer}
     */
    ScanCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Whether the key is an extended key, such as the right-hand ALT and CTRL keys that appear on an Enhanced 101/102-key keyboard. See [Extended-Key Flag](/windows/win32/inputdev/about-keyboard-input#extended-key-flag) for more info.
     * @type {Boolean}
     */
    IsExtendedKey {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Whether the Alt key (represented by the VirtualKey.Menu value) is currently pressed down. See [Context Code](/windows/win32/inputdev/about-keyboard-input#context-code) for more info.
     * @type {Boolean}
     */
    IsMenuKeyDown {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Whether a key is currently pressed down. See [Previous Key-State Flag](/windows/win32/inputdev/about-keyboard-input#previous-key-state-flag) for more info.
     * @type {Boolean}
     */
    WasKeyDown {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Whether a key has moved from a pressed to a released status. See [Transition-State Flag](/windows/win32/inputdev/about-keyboard-input#transition-state-flag) for more info.
     * @type {Boolean}
     */
    IsKeyReleased {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
