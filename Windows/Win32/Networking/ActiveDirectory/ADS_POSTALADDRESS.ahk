#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The ADS_POSTALADDRESS structure is an ADSI representation of the Postal Address attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_postaladdress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_POSTALADDRESS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * An array of six null-terminated Unicode strings that represent the postal address.
     * @type {Array<PWSTR>}
     */
    PostalAddress{
        get {
            if(!this.HasProp("__PostalAddressProxyArray"))
                this.__PostalAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, PWSTR, "")
            return this.__PostalAddressProxyArray
        }
    }
}
