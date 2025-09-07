#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents custom data.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-custdata
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CUSTDATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of custom data items in the <b>prgCustData</b> array.
     * @type {Integer}
     */
    cCustData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of custom data items.
     * @type {Pointer<CUSTDATAITEM>}
     */
    prgCustData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
