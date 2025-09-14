#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_FAXNUMBER structure is an ADSI representation of the Facsimile Telephone Number attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_faxnumber
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_FAXNUMBER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The null-terminated Unicode string value that contains the telephone number of the facsimile (fax) machine.
     * @type {Pointer<PWSTR>}
     */
    TelephoneNumber {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of data bits.
     * @type {Integer}
     */
    NumberOfBits {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Optional parameters for the fax machine.
     * @type {Pointer<Byte>}
     */
    Parameters {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
