#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hresult
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class HRESULT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
