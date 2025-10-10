#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINETRANSLATEOUTPUT structure describes the result of an address translation. The lineTranslateAddress function uses this structure.
 * @remarks
 * 
  * This structure cannot be extended.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linetranslateoutput
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINETRANSLATEOUTPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size needed for this data structure to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size dialable string, in bytes, including the terminating <b>NULL</b>.
     * @type {Integer}
     */
    dwDialableStringSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset from the beginning of this structure to the translated output that can be passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linedial">lineDial</a>, or other function requiring a dialable string. The output is always a <b>null</b>-terminated string. Ancillary fields such as name and subaddress are included in this output string if they were in the input string. This string may contain private information such as calling card numbers. It should not be displayed to the user, to prevent inadvertent visibility to unauthorized persons. The size of the field is specified by <b>dwDialableStringSize</b>.
     * @type {Integer}
     */
    dwDialableStringOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of the translated output that can be displayed to the user, including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwDisplayableStringSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset to the translated output that can be displayed to the user for confirmation. It is identical to <b>DialableString</b>, except the calling card digits are replaced with the friendly name of the card enclosed within bracket characters (for example, "[AT&amp;T Card]"), and ancillary fields such as name and subaddress are removed. Use an appropriate message in <b>dwDisplayableStringOffset</b>, because the string might be displayed publicly in the call-status dialog box. This information is also appropriate to include in call logs. The size of the field is specified by <b>dwDisplayableStringSize</b>.
     * @type {Integer}
     */
    dwDisplayableStringOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Country or region code configured in <b>CurrentLocation</b>. This value may be used to control the display by the application of certain user interface elements, for local call progress tone detection, and for other purposes.
     * @type {Integer}
     */
    dwCurrentCountry {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Destination country/region code of the translated address. This value may be passed to the <i>dwCountryCode</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> and other dialing functions (so that the call progress tones of the destination country/region such as a busy signal are properly detected). This field is set to zero if the destination address passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linetranslateaddress">lineTranslateAddress</a> is not in canonical format.
     * @type {Integer}
     */
    dwDestCountry {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Information derived from the translation process, which may assist the application in presenting user-interface elements. This field uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateresult--constants">LINETRANSLATERESULT_ Constants</a>.
     * @type {Integer}
     */
    dwTranslateResults {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
