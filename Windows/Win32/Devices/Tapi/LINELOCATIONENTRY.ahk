#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a location used to provide an address translation context.
 * @remarks
 * 
 * This structure cannot be extended.
 * 
 * Older applications are compiled without knowledge of these new fields, and using a SIZEOF LINELOCATIONENTRY smaller than the new size. Because this is an array in the variable portion of a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure, it is imperative that older applications receive 
 * <b>LINELOCATIONENTRY</b> structures in the format they previously expected, or they are not able to index through the array properly. The application passes in a <i>dwAPIVersion</i> parameter with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegettranslatecaps">lineGetTranslateCaps</a> function, which can be used for guidance by TAPI in handling this situation. The 
 * <b>lineGetTranslateCaps</b> function should use the 
 * <b>LINELOCATIONENTRY</b> members and size that match the indicated API version, when building the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure to be returned to the application.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linelocationentry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINELOCATIONENTRY extends Win32Struct
{
    static sizeof => 68

    static packingSize => 4

    /**
     * Permanent. Identifies the location.
     * @type {Integer}
     */
    dwPermanentLocationID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size, in characters,  of a <b>null</b>-terminated location name string including the <b>null</b>-terminating character.
     * @type {Integer}
     */
    dwLocationNameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset size, specified in  <b>dwLocationNameSize</b>, from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure (that contains this entry) to a <b>null</b>-terminated string that describes the location in a user-friendly manner.
     * @type {Integer}
     */
    dwLocationNameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Country or region code of the location.
     * @type {Integer}
     */
    dwCountryCode {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size, in characters, of the <b>null</b>-terminated city code string, including the <b>null</b>-terminating character.
     * @type {Integer}
     */
    dwCityCodeSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset, specified in <b>dwCityCodeSize</b>,  from the beginning of this structure to a <b>null</b>-terminated string specifying the city/area code associated with the location. This information, with the country or region code, can be used by applications to "default" entry fields for the user when entering phone numbers, to encourage the entry of proper canonical numbers.
     * @type {Integer}
     */
    dwCityCodeOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Preferred calling card when dialing from this location.
     * @type {Integer}
     */
    dwPreferredCardID {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Size, in bytes, of the local access code string, including the <b>null</b> terminator.
     * @type {Integer}
     */
    dwLocalAccessCodeSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Offset size, specified in <b>dwLocalAccessCodeSize</b>, from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure to a <b>null</b>-terminated string containing the access code to be dialed before calls to addresses in the local calling area.
     * @type {Integer}
     */
    dwLocalAccessCodeOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Size, in bytes, of the long distance access code, including the <b>null</b> terminator.
     * @type {Integer}
     */
    dwLongDistanceAccessCodeSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Offset size, specified in <b>dwLongDistanceAccessCodeSize</b>, from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure to a <b>null</b>-terminated string containing the access code to be dialed before calls to addresses outside the local calling area.
     * @type {Integer}
     */
    dwLongDistanceAccessCodeOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Size, in bytes, of the toll prefix, including the <b>null</b> terminator.
     * @type {Integer}
     */
    dwTollPrefixListSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Offset size, specified in <b>dwTollPrefixListSize</b>, from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure to a <b>null</b>-terminated string containing the toll prefix list for the location. The string contains only prefixes consisting of the digits "0" through "9", separated from each other by a single "," (comma) character.
     * @type {Integer}
     */
    dwTollPrefixListOffset {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Identifier of the country/region selected for the location. This can be used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetcountry">lineGetCountry</a> function to obtain additional information about the specific country/region, such as the country/region name (the <b>dwCountryCode</b> member cannot be used for this purpose because country/region codes are not unique).
     * @type {Integer}
     */
    dwCountryID {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Options in effect for this location, with values taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linelocationoption--constants">LINELOCATIONOPTION_ Constants</a>.
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Size, in bytes, of the cancel-call-waiting string.
     * @type {Integer}
     */
    dwCancelCallWaitingSize {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Offset size, specified in <b>dwCancelCallWaitingSize</b>, from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure to a <b>null</b>-terminated string containing the dial digits and modifier characters that should be prefixed to the dialable string (after the pulse/tone character) when an application sets the LINETRANSLATEOPTION_CANCELCALLWAITING bit in the <i>dwTranslateOptions</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linetranslateaddress">lineTranslateAddress</a>. If no prefix is defined, <b>dwCancelCallWaitingSize</b> may be set to zero, or 1, and <b>dwCancelCallWaitingOffset</b> may point to an empty string (single <b>NULL</b> byte).
     * @type {Integer}
     */
    dwCancelCallWaitingOffset {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
