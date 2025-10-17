#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LINEDIALPARAMS.ahk

/**
 * The LINECALLINFO structure contains information about a call.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linecallinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINECALLINFO extends Win32Struct
{
    static sizeof => 328

    static packingSize => 8

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
     * Handle to the line device with which this call is associated.
     * @type {Integer}
     */
    hLine {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Device identifier of the line device with which this call is associated.
     * @type {Integer}
     */
    dwLineDeviceID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Address identifier of the address on the line on which this call exists. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @type {Integer}
     */
    dwAddressID {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Current bearer mode of the call. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebearermode--constants">LINEBEARERMODE_ constants</a>.
     * @type {Integer}
     */
    dwBearerMode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Rate of the call's data stream, in bps (bits per second).
     * @type {Integer}
     */
    dwRate {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Media type of the information stream currently on the call. This is the media type as determined by the owner of the call, which is not necessarily the same as that of the last 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-monitormedia">LINE_MONITORMEDIA</a> message. This member is not directly affected by the LINE_MONITORMEDIA messages. This member uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ constants</a>.
     * @type {Integer}
     */
    dwMediaMode {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Not interpreted by the API implementation and service provider. It can be set by any owner application of this call with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetappspecific">lineSetAppSpecific</a> function.
     * @type {Integer}
     */
    dwAppSpecific {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * In some telephony environments, the switch or service provider can assign a unique identifier to each call. This allows the call to be tracked across transfers, forwards, or other events. The domain of these call IDs and their scope is service provider-defined. The <b>dwCallID</b> member makes this unique identifier available to the applications.
     * @type {Integer}
     */
    dwCallID {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Telephony environments that use the call ID often may find it necessary to relate one call to another. The <b>dwRelatedCallID</b> member may be used by the service provider for this purpose.
     * @type {Integer}
     */
    dwRelatedCallID {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Collection of call-related parameters when the call is outgoing. These are the same call parameters specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>, one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallparamflags--constants">LINECALLPARAMFLAGS_ constants</a>.
     * @type {Integer}
     */
    dwCallParamFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * One or more of the LINECALLSTATE_ constants, that indicates the states in which the application can be notified on this call. The <b>dwCallStates</b> member is constant in 
     * <b>LINECALLINFO</b> and does not change depending on the call state.
     * @type {Integer}
     */
    dwCallStates {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Various digit modes. This member is one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ constants</a>, for which monitoring is currently enabled.
     * @type {Integer}
     */
    dwMonitorDigitModes {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Various media types for which monitoring is currently enabled. This member is one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ constants</a>.
     * @type {Integer}
     */
    dwMonitorMediaModes {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Dialing parameters currently in effect on the call, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedialparams">LINEDIALPARAMS</a>. Unless these parameters are set by either 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetcallparams">lineSetCallParams</a>, their values are the same as the defaults used in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure.
     * @type {LINEDIALPARAMS}
     */
    DialParams{
        get {
            if(!this.HasProp("__DialParams"))
                this.__DialParams := LINEDIALPARAMS(64, this)
            return this.__DialParams
        }
    }

    /**
     * Identifies where the call originated. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallorigin--constants">LINECALLORIGIN_ constants</a>.
     * @type {Integer}
     */
    dwOrigin {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Reason why the call occurred. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallreason--constants">LINECALLREASON_ constants</a>.
     * @type {Integer}
     */
    dwReason {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Completion identifier for the incoming call if it is the result of a completion request that terminates. This identifier is meaningful only if <b>dwReason</b> is LINECALLREASON_CALLCOMPLETION.
     * @type {Integer}
     */
    dwCompletionID {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Number of application modules with different call handles with owner privilege for the call.
     * @type {Integer}
     */
    dwNumOwners {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Number of application modules with different call handles with monitor privilege for the call.
     * @type {Integer}
     */
    dwNumMonitors {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Country or region code of the destination party. Zero if unknown.
     * @type {Integer}
     */
    dwCountryCode {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Number of the trunk over which the call is routed. This member is used for both incoming and outgoing calls. The <b>dwTrunk</b> member should be set to 0xFFFFFFFF if it is unknown.
     * @type {Integer}
     */
    dwTrunk {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Determines the validity and content of the caller, or originator, party identifier information. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwCallerIDFlags {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Size of the caller ID number, in bytes.
     * @type {Integer}
     */
    dwCallerIDSize {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the caller party ID number information. The size of the field is specified by <b>dwCallerIDSize</b>.
     * @type {Integer}
     */
    dwCallerIDOffset {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Size of the caller ID name including the null terminator, in bytes.
     * @type {Integer}
     */
    dwCallerIDNameSize {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the caller party ID name information. The size of the field is specified by <b>dwCallerIDNameSize</b>.
     * @type {Integer}
     */
    dwCallerIDNameOffset {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Determines the validity and content of the called-party ID information. The called party corresponds to the originally addressed party. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwCalledIDFlags {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Size of the called-party ID number, in bytes.
     * @type {Integer}
     */
    dwCalledIDSize {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field containing the called-party ID number information. The size of the field is specified by <b>dwCalledIDSize</b>.
     * @type {Integer}
     */
    dwCalledIDOffset {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Size of the called-party ID name including the null terminator, in bytes.
     * @type {Integer}
     */
    dwCalledIDNameSize {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field containing the called-party ID name information. The size of the field is specified by <b>dwCalledIDNameSize</b>.
     * @type {Integer}
     */
    dwCalledIDNameOffset {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Determines the validity and content of the connected party ID information. The connected party is the party that was actually connected to. This may be different from the called-party ID if the call was diverted. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwConnectedIDFlags {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Size of the connected-party ID number, in bytes.
     * @type {Integer}
     */
    dwConnectedIDSize {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the connected-party ID number information. The size of the field is specified by <b>dwConnectedIDSize</b>.
     * @type {Integer}
     */
    dwConnectedIDOffset {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * Size of the connected-party ID name including the null terminator, in bytes.
     * @type {Integer}
     */
    dwConnectedIDNameSize {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the connected-party ID name information. The size of the field is specified by <b>dwConnectedIDNameSize</b>.
     * @type {Integer}
     */
    dwConnectedIDNameOffset {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Determines the validity and content of the redirection party identifier information. The redirection party identifies the address to which the session was redirected. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwRedirectionIDFlags {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Size of the redirection-party ID number, in bytes.
     * @type {Integer}
     */
    dwRedirectionIDSize {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field containing the redirection-party ID number information. The size of the field is specified by <b>dwRedirectionIDSize</b>.
     * @type {Integer}
     */
    dwRedirectionIDOffset {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * Size of the redirection-party ID name, in bytes.
     * @type {Integer}
     */
    dwRedirectionIDNameSize {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field containing the redirection-party ID name information. The size of the field is specified by <b>dwRedirectionIDNameSize</b>.
     * @type {Integer}
     */
    dwRedirectionIDNameOffset {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * Determines the validity and content of the redirecting party identifier information. The redirecting party identifies the address which redirect the session. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallpartyid--constants">LINECALLPARTYID_ constants</a>.
     * @type {Integer}
     */
    dwRedirectingIDFlags {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * Size of the redirecting-party ID number, in bytes.
     * @type {Integer}
     */
    dwRedirectingIDSize {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field containing the redirecting-party ID number information. The size of the field is specified by <b>dwRedirectingIDSize</b>.
     * @type {Integer}
     */
    dwRedirectingIDOffset {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * Size of the redirecting-party ID name including the null terminator, in bytes.
     * @type {Integer}
     */
    dwRedirectingIDNameSize {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field containing the redirecting-party ID name information. The size of the field is specified by <b>dwRedirectingIDNameSize</b>.
     * @type {Integer}
     */
    dwRedirectingIDNameOffset {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * Size of the application name field including the null terminator, in bytes.
     * @type {Integer}
     */
    dwAppNameSize {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding the user-friendly name of the application that first originated, accepted, or answered the call. This is the name that an application can specify in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If the application specifies no such name, then the application's module filename is used instead. The size of the field is specified by <b>dwAppNameSize</b>.
     * @type {Integer}
     */
    dwAppNameOffset {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * Size of the displayable address string including the null terminator, in bytes.
     * @type {Integer}
     */
    dwDisplayableAddressSize {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * Displayable string is used for logging purposes. The information is obtained from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> for functions that initiate calls. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linetranslateaddress">lineTranslateAddress</a> function returns appropriate information to be placed in this field in the <b>dwDisplayableAddressSize</b> and <b>dwDisplayableAddressOffset</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a> structure.
     * @type {Integer}
     */
    dwDisplayableAddressOffset {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * Size of the called-party description field, in bytes.
     * @type {Integer}
     */
    dwCalledPartySize {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field that specifies the user-friendly description of the called party. This information can be specified with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> and can be optionally specified in the <i>lpCallParams</i> parameter whenever a new call is established. It is useful for call logging purposes. The size of the field is specified by <b>dwCalledPartySize</b>.
     * @type {Integer}
     */
    dwCalledPartyOffset {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * Size of the comment field, in bytes.
     * @type {Integer}
     */
    dwCommentSize {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding a comment about the call provided by the application that originated the call using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>. This information can be optionally specified in the <i>lpCallParams</i> parameter whenever a new call is established. The size of the field is specified by <b>dwCommentSize</b>.
     * @type {Integer}
     */
    dwCommentOffset {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * Size of the raw display information, in bytes.
     * @type {Integer}
     */
    dwDisplaySize {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding raw display information. Depending on the telephony environment, a service provider may extract functional information from this member pair for formatting and presentation most appropriate for this telephony configuration. The size of the field is specified by <b>dwDisplaySize</b>.
     * @type {Integer}
     */
    dwDisplayOffset {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * Size of the user-user information, in bytes. If the user-user information is a pointer to a string, the size must include the null terminator.
     * @type {Integer}
     */
    dwUserUserInfoSize {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding user-user information. The protocol discriminator field for the user-user information, if used, appears as the first byte of the data pointed to by <b>dwUserUserInfoOffset</b>, and is accounted for in <b>dwUserUserInfoSize</b>.
     * @type {Integer}
     */
    dwUserUserInfoOffset {
        get => NumGet(this, 252, "uint")
        set => NumPut("uint", value, this, 252)
    }

    /**
     * Size of the high-level compatibility information, in bytes.
     * @type {Integer}
     */
    dwHighLevelCompSize {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding high-level compatibility information. The format of this information is specified by other standards (ISDN Q.931). The size of the field is specified by <b>dwHighLevelCompSize</b>.
     * @type {Integer}
     */
    dwHighLevelCompOffset {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * Size of the low-level compatibility information, in bytes.
     * @type {Integer}
     */
    dwLowLevelCompSize {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding low-level compatibility information. The format of this information is specified by other standards (ISDN Q.931). The size of the field is specified by <b>dwLowLevelCompSize</b>.
     * @type {Integer}
     */
    dwLowLevelCompOffset {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * Size of the charging information, in bytes.
     * @type {Integer}
     */
    dwChargingInfoSize {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding charging information. The format of this information is specified by other standards (ISDN Q.931). The size of the field is specified by <b>dwChargingInfoSize</b>.
     * @type {Integer}
     */
    dwChargingInfoOffset {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * Size of the current terminal modes array, in bytes.
     * @type {Integer}
     */
    dwTerminalModesSize {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * Offset from the beginning of the structure to the variably sized device field containing an array with <b>DWORD</b>-sized entries. Array entries are indexed by terminal identifiers, in the range from zero to one less than <b>dwNumTerminals</b>. Each entry in the array specifies the current terminal modes for the corresponding terminal set with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetterminal">lineSetTerminal</a> function for this call's media stream, as specified by one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermmode--constants">LINETERMMODE_ constants</a>. The size of the array is specified by <b>dwTerminalModesSize</b>.
     * @type {Integer}
     */
    dwTerminalModesOffset {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * Size of the device-specific field, in bytes.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * Offset from the beginning of the structure to the variably-sized field holding device-specific information. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }

    /**
     * Call treatment currently being applied on the call or that is applied when the call enters the next applicable state. Can be zero if call treatments are not supported.
     * @type {Integer}
     */
    dwCallTreatment {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * Size of the application-settable call data, in bytes.
     * @type {Integer}
     */
    dwCallDataSize {
        get => NumGet(this, 300, "uint")
        set => NumPut("uint", value, this, 300)
    }

    /**
     * Offset from the beginning of the structure to the application-settable call data. The size of the field is specified by <b>dwCallDataSize</b>.
     * @type {Integer}
     */
    dwCallDataOffset {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * Size of the quality of service information, in bytes.
     * @type {Integer}
     */
    dwSendingFlowspecSize {
        get => NumGet(this, 308, "uint")
        set => NumPut("uint", value, this, 308)
    }

    /**
     * Offset from the beginning of the structure to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure followed by WinSock provider-specific data, equivalent to what would have been stored in <b>SendingFlowspec</b> in a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure. Specifies the quality of service currently in effect in the sending direction on the call. The provider-specific portion following the <b>FLOWSPEC</b> structure must not contain pointers to other blocks of memory, because TAPI does not know how to marshal the data pointed to by the private pointer(s) and convey it through interprocess communication to the application. The size of the field is specified by <b>dwSendingFlowspecSize</b>.
     * @type {Integer}
     */
    dwSendingFlowspecOffset {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * Size of the quality of service information, in bytes.
     * @type {Integer}
     */
    dwReceivingFlowspecSize {
        get => NumGet(this, 316, "uint")
        set => NumPut("uint", value, this, 316)
    }

    /**
     * Offset from the beginning of the structure to a <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure followed by WinSock provider-specific data, equivalent to what would have been stored in <b>ReceivingFlowspec</b> in a <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure. Specifies the quality of service current in effect in the receiving direction on the call. The provider-specific portion following the <b>FLOWSPEC</b> structure must not contain pointers to other blocks of memory, because TAPI does not know how to marshal the data pointed to by the private pointer(s) and convey it through interprocess communication to the application. The size of the field is specified by <b>dwReceivingFlowspecSize</b>.
     * @type {Integer}
     */
    dwReceivingFlowspecOffset {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }
}
