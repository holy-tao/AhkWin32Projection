#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the product activation information.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ns-slpublic-sl_activation_info_header
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SL_ACTIVATION_INFO_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>SL_ACTIVATION_TYPE</b>
     * 
     * The activation type.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 8
    }
}
