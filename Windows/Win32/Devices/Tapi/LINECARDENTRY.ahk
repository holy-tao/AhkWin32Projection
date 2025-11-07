#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINECARDENTRY structure describes a calling card. The LINETRANSLATECAPS structure can contain an array of LINECARDENTRY structures.
 * @remarks
 * 
 * Older applications are compiled without knowledge of these new fields, and using a SIZEOF(LINECARDENTRY) smaller than the new size. Because this is an array in the variable portion of a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure, it is imperative that older applications receive 
 * <b>LINECARDENTRY</b> structures in the format they previously expected, or they are not able to index properly through the array. The application passes in a <i>dwAPIVersion</i> parameter with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegettranslatecaps">lineGetTranslateCaps</a> function, which can be used for guidance by TAPI in handling this situation. The 
 * <b>lineGetTranslateCaps</b> function should use the 
 * <b>LINECARDENTRY</b> fields and size that match the indicated API version, when building the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure to be returned to the application.
 * 
 * This structure may not be extended.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linecardentry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINECARDENTRY extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Permanent identifier that identifies the card.
     * @type {Integer}
     */
    dwPermanentCardID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the card name string including <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwCardNameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that describes the card in a user-friendly manner. The size of the field is specified by <b>dwCardNameSize</b>.
     * @type {Integer}
     */
    dwCardNameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of digits in the existing card number. The card number itself is not returned for security reasons (it is stored in scrambled form by TAPI). The application can use this to insert filler bytes into a text control in "password" mode to show that a number exists.
     * @type {Integer}
     */
    dwCardNumberDigits {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the same-area dialing rule including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwSameAreaRuleSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure to the dialing rule defined for calls to numbers in the same area code. The rule is a <b>null</b>-terminated string. The size of the field is specified by <b>dwSameAreaRuleSize</b>.
     * @type {Integer}
     */
    dwSameAreaRuleOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Size of the long distance dialing rule including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwLongDistanceRuleSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Offset from the beginning of the structure to the dialing rule defined for calls to numbers in the other areas in the same country/region. The rule is a <b>null</b>-terminated string. The size of the field is specified by <b>dwLongDistanceRuleSize</b>.
     * @type {Integer}
     */
    dwLongDistanceRuleOffset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Size of the international dialing rule including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwInternationalRuleSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Offset from the beginning of the structure to the dialing rule defined for calls to numbers in other countries/regions. The rule is a <b>null</b>-terminated string. The size of the field is specified by <b>dwInternationalRuleSize</b>.
     * @type {Integer}
     */
    dwInternationalRuleOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Indicates other settings associated with this calling card, using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecardoption--constants">LINECARDOPTION_ Constants</a>.
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
