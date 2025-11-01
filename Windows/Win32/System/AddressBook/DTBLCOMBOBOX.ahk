#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtblcombobox
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTBLCOMBOBOX extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulbLpszCharsAllowed {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulNumCharsAllowed {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulPRPropertyName {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ulPRTableName {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
