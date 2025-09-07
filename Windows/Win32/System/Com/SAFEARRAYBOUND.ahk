#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the bounds of one dimension of the array.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearraybound
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class SAFEARRAYBOUND extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of elements in the dimension.
     * @type {Integer}
     */
    cElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The lower bound of the dimension.
     * @type {Integer}
     */
    lLbound {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
