#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\Apis.ahk
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * Selects the next locale identifier in the circular list of loaded locale identifiers maintained by the system.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-activatekeyboardlayout
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class HKL extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    Free(){
        KeyboardAndMouse.UnloadKeyboardLayout(this.Value)
        this.Value := -1
    }
}
