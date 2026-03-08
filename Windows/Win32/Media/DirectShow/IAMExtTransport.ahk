#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMExtTransport interface controls the transport on a video tape recporder (VTR) or camcorder.
 * @remarks
 * The DV device drivers require some additional constants that are defined in the header file Xprtdefs.h.
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-ext-transport">PROPSETID_EXT_TRANSPORT</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * 
 * <h3><a id="Hardware_Requirements"></a><a id="hardware_requirements"></a><a id="HARDWARE_REQUIREMENTS"></a>Hardware Requirements</h3>
 * To control an external VCR, certain hardware requirements are recommended. VCRs with an RS-422 serial interface require a special serial port card or an external RS-232-to-RS-422 adapter. In addition, for best performance, your computer should have a serial port card built with a 16550 high-performance UART to sustain higher baud rates, such as 38.4 baud.
 * 
 * <h3><a id="Filter_Developers"></a><a id="filter_developers"></a><a id="FILTER_DEVELOPERS"></a>Filter Developers</h3>
 * Implement this interface if you are writing a filter that controls an external device with a transport, such as a VTR. If you implement this interface, you should implement the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamextdevice">IAMExtDevice</a> interface as well.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamexttransport
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
     * @remarks
     * The <i>Capability</i> parameter is a flag that specifies which capability to check. The method returns the result either in the <i>pValue</i> parameter or in the <i>pdblValue</i> parameter, depending on the capability flag.
     * 
     * For the following flags, the method returns the value OATRUE or OAFALSE in the <i>pValue</i> parameter. The value OATRUE indicates that the capability is present, while the value OAFALSE indicates it is absent.
     * 
     * <table>
     * <tr>
     * <th>Capability Flag
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_ASSEMBLE</td>
     * <td>Transport can use assemble record mode (record new tracks that link seamlessly to the control track from the previously recorded segment).</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_BUMP_PLAY</td>
     * <td>Transport can synchronize by varying speed.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_DELAY_AUDIO_IN</td>
     * <td>Transport can perform delayed-in audio edits.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_DELAY_AUDIO_OUT</td>
     * <td>Transport can perform delayed-out audio edits.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_DELAY_VIDEO_IN</td>
     * <td>Transport can perform delayed-in video edits.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_DELAY_VIDEO_OUT</td>
     * <td>Transport can perform delayed-out video edits.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_DETECT_LENGTH</td>
     * <td>Transport can detect the length of the media.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_EJECT</td>
     * <td>Transport can eject the media.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_FREEZE</td>
     * <td>Transport can freeze/pause.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_INSERT</td>
     * <td>Transport can use insert record mode (record individual tracks while locked to a prerecorded control track).</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_PLAY_BACKWARDS</td>
     * <td>Transport can play backward.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_SET_EE</td>
     * <td>Transport can show the device's input on its output.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_CAN_SET_PB</td>
     * <td>Transport can show media playback on its output.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_FIELD_STEP</td>
     * <td>Transport responds to a frame advance command by advancing one field.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_HAS_CLOCK</td>
     * <td>Device has a clock.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_HAS_DT</td>
     * <td>Device has dynamic tracking.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_HAS_TIMER</td>
     * <td>Device has a timer.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_HAS_TUNER</td>
     * <td>Device has a tuner.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_IS_MASTER</td>
     * <td>Device is the master clock for synchronizing.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_MULTIPLE_EDITS</td>
     * <td>Device supports multiple edit events.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_NEEDS_CUEING</td>
     * <td>Device must be cued before it performs an edit.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_NEEDS_TBC</td>
     * <td>Device needs to be calibrated.</td>
     * </tr>
     * </table>
     *  
     * 
     * For the following flags, the method returns a numeric value in the <i>pValue</i> parameter.
     * 
     * <table>
     * <tr>
     * <td>Capability Flag
     *             </td>
     * <td>Returned Value
     *             </td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_LTC_TRACK</td>
     * <td>Returns the track number of the LTC timecode track, or ED_ALL if there is no dedicated timecode track.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_NUM_AUDIO_TRACKS</td>
     * <td>Returns the number of audio tracks.</td>
     * </tr>
     * </table>
     *  
     * 
     * For the following flags, the method returns a value in the <i>pdblValue</i> parameter.
     * 
     * <table>
     * <tr>
     * <td>Capability Flag
     *             </td>
     * <td>Returned Value
     *             </td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_FWD_SHUTTLE_MAX</td>
     * <td>Maximum forward speed in shuttle mode, as a multiple of play speed.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_FWD_SHUTTLE_MIN</td>
     * <td>Minimum forward speed in shuttle mode, as a multiple of play speed.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_FWD_VARIABLE_MAX</td>
     * <td>Maximum forward speed, as a multiple of play speed.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_FWD_VARIABLE_MIN</td>
     * <td>Minimum forward speed, as a multiple of play speed.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_REV_SHUTTLE_MAX</td>
     * <td>Maximum reverse speed in shuttle mode, as a multiple of play speed.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_REV_SHUTTLE_MIN</td>
     * <td>Minimum reverse speed in shuttle mode, as a multiple of play speed.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_REV_VARIABLE_MAX</td>
     * <td>Maximum reverse speed, as a multiple of play speed.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSCAP_REV_VARIABLE_MIN</td>
     * <td>Minimum reverse speed, as a multiple of play speed.</td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
     * @param {Integer} Capability Specifies the capability to check. See Remarks for more information.
     * @param {Pointer<Integer>} pValue Pointer to a variable that receives a <b>long</b> integer. See Remarks for more information.
     * @param {Pointer<Float>} pdblValue Pointer to a variable that receives a <b>double</b>. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-getcapability
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_mediastate
     */
    put_MediaState(State) {
        result := ComCall(4, this, "int", State, "HRESULT")
        return result
    }

    /**
     * The get_MediaState method retrieves the current state of the media.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_mediastate
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_localcontrol
     */
    put_LocalControl(State) {
        result := ComCall(6, this, "int", State, "HRESULT")
        return result
    }

    /**
     * The get_LocalControl method determines whether the transport is under local control or remote control.
     * @remarks
     * To control an external device from an application, the device must be in remote mode.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_localcontrol
     */
    get_LocalControl() {
        result := ComCall(7, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The GetStatus method returns information about the transport's status.
     * @remarks
     * The <i>StatusItem</i> parameter is a flag that specifies which status information to retrieve. The method returns in the information in the <i>pValue</i> parameter. Not every device supports every status flag. The following flags are defined:
     * 
     * <ul>
     * <li>ED_MODE: Returns the current transport mode, such as pause or play. See <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-put_mode">IAMExtTransport::put_Mode</a> for a list of constants that define the transport modes. As an alternative, you can set <i>StatusItem</i> equal to one of these constants, and <i>pValue</i> will receive the value OATRUE if the transport is currently in that mode, or OAFALSE otherwise.</li>
     * <li>ED_MEDIA_TYPE: Indicates the format of the media for this transport. Returns one of the following constants.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_VHS</td>
     * <td>VHS</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_SVHS</td>
     * <td>S-VHS</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_HI8</td>
     * <td>Hi-8</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_UMATIC</td>
     * <td>Umatic</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_DVC</td>
     * <td>DV tape (DVC)</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_1_INCH</td>
     * <td>1-inch tape</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_D1</td>
     * <td>D1 format</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_D2</td>
     * <td>D2 format</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_D3</td>
     * <td>D3 format</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_D5</td>
     * <td>D5 format</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_DBETA</td>
     * <td>Digital Betacam</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_BETA</td>
     * <td>Betacam</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_8MM</td>
     * <td>8-millimeter</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_DDR</td>
     * <td>Digital disk recorder</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_SX</td>
     * <td>Betacam SX</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_OTHER</td>
     * <td>Other</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_CLV</td>
     * <td>CLV (Constant Linear Velocity, or "standard play") laserdisc</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_CAV</td>
     * <td>CAV (Constant Angular Velocity, or "extended play") laserdisc</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_LINK_MODE: Returns OATRUE if the transport's controls are linked to the filter graph's <b>Run</b>, <b>Stop</b>, and <b>Pause</b> methods, and OAFALSE otherwise. See <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-put_mode">IAMExtTransport::put_Mode</a> for more information.</li>
     * <li>ED_MEDIA_PRESENT: Returns OATRUE if the transport's media is present, or OAFALSE otherwise.</li>
     * <li>ED_MEDIA_LENGTH: Returns the length of the media, in units of the current time format (see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters">IAMExtTransport::SetTransportBasicParameters</a>).</li>
     * <li>ED_MEDIA_TRACK_COUNT: Returns the track count.</li>
     * <li>ED_MEDIA_TRACK_LENGTH: Returns the track length, in units of the current time format.</li>
     * <li>ED_MEDIA_SIDE: Indicates which side of the media is active.</li>
     * </ul>
     * In Windows XP Service Pack 2 and later, the following additional play modes are defined for ED_MODE.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_MODE_PLAY_SLOW_FWD_X</td>
     * <td>Play unspecified slow forward. (Slow-forward play at vendor-specific speed.)</td>
     * </tr>
     * <tr>
     * <td>ED_MODE_PLAY_FAST_FWD_X</td>
     * <td>Play unspecified fast forward. (Fast-forward play at vendor-specific speed.)</td>
     * </tr>
     * <tr>
     * <td>ED_MODE_PLAY_SLOW_REV_X</td>
     * <td>Play unspecified slow reverse. (Slow-reverse play at vendor-specific speed.)</td>
     * </tr>
     * <tr>
     * <td>ED_MODE_PLAY_FAST_REV_X</td>
     * <td>Play unspecified fast reverse. (Fast-reverse play at vendor-specific speed.)</td>
     * </tr>
     * <tr>
     * <td>ED_MODE_STOP_START</td>
     * <td>Transport is stopped at the beginning of the tape (or other transport medium).</td>
     * </tr>
     * <tr>
     * <td>ED_MODE_STOP_END</td>
     * <td>Transport is stopped at the end of the tape (or other transport medium).</td>
     * </tr>
     * <tr>
     * <td>ED_MODE_STOP_EMERGENCY</td>
     * <td>Transport has stopped due to unexpected conditions or to avoid possible damage to the transport.</td>
     * </tr>
     * </table>
     *  
     * 
     * To use these constants, include the header file Xprtdefs.h from the Windows SDK.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> supports the following status flags: 
     * 
     * <ul>
     * <li>ED_MODE: See previous remarks. </li>
     * <li>ED_MEDIA_TYPE: Returns one of the following values.
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_VHS</td>
     * <td>VHS tape.</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_DVC</td>
     * <td>DV tape.</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_UNKNOWN</td>
     * <td>Unknown type.</td>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_NOT_PRESENT</td>
     * <td>The transport is empty. </td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_DEV_REMOVED_HEVENT_GET. Returns a handle to an event. The driver signals the event if the device is physically removed from the system.</li>
     * <li>ED_DEV_REMOVED_HEVENT_RELEASE. Releases the event handle obtained through the ED_DEV_REMOVED_HEVENT_GET flag. Specify the address of the handle in the pValue parameter. </li>
     * <li>ED_MODE_CHANGE_NOTIFY. Returns the device state in pValue. If the method returns E_PENDING, a state change is pending. You can use the ED_NOTIFY_HEVENT_GET flag to get notification when the state change is complete. </li>
     * <li>ED_NOTIFY_HEVENT_GET. Returns a handle to an event. The driver signals the event when the device completes a mode change. </li>
     * <li>ED_NOTIFY_HEVENT_RELEASE. Releases the event handle obtained through the ED_NOTIFY_HEVENT_GET flag. Specify the address of the handle in the pValue parameter. </li>
     * </ul>
     * <h3><a id="MPEG_Camcorder_Implementation"></a><a id="mpeg_camcorder_implementation"></a><a id="MPEG_CAMCORDER_IMPLEMENTATION"></a>MPEG Camcorder Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mstape-driver">MSTape</a> supports an additional media format for the ED_MEDIA_TYPE flag.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_MEDIA_NEO</td>
     * <td>Mini digital tape for MPEG-2 transport stream (D-VHS).</td>
     * </tr>
     * </table>
     *  
     * 
     * Some of these flags are defined in the header file Xptrdefs.h.
     * @param {Integer} StatusItem Specifies the status information to retrieve. See Remarks for more information.
     * @returns {Integer} Pointer to variable that either specifies or receives a <b>long</b> integer, whose meaning depends on the value of <i>StatusItem</i>. See Remarks for more information.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-getstatus
     */
    GetStatus(StatusItem) {
        result := ComCall(8, this, "int", StatusItem, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The GetTransportBasicParameters method retrieves general properties of the external transport.
     * @remarks
     * The <i>Param</i> parameter is a flag that specifies which property to retrieve. Some properties are numeric; these are returned in the <i>pValue</i> parameter. Other properties are string values; these are returned in the <i>ppszData</i> parameter. For a list of flags and expected values, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters">IAMExtTransport::SetTransportBasicParameters</a>.
     * 
     * If the method returns a string, the caller must free the string, using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * 
     * <h3><a id="DV_and_MPEG_Camcorder_Implementation"></a><a id="dv_and_mpeg_camcorder_implementation"></a><a id="DV_AND_MPEG_CAMCORDER_IMPLEMENTATION"></a>DV and MPEG Camcorder Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> supports the following additional flags:
     * 
     * <ul>
     * <li>
     * ED_RAW_EXT_DEV_CMD: Invokes a raw AV/C command. Specify the AV/C command as an array of bytes in the <i>ppszData</i> parameter. Specify the size of the command, in bytes, in the <i>pValue</i> parameter. When the method returns, <i>ppszData</i> contains the response from the device, and <i>pValue</i> contains the size of the response, in bytes. The AV/C command is passed directly to the device with no validation or error checking.
     * 
     * The response payload might be larger than the command. It is the caller's responsibility to allocate enough space in the buffer for the response. The maximum payload size is 512 bytes.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/issuing-raw-av-c-commands">Issuing Raw AV/C Commands</a>.
     * 
     * </li>
     * <li>
     * ED_TRANSBASIC_INPUT_SIGNAL: Retrieves the signal format that the DV camcorder is designed to accept. Returns one of the following constants in <i>pValue</i>.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description </th>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_525_60_SD</td>
     * <td>NTSC SD signal. </td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_525_60_SDL</td>
     * <td>NTSC SDL (long-play) signal. </td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_625_50_SD</td>
     * <td>PAL SD signal.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_625_50_SDL</td>
     * <td>PAL SDL (long-play) signal.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_MPEG2TS</td>
     * <td>D-VHS signal.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_TRANSBASIC_OUTPUT_SIGNAL: Retrieves the signal format that the DV camcorder is designed to transmit. Returns one of the constants listed for the ED_TRANSBASIC_INPUT_SIGNAL flag. 
     * </li>
     * </ul>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mstape-driver">MSTape</a> supports additional values for ED_TRANSBASIC_INPUT_SIGNAL and ED_TRANSBASIC_OUTPUT_SIGNAL.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description </th>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_2500_60_MPEG</td>
     * <td>25-Mbps/60 MPEG stream.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_1250_60_MPEG</td>
     * <td>12.5-Mbps/60 MPEG stream.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_0625_60_MPEG</td>
     * <td>6.25-Mbps/60 MPEG stream.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_2500_50_MPEG</td>
     * <td>25-Mbps/50 MPEG stream.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_1250_50_MPEG</td>
     * <td>12.5-Mbps/50 MPEG stream.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_0625_50_MPEG</td>
     * <td>6.25-Mbps/50 MPEG stream.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_UNKNOWN</td>
     * <td>Unknown signal format.</td>
     * </tr>
     * </table>
     *  
     * 
     * These flags are defined in the header file Xprtdefs.h.
     * 
     * In Windows XP Service Pack 2 and later, the following additional signal types are defined for the ED_TRANSBASIC_INPUT_SIGNAL and ED_TRANSBASIC_OUTPUT_SIGNAL flags.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_525_60_DV25</td>
     * <td>DVCPRO 25, 525-60.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_625_50_DV25</td>
     * <td>DVCPRO 25, 625-50. </td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_525_60_DV50</td>
     * <td>DVCPRO 50, 525-60.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_625_50_DV50</td>
     * <td>DVCPRO 50, 625-50.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_HD_60_DVH1</td>
     * <td>DVCPRO 100, 1080i or 720p</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SIGNAL_HD_50_DVH1</td>
     * <td>DVCPRO 100, 1080i only</td>
     * </tr>
     * </table>
     *  
     * 
     * To use these constants, include the header file Xprtdefs.h from the Windows SDK.
     * @param {Integer} Param Specifies which property to receive.
     * @param {Pointer<Integer>} pValue Pointer to a variable that receives a <b>long</b> integer value. See Remarks for more information.
     * @param {Pointer<PWSTR>} ppszData Pointer to a variable of type <b>LPOLESTR</b> that receives a string. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-gettransportbasicparameters
     */
    GetTransportBasicParameters(Param, pValue, ppszData) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        ppszDataMarshal := ppszData is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "int", Param, pValueMarshal, pValue, ppszDataMarshal, ppszData, "HRESULT")
        return result
    }

    /**
     * The SetTransportBasicParameters method sets general properties of the transport.
     * @remarks
     * The <i>Param</i> parameter is a flag that specifies which property to set. For some flags, the property is numeric; use the <i>Value</i> parameter to specify the value. For other flags, the property is a string; use the <i>pszData</i> parameter to specify the value. In either case, the method ignores the other parameter.
     * 
     * For the following flags, the <i>Value</i> parameter takes a defined constant.
     * 
     * <ul>
     * <li>ED_TRANSBASIC_TIME_FORMAT: Specifies the time format.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_MILLISECONDS</td>
     * <td>Milliseconds.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_FRAMES</td>
     * <td>Frames.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_REFERENCE_TIME</td>
     * <td>Reference time.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_HMSF</td>
     * <td>Binary coded decimal, representing hours, minutes, seconds, and frames.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_TMSF</td>
     * <td>Binary coded decimal, representing tracks, minutes, seconds, and frames.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_TRANSBASIC_TIME_REFERENCE: Specifies the reference time in use by the device.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_TIMEREF_TIMECODE</td>
     * <td>Time code.</td>
     * </tr>
     * <tr>
     * <td>ED_TIMEREF_CONTROL_TRACK</td>
     * <td>Control track.</td>
     * </tr>
     * <tr>
     * <td>ED_TIMEREF_INDEX</td>
     * <td>Index.</td>
     * </tr>
     * <tr>
     * <td>ED_TIMEREF_ATN</td>
     * <td>Absolute track number. This constant is defined in the header file Xprtdefs.h.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_TRANSBASIC_END_STOP_ACTION: Specifies the action the device takes when it reaches the end of the transport medium.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_MODE_STOP</td>
     * <td>Stop.</td>
     * </tr>
     * <tr>
     * <td>ED_MODE_REWIND</td>
     * <td>Rewind.</td>
     * </tr>
     * <tr>
     * <td>ED_MODE_FREEZE</td>
     * <td>Freeze/pause.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_TRANSBASIC_RECORD_FORMAT: Specifies the recording speed.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_RECORD_FORMAT_SP</td>
     * <td>Standard play.</td>
     * </tr>
     * <tr>
     * <td>ED_RECORD_FORMAT_LP</td>
     * <td>Long play.</td>
     * </tr>
     * <tr>
     * <td>ED_RECORD_FORMAT_EP</td>
     * <td>Extended play.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_TRANSBASIC_SUPERIMPOSE: Specifies whether the on-screen display is enabled or disabled.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>OATRUE</td>
     * <td>On-screen display is enabled.</td>
     * </tr>
     * <tr>
     * <td>OAFALSE</td>
     * <td>On-screen display is disabled.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_TRANSBASIC_STEP_UNIT: Specifies the step unit.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_STEP_FIELD</td>
     * <td>Fields.</td>
     * </tr>
     * <tr>
     * <td>ED_STEP_FRAME</td>
     * <td>Frames.</td>
     * </tr>
     * <tr>
     * <td>ED_STEP_3_2</td>
     * <td>3/2 Pulldown.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_TRANSBASIC_SET_COUNTER_FORMAT: Sets the time format for the counter. See the ED_TRANSBASIC_TIME_FORMAT flag for possible values.</li>
     * </ul>
     * For the following flags, use a numeric value in the <i>Value</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_STEP_COUNT</td>
     * <td>Specifies the step count, in units defined by the ED_TRANSBASIC_STEP_UNIT flag.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SET_FREEZE_TIMEOUT</td>
     * <td>Specifies the timeout for freeze mode, in units of the current time format.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SETCLOCK</td>
     * <td>Sets the clock time.</td>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_SET_COUNTER_VALUE</td>
     * <td>Sets the value of the counter.</td>
     * </tr>
     * </table>
     *  
     * 
     * For the following flags, use a string in the <i>pszData</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_TRANSBASIC_VOLUME_NAME</td>
     * <td>Specifies the volume name.</td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters
     */
    SetTransportBasicParameters(Param, Value, pszData) {
        pszData := pszData is String ? StrPtr(pszData) : pszData

        result := ComCall(10, this, "int", Param, "int", Value, "ptr", pszData, "HRESULT")
        return result
    }

    /**
     * The GetTransportVideoParameters retrieves video parameter settings for external transport.
     * @remarks
     * If <i>Param</i> equals ED_TRANSVIDEO_SET_OUTPUT, <i>pValue</i> receives one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>Value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_E2E</td>
     * <td>Input video is displayed on the device's output regardless of the transport mode.</td>
     * </tr>
     * <tr>
     * <td>ED_OFF</td>
     * <td>Video output is disabled.</td>
     * </tr>
     * <tr>
     * <td>ED_PLAYBACK</td>
     * <td>Video playing from media is displayed on the device's output.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>Param</i> equals ED_TRANSVIDEO_SET_SOURCE, <i>pValue</i> receives the index of the input pin used for the video input. The pin index is zero-based.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
     * @param {Integer} Param 
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive the video parameter. See Remarks for more information.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-gettransportvideoparameters
     */
    GetTransportVideoParameters(Param) {
        result := ComCall(11, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetTransportVideoParameters method assigns video parameters for external transport.
     * @remarks
     * If <i>Param</i> equals ED_TRANSVIDEO_SET_OUTPUT, <i>Value</i> must be one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_E2E</td>
     * <td>Input video is displayed on the device's output regardless of the transport mode.</td>
     * </tr>
     * <tr>
     * <td>ED_OFF</td>
     * <td>Video output is disabled.</td>
     * </tr>
     * <tr>
     * <td>ED_PLAYBACK</td>
     * <td>Video playing from media is displayed on the device's output.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>Param</i> equals ED_TRANSVIDEO_SET_SOURCE, <i>Value</i> specifies the index of the input pin to use for the video input. The pin index is zero-based.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
     * @param {Integer} Param 
     * @param {Integer} Value Specifies the value of the video parameter. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-settransportvideoparameters
     */
    SetTransportVideoParameters(Param, Value) {
        result := ComCall(12, this, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * The GetTransportAudioParameters method retrieves audio parameter setting for external transport.
     * @param {Integer} Param 
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive the channel or channels set in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportaudioparameters">IAMExtTransport::SetTransportAudioParameters</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-gettransportaudioparameters
     */
    GetTransportAudioParameters(Param) {
        result := ComCall(13, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetTransportAudioParameters assigns audio parameter settings for external transport.
     * @remarks
     * Specify an exact channel or channels in <i>Value</i> by selecting ED_AUDIO_1 through ED_AUDIO_24 (use a bitwise OR to combine), or all channels by selecting ED_AUDIO_ALL.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-settransportaudioparameters
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_mode
     */
    put_Mode(Mode) {
        result := ComCall(15, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * The get_Mode method retrieves the current transport mode, such as play, stop, or record.
     * @returns {Integer} Pointer to a <b>long</b> integer that receives the current transport mode. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-put_mode">IAMExtTransport::put_Mode</a>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_mode
     */
    get_Mode() {
        result := ComCall(16, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * The put_Rate method sets the playback rate for variable-speed external devices.
     * @param {Float} dblRate Specifies the rate as a multiple of normal playback rate. For example, 0.5 specifies half speed, and 2.0 specifies double speed.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_rate
     */
    put_Rate(dblRate) {
        result := ComCall(17, this, "double", dblRate, "HRESULT")
        return result
    }

    /**
     * The get_Rate method retrieves the playback rate for variable-speed external devices.
     * @returns {Float} Pointer to a <b>double</b> to receive the playback rate that was set using <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-put_rate">IAMExtTransport::put_Rate</a>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_rate
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-getchase
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
     * @remarks
     * Use this method when you want an external transport to follow a timecode signal by a fixed offset. For example, if a VCR supports chasing, it can switch to play mode and keep the tape at a fixed offset from a reference timecode.
     * 
     * Chase mode remains in effect until it completes or is canceled. The filter must verify that the transport is maintaining the fixed offset, by periodically reading the transport's timecode.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-setchase
     */
    SetChase(Enable, Offset, hEvent) {
        result := ComCall(20, this, "int", Enable, "int", Offset, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * The GetBump method retrieves the status of bump mode.
     * @remarks
     * This method returns the temporary speed and remaining duration for an active "bump."
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
     * @param {Pointer<Integer>} pSpeed Pointer to a <b>long</b> integer that receives the temporary bump speed, as a multiple of normal speed.
     * @param {Pointer<Integer>} pDuration Pointer to a <b>long</b> integer that receives the duration of a bump. The duration is given in the current time format; see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters">IAMExtTransport::SetTransportBasicParameters</a> for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-getbump
     */
    GetBump(pSpeed, pDuration) {
        pSpeedMarshal := pSpeed is VarRef ? "int*" : "ptr"
        pDurationMarshal := pDuration is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pSpeedMarshal, pSpeed, pDurationMarshal, pDuration, "HRESULT")
        return result
    }

    /**
     * The SetBump method temporarily changes the playback, for synchronization of multiple external devices.
     * @remarks
     * This method causes a temporary speed variation of the transport. The transport operates at the new speed until the specified duration elapses. Then it returns to its previous speed.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
     * @param {Integer} Speed Specifies the temporary speed (a multiple of normal speed) as a <b>long</b> integer.
     * @param {Integer} Duration Specifies the duration of a bump as a <b>long</b> integer. The duration is given in the current time format; see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters">IAMExtTransport::SetTransportBasicParameters</a> for more information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-setbump
     */
    SetBump(Speed, Duration) {
        result := ComCall(22, this, "int", Speed, "int", Duration, "HRESULT")
        return result
    }

    /**
     * The get_AntiClogControl method determines whether the anti-headclog control is enabled or disabled.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_anticlogcontrol
     */
    get_AntiClogControl() {
        result := ComCall(23, this, "int*", &pEnabled := 0, "HRESULT")
        return pEnabled
    }

    /**
     * The put_AntiClogControl method enables or disables anti-headclog control on the transport.
     * @remarks
     * Use this method to unclog video heads on VCRs that have an automatic head-cleaning feature.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_anticlogcontrol
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-geteditpropertyset
     */
    GetEditPropertySet(EditID) {
        result := ComCall(25, this, "int", EditID, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The SetEditPropertySet method registers an edit property set that describes a group of edit properties.
     * @remarks
     * An <i>edit event</i> is a set of parameters that define a recording sequence. For example, the parameters can specify editing modes, inpoints and outpoints, or seek positions. Each edit event consists of one or more parameters, called <i>edit properties</i>. The collection of properties is called an <i>edit property set</i>. Each edit property set is identified by a <b>long</b> integer, assigned by the device filter.
     * 
     * To create and execute an edit event, the application must do the following:
     * 
     * <ul>
     * <li>Register an edit property set. Call the <c>SetEditPropertySet</c> method with the value ED_REGISTER in the <i>State</i> parameter. When the method returns, the <i>pEditID</i> parameter contains the identifier for the edit property set. Use this number to identify the edit property set in subsequent method calls.</li>
     * <li>Specify the edit properties using the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-seteditproperty">IAMExtTransport::SetEditProperty</a> method.</li>
     * <li>Activate the edit event by calling <c>SetEditPropertySet</c> with the value ED_ACTIVE.</li>
     * <li>Cue the transport by calling <c>SetEditProperty</c> with the value ED_EDIT_SEEK.</li>
     * <li>Run the filter graph.</li>
     * </ul>
     * For example, the following code configures an insert edit on all tracks:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * // Register an edit property set ID. (Causes memory to be allocated.)
     * long EditId;
     * SetEditPropertySet(&amp;EditId, ED_REGISTER);  
     * 
     * // Set the edit mode.
     * SetEditProperty(EditId, ED_EDIT_MODE, ED_EDIT_MODE_INSERT);
     * // Set the particulars about the event.
     * SetEditProperty(EditId, ED_EDIT_TRACK, ED_VIDEO | ED_AUDIO_ALL);
     * SetEditProperty(EditId, ED_REHEARSE_MODE, ED_EDIT_PERFORM);
     * 
     * // Set the source and record times. 
     * SetEditProperty(EditId, ED_EDIT_SRC_INPOINT, 200)
     * SetEditProperty(EditId, ED_EDIT_SRC_OUTPOINT, 500)
     * SetEditProperty(EditId, ED_EDIT_REC_INPOINT, 100)
     * SetEditProperty(EditId, ED_EDIT_REC_OUTPOINT, 400)
     * 
     * // Activate the edit event.
     * SetEditPropertySet(&amp;EditId, ED_ACTIVE); 
     * // Cue up the machine.
     * SetEditProperty(EditId, ED_EDIT_SEEK, OATRUE); 
     * 
     * // Run the graph. (Not shown.)
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-seteditpropertyset
     */
    SetEditPropertySet(pEditID, State) {
        pEditIDMarshal := pEditID is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pEditIDMarshal, pEditID, "int", State, "HRESULT")
        return result
    }

    /**
     * The GetEditProperty method retrieves parameters and values associated with an edit event.
     * @remarks
     * For a list of edit event parameters and their possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-seteditproperty">IAMExtTransport::SetEditProperty</a>. In addition, this method supports ED_EDIT_TEST, which determines whether the device can perform the edit. If the device filter estimates that the device can perform the edit, it returns the value OATRUE in the <i>pValue</i> parameter. If not, it returns the value OAFALSE.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
     * @param {Integer} EditID Specifies the edit property set. Use the identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-seteditpropertyset">IAMExtTransport::SetEditPropertySet</a> method.
     * @param {Integer} Param Specifies the edit event parameter to retrieve.
     * @returns {Integer} pointer to a variable that receives the parameter value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-geteditproperty
     */
    GetEditProperty(EditID, Param) {
        result := ComCall(27, this, "int", EditID, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetEditProperty method defines parameters and values associated with an edit event.
     * @remarks
     * An edit event consists of one or more edit event parameters. Use the <b>SetEditPropertySet</b> method to create an edit event, and then use this method to specify the edit event parameters for that edit event.
     * 
     * The <i>Param</i> parameter is a flag that specifies the edit event parameter. The <i>Value</i> parameter specifies the value of that parameter. The meaning of <i>Value</i> depends on the flag used in <i>Param</i>:
     * 
     * <ul>
     * <li>ED_EDIT_HEVENT: Handle to an event. The device will signal the event when the edit event has completed.</li>
     * <li>ED_EDIT_IMMEDIATE: If the value is OATRUE, the application can switch the device into edit mode by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-put_mode">IAMExtTransport::put_Mode</a> with the value ED_MODE_EDIT_CUE.</li>
     * <li>ED_EDIT_MODE: Specifies the editing mode. Use one of the following constants.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_EDIT_MODE_ASSEMBLE</td>
     * <td>Assemble edit mode.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_MODE_INSERT</td>
     * <td>Insert edit mode.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_MODE_CRASH_RECORD</td>
     * <td>Crash record mode.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_EDIT_TRACK: Specifies which track to edit. Use one or more of the following constants. You can combine constants with a bitwise OR.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_VIDEO</td>
     * <td>Video track</td>
     * </tr>
     * <tr>
     * <td>ED_AUDIO_1 through ED_AUDIO_24</td>
     * <td>Audio tracks 1 through 24</td>
     * </tr>
     * <tr>
     * <td>ED_AUDIO_ALL</td>
     * <td>All audio track</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_EDIT_SRC_INPOINT: Specifies the inpoint on the source, in units of the current time format.</li>
     * <li>ED_EDIT_SRC_OUTPOINT: Specifies the outpoint on the source, in units of the current time format.</li>
     * <li>ED_EDIT_REC_INPOINT: Specifies the inpoint on the record device, in units of the current time format.</li>
     * <li>ED_EDIT_REC_OUTPOINT: Specifies the outpoint on the record device, in units of the current time format.</li>
     * <li>ED_EDIT_REHEARSE_MODE: Specifies the preview mode. Use one of the following constants.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_EDIT_BVB</td>
     * <td>Black-video-black (BVB). Display black, then inserted video, then black.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_VBV</td>
     * <td>Video-black-video (VBV). Display recorded video, then black, then recorded video.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_VVV</td>
     * <td>Video-video-video (VVV). Display recorded video, then inserted video, then recorded video.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_PERFORM</td>
     * <td>Do not preview.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>ED_EDIT_ABORT: With the value OATRUE, the method halts the edit if it is currently in progress.</li>
     * <li>ED_EDIT_TIMEOUT: Specifies how long the device will wait for the edit to complete, before timing out.</li>
     * <li>ED_EDIT_SEEK: With the value OATRUE, the method seeks to a specified point. First call this method with the ED_EDIT_SEEK_MODE flag, to specify the seek point.</li>
     * <li>ED_EDIT_SEEK_MODE: Specifies a seek point. Use one of the following constants.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_EDIT_SEEK_EDIT_IN</td>
     * <td>Seek to the inpoint.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_SEEK_EDIT_OUT</td>
     * <td>Seek to the outpoint.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_SEEK_PREROLL</td>
     * <td>Seek to the inpoint preroll.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_SEEK_PREROLL_CT</td>
     * <td>Seek to the inpoint using timecode, then seek back to the preroll point using the control track.</td>
     * </tr>
     * <tr>
     * <td>ED_EDIT_SEEK_BOOKMARK</td>
     * <td>Seek to the next bookmark.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * </ul>
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
     * @param {Integer} EditID Specifies the edit property set. Use the identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamexttransport-seteditpropertyset">IAMExtTransport::SetEditPropertySet</a> method.
     * @param {Integer} Param Specifies the edit event parameter. See Remarks for more information.
     * @param {Integer} Value Specifies the value of the parameter. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-seteditproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_editstart
     */
    get_EditStart() {
        result := ComCall(29, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The put_EditStart method activates the edit control on a capable transport.
     * @remarks
     * Use this method to manually enable edit control. Edit control is defined as the precise enabling of individual, or a set of, record tracks on a VCR; for example, a video-only insert edit, where only the video record head is enabled and a new video signal is recorded—the audio signal is left as is. Use this method to control "on the fly" editing on machines that have this feature.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> does not support this method. It returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_editstart
     */
    put_EditStart(Value) {
        result := ComCall(30, this, "int", Value, "HRESULT")
        return result
    }
}
