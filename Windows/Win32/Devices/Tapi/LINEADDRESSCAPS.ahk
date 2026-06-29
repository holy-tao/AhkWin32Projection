#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEADDRESSCAPS structure describes the capabilities of a specified address. The lineGetAddressCaps function and the TSPI_lineGetAddressCaps function return the LINEADDRESSCAPS structure.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineaddresscaps
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEADDRESSCAPS {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Device identifier of the line device with which this address is associated.
     */
    dwLineDeviceID : UInt32

    /**
     * Size of the address field, in bytes.
     */
    dwAddressSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized address field. The size of the field is specified by <b>dwAddressSize</b>.
     */
    dwAddressOffset : UInt32

    /**
     * Size of the device-specific field, in bytes.
     */
    dwDevSpecificSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificSize</b>.
     */
    dwDevSpecificOffset : UInt32

    /**
     * Sharing mode of the address. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresssharing--constants">LINEADDRESSSHARING_ Constants</a>.
     */
    dwAddressSharing : UInt32

    /**
     * Address states changes for which the application may get notified in the LINE_ADDRESSSTATE message. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressstate--constants">LINEADDRESSSTATE_ constants</a>.
     */
    dwAddressStates : UInt32

    /**
     * Call information elements that are meaningful for all calls on this address. An application may get notified about changes in some of these states in 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-callinfo">LINE_CALLINFO</a> messages. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallinfostate--constants">LINECALLINFOSTATE_ constants</a>.
     */
    dwCallInfoStates : UInt32

    /**
     * Party identifier information types that can be provided for calls on this address. The caller is the originator of the session. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwCallerIDFlags : UInt32

    /**
     * Party identifier information types that can be provided for calls on this address. Here, "called" refers to the original destination. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwCalledIDFlags : UInt32

    /**
     * Party identifier information types that can be provided for calls on this address. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwConnectedIDFlags : UInt32

    /**
     * Party identifier information types that can be provided for calls on this address. Here, "redirection" is the new destination. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwRedirectionIDFlags : UInt32

    /**
     * Party identifier information types that can be provided for calls on this address. Here, "redirecting" is the address which invoked redirection. One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwRedirectingIDFlags : UInt32

    /**
     * Call states that can be reported for calls on this address. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ constants</a>.
     */
    dwCallStates : UInt32

    /**
     * Dial tone modes that can be reported for calls made on this address. This member is meaningful only if the <i>dialtone</i> call state can be reported. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedialtonemode--constants">LINEDIALTONEMODE_ constants</a>.
     */
    dwDialToneModes : UInt32

    /**
     * Busy modes that can be reported for calls made on this address. This member is meaningful only if the <i>busy</i> call state can be reported. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebusymode--constants">LINEBUSYMODE_ constants</a>.
     */
    dwBusyModes : UInt32

    /**
     * Special information types that can be reported for calls made on this address. This member is meaningful only if the <i>specialInfo</i> call state can be reported. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linespecialinfo--constants">LINESPECIALINFO_ constants</a>.
     */
    dwSpecialInfo : UInt32

    /**
     * Disconnect modes that can be reported for calls made on this address. This member is meaningful only if the <i>disconnected</i> call state can be reported. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedisconnectmode--constants">LINEDISCONNECTMODE_ constants</a>.
     */
    dwDisconnectModes : UInt32

    /**
     * Maximum number of active call appearances that the address can handle. This number does not include calls on hold or calls on hold pending transfer or conference.
     */
    dwMaxNumActiveCalls : UInt32

    /**
     * Maximum number of call appearances at the address that can be on hold.
     */
    dwMaxNumOnHoldCalls : UInt32

    /**
     * Maximum number of call appearances at the address that can be on hold pending transfer or conference.
     */
    dwMaxNumOnHoldPendingCalls : UInt32

    /**
     * Maximum number of parties that can join a single conference call on this address.
     */
    dwMaxNumConference : UInt32

    /**
     * Number of parties (including "self") that can be added in a conference call that is initiated as a generic consultation call using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetuptransfer">lineSetupTransfer</a>.
     */
    dwMaxNumTransConf : UInt32

    /**
     * Packed bit flags that describe a variety of address capabilities. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrcapflags--constants">LINEADDRCAPFLAGS_ constants</a>.
     */
    dwAddrCapFlags : UInt32

    /**
     * Switching capabilities or features available for all calls on this address using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallfeature--constants">LINECALLFEATURE_ Constants</a>. This member represents the call-related features that may possibly be available on an address (static availability as opposed to dynamic availability). Invoking a supported feature requires the call to be in the proper state and the underlying line device to be opened in a compatible mode. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the application has the right privileges to the call and the call is in the appropriate state for the operation to be meaningful. This member allows an application to discover which call features can be (and which can never be) supported by the address.
     */
    dwCallFeatures : UInt32

    /**
     * Address's capabilities for removing calls from a conference call. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineremovefromconf--constants">LINEREMOVEFROMCONF_ constants</a>.
     */
    dwRemoveFromConfCaps : UInt32

    /**
     * Uses the LINECALLSTATE_ constants to specify the state of the call after it has been removed from a conference call.
     */
    dwRemoveFromConfState : UInt32

    /**
     * Address's capabilities for resolving transfer requests. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetransfermode--constants">LINETRANSFERMODE_ constants</a>.
     */
    dwTransferModes : UInt32

    /**
     * Different call park modes available at this address. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineparkmode--constants">LINEPARKMODE_ constants</a>.
     */
    dwParkModes : UInt32

    /**
     * Different modes of forwarding available for this address. This member uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">LINEFORWARDMODE_ constants</a>.
     */
    dwForwardModes : UInt32

    /**
     * Maximum number of entries that can be passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineforward">lineForward</a> in the <i>lpForwardList</i> parameter.
     */
    dwMaxForwardEntries : UInt32

    /**
     * Maximum number of entries in the <i>lpForwardList</i> parameter passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineforward">lineForward</a> that can contain forwarding instructions based on a specific caller ID (selective call forwarding). This member is zero if selective call forwarding is not supported.
     */
    dwMaxSpecificEntries : UInt32

    /**
     * Minimum number of rings that can be set to determine when a call is officially considered "no answer."
     */
    dwMinFwdNumRings : UInt32

    /**
     * Maximum number of rings that can be set to determine when a call is officially considered "no answer." If this number of rings cannot be set, then <b>dwMinFwdNumRings</b> and <b>dwMaxNumRings</b> are equal.
     */
    dwMaxFwdNumRings : UInt32

    /**
     * Maximum number of concurrent call completion requests that can be outstanding on this line device. Zero implies that call completion is not available.
     */
    dwMaxCallCompletions : UInt32

    /**
     * Different call conditions under which call completion can be requested. This member uses one or more of the LINECALLCOMPLCOND_ constants.
     */
    dwCallCompletionConds : UInt32

    /**
     * Way in which the call can be completed. This member uses one of the LINECALLCOMPLMODE_ constants.
     */
    dwCallCompletionModes : UInt32

    /**
     * Number of call completion messages that can be selected from when using the LINECALLCOMPLMODE_MESSAGE option. Individual messages are identified by values in the range zero through one less than <b>dwNumCompletionMessages</b>.
     */
    dwNumCompletionMessages : UInt32

    /**
     * Size of each of the call completion text descriptions specified by <b>dwCompletionMsgTextSize</b> and <b>dwCompletionMsgTextOffset</b>, in bytes.
     */
    dwCompletionMsgTextEntrySize : UInt32

    /**
     * Size of the call completion text, in bytes.
     */
    dwCompletionMsgTextSize : UInt32

    /**
     * Offset from the beginning of this data structure to the variably sized field containing descriptive text about each of the call completion messages. Each message is <b>dwCompletionMsgTextEntrySize</b> bytes long. The string format of these textual descriptions is indicated by <b>dwStringFormat</b> in the line's device capabilities. The size of the field is specified by <b>dwCompletionMsgTextSize</b>.
     */
    dwCompletionMsgTextOffset : UInt32

    /**
     * Features available for this address using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrfeature--constants">LINEADDRFEATURE_ Constants</a>. Invoking a supported feature requires the address to be in the proper state and the underlying line device to be opened in a compatible mode. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the address is in the appropriate state for the operation to be meaningful. This member allows an application to discover which address features can be (and which can never be) supported by the address.
     */
    dwAddressFeatures : UInt32

    /**
     * Call state or states upon which a call made by a predictive dialer can be set to automatically transfer the call to another address; one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ Constants</a>. The value 0 indicates automatic transfer based on call state is unavailable.
     */
    dwPredictiveAutoTransferStates : UInt32

    /**
     * Number of entries in the array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecalltreatmententry">LINECALLTREATMENTENTRY</a> structures delimited by <b>dwCallTreatmentListSize</b> and <b>dwCallTreatmentListOffset</b>.
     */
    dwNumCallTreatments : UInt32

    /**
     * Size of the call treatment array, in bytes.
     */
    dwCallTreatmentListSize : UInt32

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecalltreatmententry">LINECALLTREATMENTENTRY</a> structures the specify the call treatments supported on the address (that can be selected using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetcalltreatment">lineSetCallTreatment</a>). The value is <b>dwNumCallTreatments</b> times SIZEOF(LINECALLTREATMENTENTRY). The size of the field is specified by <b>dwCallTreatmentListSize</b>.
     */
    dwCallTreatmentListOffset : UInt32

    /**
     * Size of the list of supported device classes, in bytes.
     */
    dwDeviceClassesSize : UInt32

    /**
     * Offset from the beginning of the structure to a string consisting of the device class identifiers supported on this address for use with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a>. The elements are separated by <b>null</b> characters, and the last class identifier is followed by two <b>null</b> characters. The size of the field is specified by <b>dwDeviceClassesSize</b>.
     */
    dwDeviceClassesOffset : UInt32

    /**
     * Maximum number of bytes that an application can set in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetcalldata">lineSetCallData</a>.
     */
    dwMaxCallDataSize : UInt32

    /**
     * Additional switching capabilities or features available for all calls on this address using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallfeature2--constants">LINECALLFEATURE2_ Constants</a>. It is an extension of the <b>dwCallFeatures</b> member.
     */
    dwCallFeatures2 : UInt32

    /**
     * Maximum value in seconds that can be set in the <b>dwNoAnswerTimeout</b> member in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> when making a call. A value of 0 indicates that automatic abandonment of unanswered calls is not supported by the service provider, or that the timeout value is not adjustable by applications.
     */
    dwMaxNoAnswerTimeout : UInt32

    /**
     * LINECONNECTEDMODE_ values that can appear in the <b>dwCallStateMode</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallstatus">LINECALLSTATUS</a> and in 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-callstate">LINE_CALLSTATE</a> messages for calls on this address.
     */
    dwConnectedModes : UInt32

    /**
     * LINEOFFERINGMODE_ values that can appear in the <b>dwCallStateMode</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallstatus">LINECALLSTATUS</a> and in LINE_CALLSTATE messages for calls on this address.
     */
    dwOfferingModes : UInt32

    /**
     * Media types (modes) that can be invoked on new calls created on this address, when the <b>dwAddressFeatures</b> member indicates that new calls are possible. If this member is zero, it indicates that the service provider either does not know or cannot indicate which media types are available, in which case any or all of the media types indicated in the <b>dwMediaModes</b> member in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> may be available.
     */
    dwAvailableMediaModes : UInt32

}
