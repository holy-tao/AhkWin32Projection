#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTPAGE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cctl {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<SByte>}
     */
    lpszResourceName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SByte>}
     */
    lpszComponent {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulItemID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<DTCTL>}
     */
    lpctl {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
