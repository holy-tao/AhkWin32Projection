#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEADDRESSCAPS structure describes the capabilities of a specified address. The lineGetAddressCaps function and the TSPI_lineGetAddressCaps function return the LINEADDRESSCAPS structure.
 * @remarks
 * 
  * Device-specific extensions should use the <b>DevSpecific</b> (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
  * 
  * Older applications are compiled without this member in the 
  * <b>LINEADDRESSCAPS</b> structure, and using a SIZEOF(LINEADDRESSCAPS) smaller than the new size. The application passes in a <i>dwAPIVersion</i> parameter with the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetaddresscaps">lineGetAddressCaps</a> function, which can be used for guidance by TAPI in handling this situation. If the application passes in a <b>dwTotalSize</b> member less than the size of the fixed portion of the structure as defined in the <b>dwAPIVersion</b> member specified, LINEERR_STRUCTURETOOSMALL is returned. If sufficient memory has been allocated by the application, before calling 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_linegetaddresscaps">TSPI_lineGetAddressCaps</a>, TAPI sets the <b>dwNeededSize</b> and <b>dwUsedSize</b> members to the fixed size of the structure as it existed in the specified API version.
  * 
  * New service providers (that support the new API version) must examine the API version passed in. If the API version is less than the highest version supported by the provider, the service provider must not fill in fields not supported in older API versions, as these would fall in the variable portion of the older structure.
  * 
  * New applications must be cognizant of the API version negotiated, and not examine the contents of fields in the fixed portion beyond the original end of the fixed portion of the structure for the negotiated API version. 
  * 
  * The members <b>dwPredictiveAutoTransferStates</b> through <b>dwAvailableMediaModes</b> are available only to applications that request an API version of 2.0 or later when calling 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetaddresscaps">lineGetAddressCaps</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineaddresscaps
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEADDRESSCAPS extends Win32Struct
{
    static sizeof => 228

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
     * Size for this data structure that is needed to hold all the returned information, in bytes.
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
     * Device identifier of the line device with which this address is associated.
     * @type {Integer}
     */
    dwLineDeviceID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the address field, in bytes.
     * @type {Integer}
     */
    dwAddressSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of the structure to the variably sized address field. The size of the field is specified by <b>dwAddressSize</b>.
     * @type {Integer}
     */
    dwAddressOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Size of the device-specific field, in bytes.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Offset from the beginning of the structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Sharing mode of the address. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresssharing--constants">LINEADDRESSSHARING_ Constants</a>.
     * @type {Integer}
     */
    dwAddressSharing {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Address states changes for which the application may get notified in the LINE_ADDRESSSTATE message. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressstate--constants">LINEADDRESSSTATE_ constants</a>.
     * @type {Integer}
     */
    dwAddressStates {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Call information elements that are meaningful for all calls on this address. An application may get notified about changes in some of these states in 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-callinfo">LINE_CALLINFO</a> messages. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallinfostate--constants">LINECALLINFOSTATE_ constants</a>.
     * @type {Integer}
     */
    dwCallInfoStates {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Party identifier information types that can be provided for calls on this address. The caller is the originator of the session. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwCallerIDFlags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Party identifier information types that can be provided for calls on this address. Here, "called" refers to the original destination. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwCalledIDFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Party identifier information types that can be provided for calls on this address. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwConnectedIDFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Party identifier information types that can be provided for calls on this address. Here, "redirection" is the new destination. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwRedirectionIDFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Party identifier information types that can be provided for calls on this address. Here, "redirecting" is the address which invoked redirection. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwRedirectingIDFlags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Call states that can be reported for calls on this address. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ constants</a>.
     * @type {Integer}
     */
    dwCallStates {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Dial tone modes that can be reported for calls made on this address. This member is meaningful only if the <i>dialtone</i> call state can be reported. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedialtonemode--constants">LINEDIALTONEMODE_ constants</a>.
     * @type {Integer}
     */
    dwDialToneModes {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Busy modes that can be reported for calls made on this address. This member is meaningful only if the <i>busy</i> call state can be reported. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebusymode--constants">LINEBUSYMODE_ constants</a>.
     * @type {Integer}
     */
    dwBusyModes {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Special information types that can be reported for calls made on this address. This member is meaningful only if the <i>specialInfo</i> call state can be reported. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linespecialinfo--constants">LINESPECIALINFO_ constants</a>.
     * @type {Integer}
     */
    dwSpecialInfo {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Disconnect modes that can be reported for calls made on this address. This member is meaningful only if the <i>disconnected</i> call state can be reported. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedisconnectmode--constants">LINEDISCONNECTMODE_ constants</a>.
     * @type {Integer}
     */
    dwDisconnectModes {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Maximum number of active call appearances that the address can handle. This number does not include calls on hold or calls on hold pending transfer or conference.
     * @type {Integer}
     */
    dwMaxNumActiveCalls {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Maximum number of call appearances at the address that can be on hold.
     * @type {Integer}
     */
    dwMaxNumOnHoldCalls {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Maximum number of call appearances at the address that can be on hold pending transfer or conference.
     * @type {Integer}
     */
    dwMaxNumOnHoldPendingCalls {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Maximum number of parties that can join a single conference call on this address.
     * @type {Integer}
     */
    dwMaxNumConference {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Number of parties (including "self") that can be added in a conference call that is initiated as a generic consultation call using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetuptransfer">lineSetupTransfer</a>.
     * @type {Integer}
     */
    dwMaxNumTransConf {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Packed bit flags that describe a variety of address capabilities. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrcapflags--constants">LINEADDRCAPFLAGS_ constants</a>.
     * @type {Integer}
     */
    dwAddrCapFlags {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Switching capabilities or features available for all calls on this address using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallfeature--constants">LINECALLFEATURE_ Constants</a>. This member represents the call-related features that may possibly be available on an address (static availability as opposed to dynamic availability). Invoking a supported feature requires the call to be in the proper state and the underlying line device to be opened in a compatible mode. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the application has the right privileges to the call and the call is in the appropriate state for the operation to be meaningful. This member allows an application to discover which call features can be (and which can never be) supported by the address.
     * @type {Integer}
     */
    dwCallFeatures {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Address's capabilities for removing calls from a conference call. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineremovefromconf--constants">LINEREMOVEFROMCONF_ constants</a>.
     * @type {Integer}
     */
    dwRemoveFromConfCaps {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Uses the LINECALLSTATE_ constants to specify the state of the call after it has been removed from a conference call.
     * @type {Integer}
     */
    dwRemoveFromConfState {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Address's capabilities for resolving transfer requests. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetransfermode--constants">LINETRANSFERMODE_ constants</a>.
     * @type {Integer}
     */
    dwTransferModes {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Different call park modes available at this address. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineparkmode--constants">LINEPARKMODE_ constants</a>.
     * @type {Integer}
     */
    dwParkModes {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Different modes of forwarding available for this address. This member uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">LINEFORWARDMODE_ constants</a>.
     * @type {Integer}
     */
    dwForwardModes {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Maximum number of entries that can be passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineforward">lineForward</a> in the <i>lpForwardList</i> parameter.
     * @type {Integer}
     */
    dwMaxForwardEntries {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Maximum number of entries in the <i>lpForwardList</i> parameter passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineforward">lineForward</a> that can contain forwarding instructions based on a specific caller ID (selective call forwarding). This member is zero if selective call forwarding is not supported.
     * @type {Integer}
     */
    dwMaxSpecificEntries {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Minimum number of rings that can be set to determine when a call is officially considered "no answer."
     * @type {Integer}
     */
    dwMinFwdNumRings {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Maximum number of rings that can be set to determine when a call is officially considered "no answer." If this number of rings cannot be set, then <b>dwMinFwdNumRings</b> and <b>dwMaxNumRings</b> are equal.
     * @type {Integer}
     */
    dwMaxFwdNumRings {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Maximum number of concurrent call completion requests that can be outstanding on this line device. Zero implies that call completion is not available.
     * @type {Integer}
     */
    dwMaxCallCompletions {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Different call conditions under which call completion can be requested. This member uses one or more of the LINECALLCOMPLCOND_ constants.
     * @type {Integer}
     */
    dwCallCompletionConds {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Way in which the call can be completed. This member uses one of the LINECALLCOMPLMODE_ constants.
     * @type {Integer}
     */
    dwCallCompletionModes {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * Number of call completion messages that can be selected from when using the LINECALLCOMPLMODE_MESSAGE option. Individual messages are identified by values in the range zero through one less than <b>dwNumCompletionMessages</b>.
     * @type {Integer}
     */
    dwNumCompletionMessages {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Size of each of the call completion text descriptions specified by <b>dwCompletionMsgTextSize</b> and <b>dwCompletionMsgTextOffset</b>, in bytes.
     * @type {Integer}
     */
    dwCompletionMsgTextEntrySize {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Size of the call completion text, in bytes.
     * @type {Integer}
     */
    dwCompletionMsgTextSize {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Offset from the beginning of this data structure to the variably sized field containing descriptive text about each of the call completion messages. Each message is <b>dwCompletionMsgTextEntrySize</b> bytes long. The string format of these textual descriptions is indicated by <b>dwStringFormat</b> in the line's device capabilities. The size of the field is specified by <b>dwCompletionMsgTextSize</b>.
     * @type {Integer}
     */
    dwCompletionMsgTextOffset {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * Features available for this address using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrfeature--constants">LINEADDRFEATURE_ Constants</a>. Invoking a supported feature requires the address to be in the proper state and the underlying line device to be opened in a compatible mode. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the address is in the appropriate state for the operation to be meaningful. This member allows an application to discover which address features can be (and which can never be) supported by the address.
     * @type {Integer}
     */
    dwAddressFeatures {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * Call state or states upon which a call made by a predictive dialer can be set to automatically transfer the call to another address; one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ Constants</a>. The value 0 indicates automatic transfer based on call state is unavailable.
     * @type {Integer}
     */
    dwPredictiveAutoTransferStates {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * Number of entries in the array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecalltreatmententry">LINECALLTREATMENTENTRY</a> structures delimited by <b>dwCallTreatmentListSize</b> and <b>dwCallTreatmentListOffset</b>.
     * @type {Integer}
     */
    dwNumCallTreatments {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * Size of the call treatment array, in bytes.
     * @type {Integer}
     */
    dwCallTreatmentListSize {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecalltreatmententry">LINECALLTREATMENTENTRY</a> structures the specify the call treatments supported on the address (that can be selected using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetcalltreatment">lineSetCallTreatment</a>). The value is <b>dwNumCallTreatments</b> times SIZEOF(LINECALLTREATMENTENTRY). The size of the field is specified by <b>dwCallTreatmentListSize</b>.
     * @type {Integer}
     */
    dwCallTreatmentListOffset {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * Size of the list of supported device classes, in bytes.
     * @type {Integer}
     */
    dwDeviceClassesSize {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * Offset from the beginning of the structure to a string consisting of the device class identifiers supported on this address for use with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a>. The elements are separated by <b>null</b> characters, and the last class identifier is followed by two <b>null</b> characters. The size of the field is specified by <b>dwDeviceClassesSize</b>.
     * @type {Integer}
     */
    dwDeviceClassesOffset {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * Maximum number of bytes that an application can set in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetcalldata">lineSetCallData</a>.
     * @type {Integer}
     */
    dwMaxCallDataSize {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * Additional switching capabilities or features available for all calls on this address using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallfeature2--constants">LINECALLFEATURE2_ Constants</a>. It is an extension of the <b>dwCallFeatures</b> member.
     * @type {Integer}
     */
    dwCallFeatures2 {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * Maximum value in seconds that can be set in the <b>dwNoAnswerTimeout</b> member in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> when making a call. A value of 0 indicates that automatic abandonment of unanswered calls is not supported by the service provider, or that the timeout value is not adjustable by applications.
     * @type {Integer}
     */
    dwMaxNoAnswerTimeout {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * LINECONNECTEDMODE_ values that can appear in the <b>dwCallStateMode</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallstatus">LINECALLSTATUS</a> and in 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-callstate">LINE_CALLSTATE</a> messages for calls on this address.
     * @type {Integer}
     */
    dwConnectedModes {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * LINEOFFERINGMODE_ values that can appear in the <b>dwCallStateMode</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallstatus">LINECALLSTATUS</a> and in LINE_CALLSTATE messages for calls on this address.
     * @type {Integer}
     */
    dwOfferingModes {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * Media types (modes) that can be invoked on new calls created on this address, when the <b>dwAddressFeatures</b> member indicates that new calls are possible. If this member is zero, it indicates that the service provider either does not know or cannot indicate which media types are available, in which case any or all of the media types indicated in the <b>dwMediaModes</b> member in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> may be available.
     * @type {Integer}
     */
    dwAvailableMediaModes {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }
}
