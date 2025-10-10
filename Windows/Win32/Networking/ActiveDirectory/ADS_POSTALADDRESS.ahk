#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_POSTALADDRESS structure is an ADSI representation of the Postal Address attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_postaladdress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_POSTALADDRESS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * An array of six null-terminated Unicode strings that represent the postal address.
     * @type {String}
     */
    PostalAddress {
        get => StrGet(this.ptr + 0, 5, "UTF-16")
        set => StrPut(value, this.ptr + 0, 5, "UTF-16")
    }
}
