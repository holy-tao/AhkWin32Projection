#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MESSAGEBOX_PARAMS.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\UI_TYPE.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class SHOWUIPARAMS extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {UI_TYPE}
     */
    UIType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {MESSAGEBOX_PARAMS}
     */
    MessageBoxParams {
        get {
            if(!this.HasProp("__MessageBoxParams"))
                this.__MessageBoxParams := MESSAGEBOX_PARAMS(8, this)
            return this.__MessageBoxParams
        }
    }
}
