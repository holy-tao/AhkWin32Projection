#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/fdi_fci_types/ns-fdi_fci_types-erf
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class ERF extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    erfOper {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    erfType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    fError {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
