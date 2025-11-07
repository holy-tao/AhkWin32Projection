#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LINEDIALPARAMS.ahk

/**
 * The LINECALLPARAMS structure describes parameters supplied when making calls using the lineMakeCall and TSPI_lineMakeCall functions. The LINECALLPARAMS structure is also used as a parameter in other operations, such as the lineOpen function.
 * @remarks
 * 
 * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
 * 
 * This structure is used as a parameter to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> when setting up a call. Its fields allow the application to specify the quality of service requested from the network as well as a variety of ISDN call-setup parameters. If no 
 * <b>LINECALLPARAMS</b> structure is supplied to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>, a default POTS voice-grade call is requested with the default values listed above.
 * 
 * <div class="alert"><b>Note</b>  The fields <b>DialParams</b> through <b>dwDevSpecificOffset</b> are ignored when an <i>lpCallParams</i> parameter is specified with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineopen">lineOpen</a> function.</div>
 * <div> </div>
 * The members <b>dwPredictiveAutoTransferStates</b> through <b>dwCallingPartyIDOffset</b> are available only to applications that open the line device with an API version of 2.0 or later.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linecallparams
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINECALLPARAMS extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * Total size allocated to this data structure, in bytes. This size should be big enough to hold all the fixed and variably sized portions of this data structure.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Bearer mode for the call. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebearermode--constants">LINEBEARERMODE_ constants</a>. 
     * 
     * 
     * 
     * 
     * If <b>dwBearerMode</b> is zero, the default value is LINEBEARERMODE_VOICE.
     * @type {Integer}
     */
    dwBearerMode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Minimum data rate requested for the call's data stream, in bps (bits per second).
     * @type {Integer}
     */
    dwMinRate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Maximum data rate requested for the call's data stream, in bps (bits per second). When making a call, the service provider attempts to provide the highest available rate in the requested range (<b>dwMinRate</b> to <b>dwMaxRate</b>). If a specific data rate is required, both <b>dwMinRate</b> and <b>dwMaxRate</b> should be set to that value. If an application works best with one rate but is able to degrade to lower rates, the application should specify these as the maximum and minimum rates, respectively. If <b>dwMaxRate</b> is zero, the default value is as specified by the <b>dwMaxRate</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure. This is the maximum rate supported by the device.
     * @type {Integer}
     */
    dwMaxRate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Expected media type of the call. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ constants</a>. 
     * 
     * 
     * 
     * 
     * If <b>dwMediaMode</b> is zero, the default value is LINEMEDIAMODE_INTERACTIVEVOICE.
     * @type {Integer}
     */
    dwMediaMode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Collection of Boolean call-setup parameters. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallparamflags--constants">LINECALLPARAMFLAGS_ constants</a>.
     * @type {Integer}
     */
    dwCallParamFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Mode by which the originating address is specified.  This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressmode--constants">LINEADDRESSMODE_ constants</a>.
     * 
     * <div class="alert"><b>Note</b>  The <b>dwAddressMode</b> member cannot be LINEADDRESSMODE_ADDRESSID for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineopen">lineOpen</a> function call. However, this restriction does not apply to <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwAddressMode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Address identifier of the originating address if <b>dwAddressMode</b> is set to LINEADDRESSMODE_ADDRESSID. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @type {Integer}
     */
    dwAddressID {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Dial parameters to be used on this call, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedialparams">LINEDIALPARAMS</a>. When a value of 0 is specified for this field, the default value for the field is used as indicated in the <b>DefaultDialParams</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure. If a nonzero value is specified for a field that is outside the range specified by the corresponding fields in <b>MinDialParams</b> and <b>MaxDialParams</b> in the 
     * <b>LINEDEVCAPS</b> structure, the nearest value within the valid range is used instead.
     * @type {LINEDIALPARAMS}
     */
    DialParams{
        get {
            if(!this.HasProp("__DialParams"))
                this.__DialParams := LINEDIALPARAMS(32, this)
            return this.__DialParams
        }
    }

    /**
     * Size of the originating address field, in bytes.
     * @type {Integer}
     */
    dwOrigAddressSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding the originating address. The format of this address is dependent on the <b>dwAddressMode</b> member. The size of the field is specified by <b>dwOrigAddressSize</b>.
     * @type {Integer}
     */
    dwOrigAddressOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Size of the displayable string including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwDisplayableAddressSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Displayable string used for logging purposes. The content of these members is recorded in the <b>dwDisplayableAddressOffset</b> and <b>dwDisplayableAddressSize</b> members of the call's LINECALLINFO message. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linetranslateaddress">lineTranslateAddress</a> function returns appropriate information to be placed in this field in the <b>dwDisplayableAddressSize</b> and <b>dwDisplayableAddressOffset</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a> structure. The size of the field is specified by <b>dwDisplayableAddressSize</b>.
     * @type {Integer}
     */
    dwDisplayableAddressOffset {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Size of the called-party information, in bytes.
     * @type {Integer}
     */
    dwCalledPartySize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Offset from the beginning of the structure to to the variably sized field holding called-party information. This information can be specified by the application that makes the call and is made available in the call's information structure for logging purposes. The format of this field is that of <b>dwStringFormat</b>, as specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>. The size of the field is specified by <b>dwCalledPartySize</b>.
     * @type {Integer}
     */
    dwCalledPartyOffset {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Size of the call comment field, in bytes.
     * @type {Integer}
     */
    dwCommentSize {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding comments about the call. This information can be specified by the application that makes the call and is made available in the call's information structure for logging purposes. The format of this field is that of <b>dwStringFormat</b>, as specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>. The size of the field is specified by <b>dwCommentSize</b>.
     * @type {Integer}
     */
    dwCommentOffset {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Size of the user-user information including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwUserUserInfoSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding user-user information. The protocol discriminator field for the user-user information, if required, should appear as the first byte of the data pointed to by <b>dwUserUserInfoOffset</b>, and must be accounted for in <b>dwUserUserInfoSize</b>.
     * @type {Integer}
     */
    dwUserUserInfoOffset {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Size of the high-level compatibility information, in bytes.
     * @type {Integer}
     */
    dwHighLevelCompSize {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding high-level compatibility information. The size of the field is specified by <b>dwHighLevelCompSize</b>.
     * @type {Integer}
     */
    dwHighLevelCompOffset {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Size of the low-level compatibility information, in bytes.
     * @type {Integer}
     */
    dwLowLevelCompSize {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding low-level compatibility information. The size of the field is specified by <b>dwLowLevelCompSize</b>.
     * @type {Integer}
     */
    dwLowLevelCompOffset {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Size of the device-specific information, in bytes.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field holding device-specific information. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ constants</a>, entry into which causes the call to be blind-transferred to the specified target address. Set to zero if automatic transfer is not desired.
     * @type {Integer}
     */
    dwPredictiveAutoTransferStates {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Size of the target dialable address string including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwTargetAddressSize {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Offset from the beginning of the structure to a string specifying the target dialable address (not <b>dwAddressID</b>); used in the case of certain automatic actions. In the case of predictive dialing, specifies the address to which the call should be automatically transferred. The size of the string is specified by <b>dwTargetAddressSize</b>. 
     * 
     * 
     * 
     * 
     * This is essentially the same string that would be passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineblindtransfer">lineBlindTransfer</a> if automatic transfer were not being used. Set to zero if automatic transfer is not desired. In the case of a No Hold Conference, specifies the address that should be conferenced to the call. In the case of a One Step Transfer, specifies the address to dial on the consultation call.
     * @type {Integer}
     */
    dwTargetAddressOffset {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Size of the quality of service information, in bytes.
     * @type {Integer}
     */
    dwSendingFlowspecSize {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Offset from the beginning of the structure to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure followed by WinSock provider-specific data, equivalent to what would have been stored in <b>SendingFlowspec</b> in a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure. Specifies the quality of service desired in the sending direction on the call. The provider-specific portion following the <b>FLOWSPEC</b> structure must not contain pointers to other blocks of memory, because TAPI does not know how to marshal the data pointed to by the private pointer(s) and convey it through interprocess communication to the application. The size of the field is specified by <b>dwSendingFlowspecSize</b>.
     * @type {Integer}
     */
    dwSendingFlowspecOffset {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Size of the quality of service information, in bytes.
     * @type {Integer}
     */
    dwReceivingFlowspecSize {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Offset from the beginning of the structure to a <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure followed by WinSock provider-specific data, equivalent to what would have been stored in <b>ReceivingFlowspec</b> in a <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure. Specifies the quality of service desired in the receiving direction on the call. The provider-specific portion following the <b>FLOWSPEC</b> structure must not contain pointers to other blocks of memory, because TAPI does not know how to marshal the data pointed to by the private pointer(s) and convey it through interprocess communication to the application. The size of the field is specified by <b>dwReceivingFlowspecSize</b>.
     * @type {Integer}
     */
    dwReceivingFlowspecOffset {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Size of the device class string including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwDeviceClassSize {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that indicates the device class of the device whose configuration is specified in <i>DeviceConfig</i>. Valid device class strings are the same as those specified for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> function. The size of the string is specified by <b>dwDeviceClassSize</b>.
     * @type {Integer}
     */
    dwDeviceClassOffset {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Size of the device configuration data, in bytes.
     * @type {Integer}
     */
    dwDeviceConfigSize {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Offset from the beginning of the structure to the opaque configuration data structure. This value is returned in the <b>dwStringSize</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a>. If the size is zero, the default device configuration is used. This allows the application to set the device configuration before the call is initiated. The size of the field is specified by <b>dwDeviceConfigSize</b>.
     * @type {Integer}
     */
    dwDeviceConfigOffset {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Size of the application-settable call data, in bytes.
     * @type {Integer}
     */
    dwCallDataSize {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * Offset from the beginning of the structure to the application-settable call data to be initially attached to the call. The size of the field is specified by <b>dwCallDataSize</b>.
     * @type {Integer}
     */
    dwCallDataOffset {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Number of seconds, after the completion of dialing, that the call should be allowed to wait in the PROCEEDING or RINGBACK states, before it is automatically abandoned by the service provider with a LINECALLSTATE_DISCONNECTED and LINEDISCONNECTMODE_NOANSWER. A value of 0 indicates that the application does not desire automatic call abandonment.
     * @type {Integer}
     */
    dwNoAnswerTimeout {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Size of the calling-party ID string including the <b>null</b> terminator, in bytes, including the <b>null</b>-terminating character.
     * @type {Integer}
     */
    dwCallingPartyIDSize {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the identity of the party placing the call. If the content of the identifier is acceptable and a path is available, the service provider passes the identifier along to the called party to indicate the identity of the calling party. The size of the field is specified by <b>dwCallingPartyIDSize</b>.
     * @type {Integer}
     */
    dwCallingPartyIDOffset {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }
}
