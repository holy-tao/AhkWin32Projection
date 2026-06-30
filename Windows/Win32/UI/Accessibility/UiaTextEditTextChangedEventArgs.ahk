#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\SAFEARRAY.ahk
#Include .\EventArgsType.ahk
#Include .\TextEditChangeType.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
class UiaTextEditTextChangedEventArgs extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {EventArgsType}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EventId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {TextEditChangeType}
     */
    TextEditChangeType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<SAFEARRAY>}
     */
    pTextChange {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
