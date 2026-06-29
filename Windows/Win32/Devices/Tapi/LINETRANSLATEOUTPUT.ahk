#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINETRANSLATEOUTPUT structure describes the result of an address translation. The lineTranslateAddress function uses this structure.
 * @remarks
 * This structure cannot be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linetranslateoutput
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINETRANSLATEOUTPUT {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size needed for this data structure to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Size dialable string, in bytes, including the terminating <b>NULL</b>.
     */
    dwDialableStringSize : UInt32

    /**
     * Offset from the beginning of this structure to the translated output that can be passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linedial">lineDial</a>, or other function requiring a dialable string. The output is always a <b>null</b>-terminated string. Ancillary fields such as name and subaddress are included in this output string if they were in the input string. This string may contain private information such as calling card numbers. It should not be displayed to the user, to prevent inadvertent visibility to unauthorized persons. The size of the field is specified by <b>dwDialableStringSize</b>.
     */
    dwDialableStringOffset : UInt32

    /**
     * Size of the translated output that can be displayed to the user, including the <b>null</b> terminator, in bytes.
     */
    dwDisplayableStringSize : UInt32

    /**
     * Offset to the translated output that can be displayed to the user for confirmation. It is identical to <b>DialableString</b>, except the calling card digits are replaced with the friendly name of the card enclosed within bracket characters (for example, "[AT&amp;T Card]"), and ancillary fields such as name and subaddress are removed. Use an appropriate message in <b>dwDisplayableStringOffset</b>, because the string might be displayed publicly in the call-status dialog box. This information is also appropriate to include in call logs. The size of the field is specified by <b>dwDisplayableStringSize</b>.
     */
    dwDisplayableStringOffset : UInt32

    /**
     * Country or region code configured in <b>CurrentLocation</b>. This value may be used to control the display by the application of certain user interface elements, for local call progress tone detection, and for other purposes.
     */
    dwCurrentCountry : UInt32

    /**
     * Destination country/region code of the translated address. This value may be passed to the <i>dwCountryCode</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> and other dialing functions (so that the call progress tones of the destination country/region such as a busy signal are properly detected). This field is set to zero if the destination address passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linetranslateaddress">lineTranslateAddress</a> is not in canonical format.
     */
    dwDestCountry : UInt32

    /**
     * Information derived from the translation process, which may assist the application in presenting user-interface elements. This field uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateresult--constants">LINETRANSLATERESULT_ Constants</a>.
     */
    dwTranslateResults : UInt32

}
