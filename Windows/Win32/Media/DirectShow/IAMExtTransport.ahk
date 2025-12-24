#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMExtTransport interface controls the transport on a video tape recporder (VTR) or camcorder.
 * @remarks
 * 
 * The DV device drivers require some additional constants that are defined in the header file Xprtdefs.h.
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-ext-transport">PROPSETID_EXT_TRANSPORT</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * 
 * <h3><a id="Hardware_Requirements"></a><a id="hardware_requirements"></a><a id="HARDWARE_REQUIREMENTS"></a>Hardware Requirements</h3>
 * To control an external VCR, certain hardware requirements are recommended. VCRs with an RS-422 serial interface require a special serial port card or an external RS-232-to-RS-422 adapter. In addition, for best performance, your computer should have a serial port card built with a 16550 high-performance UART to sustain higher baud rates, such as 38.4 baud.
 * 
 * <h3><a id="Filter_Developers"></a><a id="filter_developers"></a><a id="FILTER_DEVELOPERS"></a>Filter Developers</h3>
 * Implement this interface if you are writing a filter that controls an external device with a transport, such as a VTR. If you implement this interface, you should implement the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamextdevice">IAMExtDevice</a> interface as well.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamexttransport
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMExtTransport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMExtTransport
     * @type {Guid}
     */
    static IID => Guid("{a03cd5f0-3045-11cf-8c44-00aa006b6814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapability", "put_MediaState", "get_MediaState", "put_LocalControl", "get_LocalControl", "GetStatus", "GetTransportBasicParameters", "SetTransportBasicParameters", "GetTransportVideoParameters", "SetTransportVideoParameters", "GetTransportAudioParameters", "SetTransportAudioParameters", "put_Mode", "get_Mode", "put_Rate", "get_Rate", "GetChase", "SetChase", "GetBump", "SetBump", "get_AntiClogControl", "put_AntiClogControl", "GetEditPropertySet", "SetEditPropertySet", "GetEditProperty", "SetEditProperty", "get_EditStart", "put_EditStart"]

    /**
     * @type {Integer} 
     */
    MediaState {
        get => this.get_MediaState()
        set => this.put_MediaState(value)
    }

    /**
     * @type {Integer} 
     */
    LocalControl {
        get => this.get_LocalControl()
        set => this.put_LocalControl(value)
    }

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * @type {Float} 
     */
    Rate {
        get => this.get_Rate()
        set => this.put_Rate(value)
    }

    /**
     * @type {Integer} 
     */
    AntiClogControl {
        get => this.get_AntiClogControl()
        set => this.put_AntiClogControl(value)
    }

    /**
     * @type {Integer} 
     */
    EditStart {
        get => this.get_EditStart()
        set => this.put_EditStart(value)
    }

    /**
     * The GetCapability method retrieves the general capabilities of the transport.
     * @param {Integer} Capability Specifies the capability to check. See Remarks for more information.
     * @param {Pointer<Integer>} pValue Pointer to a variable that receives a <b>long</b> integer. See Remarks for more information.
     * @param {Pointer<Float>} pdblValue Pointer to a variable that receives a <b>double</b>. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-getcapability
     */
    GetCapability(Capability, pValue, pdblValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pdblValueMarshal := pdblValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, "int", Capability, pValueMarshal, pValue, pdblValueMarshal, pdblValue, "HRESULT")
        return result
    }

    /**
     * The put_MediaState method sets the current state of the media.
     * @param {Integer} State Specifies the media state as a <b>long</b> integer. Use one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_SPIN_DOWN</td>
     * <td>For disk media: Stop spinning. For tape media: Unthread the tape.</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_SPIN_UP</td>
     * <td>For disk media: Start spinning. For tape media: Thread the tape.</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_UNLOAD</td>
     * <td>Eject the media from the drive.</td>
     * </tr>
     * </table>
     *  
     * 
     * These constants are for disk and tape media. Other devices might need to define new constants.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-put_mediastate
     */
    put_MediaState(State) {
        result := ComCall(4, this, "int", State, "HRESULT")
        return result
    }

    /**
     * The get_MediaState method retrieves the current state of the media.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-get_mediastate
     */
    get_MediaState() {
        result := ComCall(5, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The put_LocalControl method switches the device between local and remote control.
     * @param {Integer} State Specifies the state of the device.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>OATRUE</td>
     * <td>Local control</td>
     * </tr>
     * <tr>
     * <td>OAFALSE</td>
     * <td>Remote control</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-put_localcontrol
     */
    put_LocalControl(State) {
        result := ComCall(6, this, "int", State, "HRESULT")
        return result
    }

    /**
     * The get_LocalControl method determines whether the transport is under local control or remote control.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-get_localcontrol
     */
    get_LocalControl() {
        result := ComCall(7, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The GetStatus method returns information about the transport's status.
     * @param {Integer} StatusItem Specifies the status information to retrieve. See Remarks for more information.
     * @returns {Integer} Pointer to variable that either specifies or receives a <b>long</b> integer, whose meaning depends on the value of <i>StatusItem</i>. See Remarks for more information.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-getstatus
     */
    GetStatus(StatusItem) {
        result := ComCall(8, this, "int", StatusItem, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The GetTransportBasicParameters method retrieves general properties of the external transport.
     * @param {Integer} Param Specifies which property to receive.
     * @param {Pointer<Integer>} pValue Pointer to a variable that receives a <b>long</b> integer value. See Remarks for more information.
     * @param {Pointer<PWSTR>} ppszData Pointer to a variable of type <b>LPOLESTR</b> that receives a string. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-gettransportbasicparameters
     */
    GetTransportBasicParameters(Param, pValue, ppszData) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        ppszDataMarshal := ppszData is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "int", Param, pValueMarshal, pValue, ppszDataMarshal, ppszData, "HRESULT")
        return result
    }

    /**
     * The SetTransportBasicParameters method sets general properties of the transport.
     * @param {Integer} Param Specifies which property to set. See Remarks for more information.
     * @param {Integer} Value Specifies the value of the property as a <b>long</b> integer. See Remarks for more information.
     * @param {PWSTR} pszData Specifies the value of the property as an <b>LPOLESTR</b>. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code. Possible error codes include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device does not support setting this property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device was removed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-settransportbasicparameters
     */
    SetTransportBasicParameters(Param, Value, pszData) {
        pszData := pszData is String ? StrPtr(pszData) : pszData

        result := ComCall(10, this, "int", Param, "int", Value, "ptr", pszData, "HRESULT")
        return result
    }

    /**
     * The GetTransportVideoParameters retrieves video parameter settings for external transport.
     * @param {Integer} Param 
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive the video parameter. See Remarks for more information.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-gettransportvideoparameters
     */
    GetTransportVideoParameters(Param) {
        result := ComCall(11, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetTransportVideoParameters method assigns video parameters for external transport.
     * @param {Integer} Param 
     * @param {Integer} Value Specifies the value of the video parameter. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-settransportvideoparameters
     */
    SetTransportVideoParameters(Param, Value) {
        result := ComCall(12, this, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * The GetTransportAudioParameters method retrieves audio parameter setting for external transport.
     * @param {Integer} Param 
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive the channel or channels set in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportaudioparameters">IAMExtTransport::SetTransportAudioParameters</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-gettransportaudioparameters
     */
    GetTransportAudioParameters(Param) {
        result := ComCall(13, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetTransportAudioParameters assigns audio parameter settings for external transport.
     * @param {Integer} Param Specifies the audio parameter you want to set as a <b>long</b> integer.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TRANSAUDIO_ENABLE_OUTPUT</td>
     * <td>Enable audio channel(s) for output.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSAUDIO_ENABLE_RECORD</td>
     * <td>Enable audio channel(s) for recording.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSAUDIO_ENABLE_SELSYNC</td>
     * <td>Enable audio channel(s) for selsync recording.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSAUDIO_SET_MONITOR</td>
     * <td>Set the monitor output source.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSAUDIO_SET_SOURCE</td>
     * <td>Set the active audio input.</td>
     * </tr>
     * </table>
     * @param {Integer} Value Specifies which audio channel or channels is assigned the parameter as a <b>long</b> integer.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-settransportaudioparameters
     */
    SetTransportAudioParameters(Param, Value) {
        result := ComCall(14, this, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * The put_Mode method sets the transport mode; for example, play, stop, or record.
     * @param {Integer} Mode 
     * @returns {HRESULT} Returns an HRESULT. Possible errors include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_REQ_NOT_ACCEP)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not accept the command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-put_mode
     */
    put_Mode(Mode) {
        result := ComCall(15, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * The get_Mode method retrieves the current transport mode, such as play, stop, or record.
     * @returns {Integer} Pointer to a <b>long</b> integer that receives the current transport mode. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-put_mode">IAMExtTransport::put_Mode</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-get_mode
     */
    get_Mode() {
        result := ComCall(16, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * The put_Rate method sets the playback rate for variable-speed external devices.
     * @param {Float} dblRate Specifies the rate as a multiple of normal playback rate. For example, 0.5 specifies half speed, and 2.0 specifies double speed.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-put_rate
     */
    put_Rate(dblRate) {
        result := ComCall(17, this, "double", dblRate, "HRESULT")
        return result
    }

    /**
     * The get_Rate method retrieves the playback rate for variable-speed external devices.
     * @returns {Float} Pointer to a <b>double</b> to receive the playback rate that was set using <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-put_rate">IAMExtTransport::put_Rate</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-get_rate
     */
    get_Rate() {
        result := ComCall(18, this, "double*", &pdblRate := 0, "HRESULT")
        return pdblRate
    }

    /**
     * The GetChase method retrieves the status of chase mode.
     * @param {Pointer<Integer>} pEnabled 
     * @param {Pointer<Integer>} pOffset Pointer to a <b>long</b> integer that receives an offset from the present time, indicating the offset that the transport will maintain while playing. The offset is given in the current time format; see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters">IAMExtTransport::SetTransportBasicParameters</a> for more information.
     * @param {Pointer<Pointer>} phEvent Pointer to a variable that receives an event handle. The event is signaled when the chase offset is established.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-getchase
     */
    GetChase(pEnabled, pOffset, phEvent) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"
        pOffsetMarshal := pOffset is VarRef ? "int*" : "ptr"
        phEventMarshal := phEvent is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, pEnabledMarshal, pEnabled, pOffsetMarshal, pOffset, phEventMarshal, phEvent, "HRESULT")
        return result
    }

    /**
     * The SetChase method enables or disables chase mode.
     * @param {Integer} Enable Specifies whether chase is enabled as a <b>long</b> integer.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>OATRUE</td>
     * <td>Enable chase.</td>
     * </tr>
     * <tr>
     * <td>OAFALSE</td>
     * <td>Disable chase.</td>
     * </tr>
     * </table>
     * @param {Integer} Offset Specifies the offset that the transport will maintain from a reference time. The offset is given in the current time format; see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters">IAMExtTransport::SetTransportBasicParameters</a> for more information.
     * @param {Pointer} hEvent Specifies a handle to an event. The device signals the event after it has established the signal offset.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-setchase
     */
    SetChase(Enable, Offset, hEvent) {
        result := ComCall(20, this, "int", Enable, "int", Offset, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * The GetBump method retrieves the status of bump mode.
     * @param {Pointer<Integer>} pSpeed Pointer to a <b>long</b> integer that receives the temporary bump speed, as a multiple of normal speed.
     * @param {Pointer<Integer>} pDuration Pointer to a <b>long</b> integer that receives the duration of a bump. The duration is given in the current time format; see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters">IAMExtTransport::SetTransportBasicParameters</a> for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-getbump
     */
    GetBump(pSpeed, pDuration) {
        pSpeedMarshal := pSpeed is VarRef ? "int*" : "ptr"
        pDurationMarshal := pDuration is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pSpeedMarshal, pSpeed, pDurationMarshal, pDuration, "HRESULT")
        return result
    }

    /**
     * The SetBump method temporarily changes the playback, for synchronization of multiple external devices.
     * @param {Integer} Speed Specifies the temporary speed (a multiple of normal speed) as a <b>long</b> integer.
     * @param {Integer} Duration Specifies the duration of a bump as a <b>long</b> integer. The duration is given in the current time format; see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters">IAMExtTransport::SetTransportBasicParameters</a> for more information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-setbump
     */
    SetBump(Speed, Duration) {
        result := ComCall(22, this, "int", Speed, "int", Duration, "HRESULT")
        return result
    }

    /**
     * The get_AntiClogControl method determines whether the anti-headclog control is enabled or disabled.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-get_anticlogcontrol
     */
    get_AntiClogControl() {
        result := ComCall(23, this, "int*", &pEnabled := 0, "HRESULT")
        return pEnabled
    }

    /**
     * The put_AntiClogControl method enables or disables anti-headclog control on the transport.
     * @param {Integer} Enable Specifies whether to enable anti-headclog control.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>OATRUE</td>
     * <td>Enable transport anti-headclog control.</td>
     * </tr>
     * <tr>
     * <td>OAFALSE</td>
     * <td>Disable transport anti-headclog control.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-put_anticlogcontrol
     */
    put_AntiClogControl(Enable) {
        result := ComCall(24, this, "int", Enable, "HRESULT")
        return result
    }

    /**
     * The GetEditPropertySet method retrieves the state of an edit event.
     * @param {Integer} EditID Specifies the edit property set. Use the identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-seteditpropertyset">IAMExtTransport::SetEditPropertySet</a> method.
     * @returns {Integer} Pointer to a <b>long</b> integer that receives the state of the edit property set:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_ACTIVE</td>
     * <td>The edit property set is active.</td>
     * </tr>
     * <tr>
     * <td>ED_DELETE</td>
     * <td>The edit property set was deleted.</td>
     * </tr>
     * <tr>
     * <td>ED_INACTIVE</td>
     * <td>The edit property set is inactive.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-geteditpropertyset
     */
    GetEditPropertySet(EditID) {
        result := ComCall(25, this, "int", EditID, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The SetEditPropertySet method registers an edit property set that describes a group of edit properties.
     * @param {Pointer<Integer>} pEditID Pointer to a <b>long</b> integer that specifies or receives an identifier for the edit property set.
     * @param {Integer} State Specifies the state of the edit property set.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_ACTIVE</td>
     * <td>Activates the edit property set.</td>
     * </tr>
     * <tr>
     * <td>ED_DELETE</td>
     * <td>Deletes the edit property set.</td>
     * </tr>
     * <tr>
     * <td>ED_INACTIVE</td>
     * <td>Inactivates edit property set.</td>
     * </tr>
     * <tr>
     * <td>ED_REGISTER</td>
     * <td>Registers the edit property set.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the value is ED_REGISTER, the <i>pEditID</i> parameter receives an identifier for the edit property set. For the other flags, use the <i>pEditID</i> parameter to specify the identifier.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-seteditpropertyset
     */
    SetEditPropertySet(pEditID, State) {
        pEditIDMarshal := pEditID is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pEditIDMarshal, pEditID, "int", State, "HRESULT")
        return result
    }

    /**
     * The GetEditProperty method retrieves parameters and values associated with an edit event.
     * @param {Integer} EditID Specifies the edit property set. Use the identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-seteditpropertyset">IAMExtTransport::SetEditPropertySet</a> method.
     * @param {Integer} Param Specifies the edit event parameter to retrieve.
     * @returns {Integer} pointer to a variable that receives the parameter value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-geteditproperty
     */
    GetEditProperty(EditID, Param) {
        result := ComCall(27, this, "int", EditID, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetEditProperty method defines parameters and values associated with an edit event.
     * @param {Integer} EditID Specifies the edit property set. Use the identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-seteditpropertyset">IAMExtTransport::SetEditPropertySet</a> method.
     * @param {Integer} Param Specifies the edit event parameter. See Remarks for more information.
     * @param {Integer} Value Specifies the value of the parameter. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-seteditproperty
     */
    SetEditProperty(EditID, Param, Value) {
        result := ComCall(28, this, "int", EditID, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * The get_EditStart method determines whether the external transport's edit control is active.
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive a value indicating whether the external transport's edit control is active.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>OATRUE</td>
     * <td>Edit control is active.</td>
     * </tr>
     * <tr>
     * <td>OAFALSE</td>
     * <td>Edit control is inactive.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-get_editstart
     */
    get_EditStart() {
        result := ComCall(29, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The put_EditStart method activates the edit control on a capable transport.
     * @param {Integer} Value Specifies whether to active the edit control.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>OATRUE</td>
     * <td>Activates the edit control.</td>
     * </tr>
     * <tr>
     * <td>OAFALSE</td>
     * <td>Deactivates the edit control.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamexttransport-put_editstart
     */
    put_EditStart(Value) {
        result := ComCall(30, this, "int", Value, "HRESULT")
        return result
    }
}
