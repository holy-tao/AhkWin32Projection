#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LINEDIALPARAMS.ahk" { LINEDIALPARAMS }

/**
 * The LINECALLINFO structure contains information about a call.
 * @remarks
 * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
 * 
 * The 
 * <b>LINECALLINFO</b> data structure contains relatively fixed information about a call. This structure is returned with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetcallinfo">lineGetCallInfo</a>. When information items in this data structure have changed, a LINE_CALLINFO message is sent to the application. A parameter to this message is the information item or field that changed.
 * 
 * The members <b>dwCallTreatment</b> through <b>dwReceivingFlowspecOffset</b> are available only to applications that open the line device with an API version of 2.0 or later.
 * 
 * <div class="alert"><b>Note</b>  The preferred format for specification of the contents of the <b>dwCallID</b> field and the other five similar fields (<b>dwCallerIDFlag</b>, <b>dwCallerIDSize</b>, <b>dwCallerIDOffset</b>, <b>dwCallerIDNameSize</b>, and <b>dwCallerIDNameOffset</b>) is the TAPI canonical number format. For example, a ICLID of "4258828080" received from the switch should be converted to "+1 (425) 8828080" before being placed in the 
 * <b>LINECALLINFO</b> structure. This standardized format facilitates searching of databases and callback functions implemented in applications.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linecallinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINECALLINFO {
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
     * Handle to the line device with which this call is associated.
     */
    hLine : UInt32

    /**
     * Device identifier of the line device with which this call is associated.
     */
    dwLineDeviceID : UInt32

    /**
     * Address identifier of the address on the line on which this call exists. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     */
    dwAddressID : UInt32

    /**
     * Current bearer mode of the call. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebearermode--constants">LINEBEARERMODE_ constants</a>.
     */
    dwBearerMode : UInt32

    /**
     * Rate of the call's data stream, in bps (bits per second).
     */
    dwRate : UInt32

    /**
     * Media type of the information stream currently on the call. This is the media type as determined by the owner of the call, which is not necessarily the same as that of the last 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-monitormedia">LINE_MONITORMEDIA</a> message. This member is not directly affected by the LINE_MONITORMEDIA messages. This member uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ constants</a>.
     */
    dwMediaMode : UInt32

    /**
     * Not interpreted by the API implementation and service provider. It can be set by any owner application of this call with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetappspecific">lineSetAppSpecific</a> function.
     */
    dwAppSpecific : UInt32

    /**
     * In some telephony environments, the switch or service provider can assign a unique identifier to each call. This allows the call to be tracked across transfers, forwards, or other events. The domain of these call IDs and their scope is service provider-defined. The <b>dwCallID</b> member makes this unique identifier available to the applications.
     */
    dwCallID : UInt32

    /**
     * Telephony environments that use the call ID often may find it necessary to relate one call to another. The <b>dwRelatedCallID</b> member may be used by the service provider for this purpose.
     */
    dwRelatedCallID : UInt32

    /**
     * Collection of call-related parameters when the call is outgoing. These are the same call parameters specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>, one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallparamflags--constants">LINECALLPARAMFLAGS_ constants</a>.
     */
    dwCallParamFlags : UInt32

    /**
     * One or more of the LINECALLSTATE_ constants, that indicates the states in which the application can be notified on this call. The <b>dwCallStates</b> member is constant in 
     * <b>LINECALLINFO</b> and does not change depending on the call state.
     */
    dwCallStates : UInt32

    /**
     * Various digit modes. This member is one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ constants</a>, for which monitoring is currently enabled.
     */
    dwMonitorDigitModes : UInt32

    /**
     * Various media types for which monitoring is currently enabled. This member is one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ constants</a>.
     */
    dwMonitorMediaModes : UInt32

    /**
     * Dialing parameters currently in effect on the call, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedialparams">LINEDIALPARAMS</a>. Unless these parameters are set by either 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetcallparams">lineSetCallParams</a>, their values are the same as the defaults used in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure.
     */
    DialParams : LINEDIALPARAMS

    /**
     * Identifies where the call originated. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallorigin--constants">LINECALLORIGIN_ constants</a>.
     */
    dwOrigin : UInt32

    /**
     * Reason why the call occurred. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallreason--constants">LINECALLREASON_ constants</a>.
     */
    dwReason : UInt32

    /**
     * Completion identifier for the incoming call if it is the result of a completion request that terminates. This identifier is meaningful only if <b>dwReason</b> is LINECALLREASON_CALLCOMPLETION.
     */
    dwCompletionID : UInt32

    /**
     * Number of application modules with different call handles with owner privilege for the call.
     */
    dwNumOwners : UInt32

    /**
     * Number of application modules with different call handles with monitor privilege for the call.
     */
    dwNumMonitors : UInt32

    /**
     * Country or region code of the destination party. Zero if unknown.
     */
    dwCountryCode : UInt32

    /**
     * Number of the trunk over which the call is routed. This member is used for both incoming and outgoing calls. The <b>dwTrunk</b> member should be set to 0xFFFFFFFF if it is unknown.
     */
    dwTrunk : UInt32

    /**
     * Determines the validity and content of the caller, or originator, party identifier information. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwCallerIDFlags : UInt32

    /**
     * Size of the caller ID number, in bytes.
     */
    dwCallerIDSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized field containing the caller party ID number information. The size of the field is specified by <b>dwCallerIDSize</b>.
     */
    dwCallerIDOffset : UInt32

    /**
     * Size of the caller ID name including the null terminator, in bytes.
     */
    dwCallerIDNameSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized field containing the caller party ID name information. The size of the field is specified by <b>dwCallerIDNameSize</b>.
     */
    dwCallerIDNameOffset : UInt32

    /**
     * Determines the validity and content of the called-party ID information. The called party corresponds to the originally addressed party. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwCalledIDFlags : UInt32

    /**
     * Size of the called-party ID number, in bytes.
     */
    dwCalledIDSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field containing the called-party ID number information. The size of the field is specified by <b>dwCalledIDSize</b>.
     */
    dwCalledIDOffset : UInt32

    /**
     * Size of the called-party ID name including the null terminator, in bytes.
     */
    dwCalledIDNameSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field containing the called-party ID name information. The size of the field is specified by <b>dwCalledIDNameSize</b>.
     */
    dwCalledIDNameOffset : UInt32

    /**
     * Determines the validity and content of the connected party ID information. The connected party is the party that was actually connected to. This may be different from the called-party ID if the call was diverted. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwConnectedIDFlags : UInt32

    /**
     * Size of the connected-party ID number, in bytes.
     */
    dwConnectedIDSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized field containing the connected-party ID number information. The size of the field is specified by <b>dwConnectedIDSize</b>.
     */
    dwConnectedIDOffset : UInt32

    /**
     * Size of the connected-party ID name including the null terminator, in bytes.
     */
    dwConnectedIDNameSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized field containing the connected-party ID name information. The size of the field is specified by <b>dwConnectedIDNameSize</b>.
     */
    dwConnectedIDNameOffset : UInt32

    /**
     * Determines the validity and content of the redirection party identifier information. The redirection party identifies the address to which the session was redirected. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwRedirectionIDFlags : UInt32

    /**
     * Size of the redirection-party ID number, in bytes.
     */
    dwRedirectionIDSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field containing the redirection-party ID number information. The size of the field is specified by <b>dwRedirectionIDSize</b>.
     */
    dwRedirectionIDOffset : UInt32

    /**
     * Size of the redirection-party ID name, in bytes.
     */
    dwRedirectionIDNameSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field containing the redirection-party ID name information. The size of the field is specified by <b>dwRedirectionIDNameSize</b>.
     */
    dwRedirectionIDNameOffset : UInt32

    /**
     * Determines the validity and content of the redirecting party identifier information. The redirecting party identifies the address which redirect the session. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     */
    dwRedirectingIDFlags : UInt32

    /**
     * Size of the redirecting-party ID number, in bytes.
     */
    dwRedirectingIDSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field containing the redirecting-party ID number information. The size of the field is specified by <b>dwRedirectingIDSize</b>.
     */
    dwRedirectingIDOffset : UInt32

    /**
     * Size of the redirecting-party ID name including the null terminator, in bytes.
     */
    dwRedirectingIDNameSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field containing the redirecting-party ID name information. The size of the field is specified by <b>dwRedirectingIDNameSize</b>.
     */
    dwRedirectingIDNameOffset : UInt32

    /**
     * Size of the application name field including the null terminator, in bytes.
     */
    dwAppNameSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field holding the user-friendly name of the application that first originated, accepted, or answered the call. This is the name that an application can specify in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If the application specifies no such name, then the application's module filename is used instead. The size of the field is specified by <b>dwAppNameSize</b>.
     */
    dwAppNameOffset : UInt32

    /**
     * Size of the displayable address string including the null terminator, in bytes.
     */
    dwDisplayableAddressSize : UInt32

    /**
     * Displayable string is used for logging purposes. The information is obtained from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> for functions that initiate calls. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linetranslateaddress">lineTranslateAddress</a> function returns appropriate information to be placed in this field in the <b>dwDisplayableAddressSize</b> and <b>dwDisplayableAddressOffset</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a> structure.
     */
    dwDisplayableAddressOffset : UInt32

    /**
     * Size of the called-party description field, in bytes.
     */
    dwCalledPartySize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field that specifies the user-friendly description of the called party. This information can be specified with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> and can be optionally specified in the <i>lpCallParams</i> parameter whenever a new call is established. It is useful for call logging purposes. The size of the field is specified by <b>dwCalledPartySize</b>.
     */
    dwCalledPartyOffset : UInt32

    /**
     * Size of the comment field, in bytes.
     */
    dwCommentSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field holding a comment about the call provided by the application that originated the call using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>. This information can be optionally specified in the <i>lpCallParams</i> parameter whenever a new call is established. The size of the field is specified by <b>dwCommentSize</b>.
     */
    dwCommentOffset : UInt32

    /**
     * Size of the raw display information, in bytes.
     */
    dwDisplaySize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field holding raw display information. Depending on the telephony environment, a service provider may extract functional information from this member pair for formatting and presentation most appropriate for this telephony configuration. The size of the field is specified by <b>dwDisplaySize</b>.
     */
    dwDisplayOffset : UInt32

    /**
     * Size of the user-user information, in bytes. If the user-user information is a pointer to a string, the size must include the null terminator.
     */
    dwUserUserInfoSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field holding user-user information. The protocol discriminator field for the user-user information, if used, appears as the first byte of the data pointed to by <b>dwUserUserInfoOffset</b>, and is accounted for in <b>dwUserUserInfoSize</b>.
     */
    dwUserUserInfoOffset : UInt32

    /**
     * Size of the high-level compatibility information, in bytes.
     */
    dwHighLevelCompSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field holding high-level compatibility information. The format of this information is specified by other standards (ISDN Q.931). The size of the field is specified by <b>dwHighLevelCompSize</b>.
     */
    dwHighLevelCompOffset : UInt32

    /**
     * Size of the low-level compatibility information, in bytes.
     */
    dwLowLevelCompSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field holding low-level compatibility information. The format of this information is specified by other standards (ISDN Q.931). The size of the field is specified by <b>dwLowLevelCompSize</b>.
     */
    dwLowLevelCompOffset : UInt32

    /**
     * Size of the charging information, in bytes.
     */
    dwChargingInfoSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field holding charging information. The format of this information is specified by other standards (ISDN Q.931). The size of the field is specified by <b>dwChargingInfoSize</b>.
     */
    dwChargingInfoOffset : UInt32

    /**
     * Size of the current terminal modes array, in bytes.
     */
    dwTerminalModesSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized device field containing an array with <b>DWORD</b>-sized entries. Array entries are indexed by terminal identifiers, in the range from zero to one less than <b>dwNumTerminals</b>. Each entry in the array specifies the current terminal modes for the corresponding terminal set with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetterminal">lineSetTerminal</a> function for this call's media stream, as specified by one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermmode--constants">LINETERMMODE_ constants</a>. The size of the array is specified by <b>dwTerminalModesSize</b>.
     */
    dwTerminalModesOffset : UInt32

    /**
     * Size of the device-specific field, in bytes.
     */
    dwDevSpecificSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably-sized field holding device-specific information. The size of the field is specified by <b>dwDevSpecificSize</b>.
     */
    dwDevSpecificOffset : UInt32

    /**
     * Call treatment currently being applied on the call or that is applied when the call enters the next applicable state. Can be zero if call treatments are not supported.
     */
    dwCallTreatment : UInt32

    /**
     * Size of the application-settable call data, in bytes.
     */
    dwCallDataSize : UInt32

    /**
     * Offset from the beginning of the structure to the application-settable call data. The size of the field is specified by <b>dwCallDataSize</b>.
     */
    dwCallDataOffset : UInt32

    /**
     * Size of the quality of service information, in bytes.
     */
    dwSendingFlowspecSize : UInt32

    /**
     * Offset from the beginning of the structure to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure followed by WinSock provider-specific data, equivalent to what would have been stored in <b>SendingFlowspec</b> in a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure. Specifies the quality of service currently in effect in the sending direction on the call. The provider-specific portion following the <b>FLOWSPEC</b> structure must not contain pointers to other blocks of memory, because TAPI does not know how to marshal the data pointed to by the private pointer(s) and convey it through interprocess communication to the application. The size of the field is specified by <b>dwSendingFlowspecSize</b>.
     */
    dwSendingFlowspecOffset : UInt32

    /**
     * Size of the quality of service information, in bytes.
     */
    dwReceivingFlowspecSize : UInt32

    /**
     * Offset from the beginning of the structure to a <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure followed by WinSock provider-specific data, equivalent to what would have been stored in <b>ReceivingFlowspec</b> in a <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure. Specifies the quality of service current in effect in the receiving direction on the call. The provider-specific portion following the <b>FLOWSPEC</b> structure must not contain pointers to other blocks of memory, because TAPI does not know how to marshal the data pointed to by the private pointer(s) and convey it through interprocess communication to the application. The size of the field is specified by <b>dwReceivingFlowspecSize</b>.
     */
    dwReceivingFlowspecOffset : UInt32

}
