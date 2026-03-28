#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMExtDevice interface controls an external device, such as a DV camera or video tape recoder (VTR).
 * @remarks
 * The DV device drivers require some additional constants that are defined in the header file Xprtdefs.h.
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-ext-device">PROPSETID_EXT_DEVICE</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * 
 * <h3><a id="Hardware_Requirements"></a><a id="hardware_requirements"></a><a id="HARDWARE_REQUIREMENTS"></a>Hardware Requirements</h3>
 * To control an external VCR, certain hardware requirements are recommended. VCRs with an RS-422 serial interface require a special serial port card or an external RS-232-to-RS-422 adapter. In addition, for best performance, your computer should have a serial port card built with a 16550 high-performance UART (Universal Asynchronous Receiver/Transmitter) to sustain higher baud rates, such as 38.4 baud.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamextdevice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMExtDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMExtDevice
     * @type {Guid}
     */
    static IID => Guid("{b5730a90-1a2c-11cf-8c23-00aa006b6814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapability", "get_ExternalDeviceID", "get_ExternalDeviceVersion", "put_DevicePower", "get_DevicePower", "Calibrate", "put_DevicePort", "get_DevicePort"]

    /**
     * @type {PWSTR} 
     */
    ExternalDeviceID {
        get => this.get_ExternalDeviceID()
    }

    /**
     * @type {PWSTR} 
     */
    ExternalDeviceVersion {
        get => this.get_ExternalDeviceVersion()
    }

    /**
     * @type {Integer} 
     */
    DevicePower {
        get => this.get_DevicePower()
        set => this.put_DevicePower(value)
    }

    /**
     * @type {Integer} 
     */
    DevicePort {
        get => this.get_DevicePort()
        set => this.put_DevicePort(value)
    }

    /**
     * The GetCapability method retrieves the capabilities of the external device.
     * @remarks
     * The <i>Capability</i> parameter is a flag that specifies which capability to check. The method returns the result either in the <i>pValue</i> parameter or in the <i>pdblValue</i> parameter, depending on the capability flag.
     * 
     * For the following flags, the method returns the value OATRUE or OAFALSE in the <i>pValue</i> parameter. The value OATRUE indicates that the capability is present, while the value OAFALSE indicates it is absent.
     * 
     * <table>
     * <tr>
     * <th>Capability flag
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_AUDIO_INPUTS</td>
     * <td>Device accepts audio input.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_CAN_MONITOR_SOURCES</td>
     * <td>Device can send any input to the monitored output, regardless of the input that is currently selected.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_CAN_PREVIEW</td>
     * <td>Device can preview.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_CAN_RECORD</td>
     * <td>Device can record.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_CAN_RECORD_STROBE</td>
     * <td>Device can strobe record. This capability applies to multitrack devices that can record to selected tracks.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_CAN_SAVE</td>
     * <td>Device can save data.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_CTLTRK_READ</td>
     * <td>Device can read control tracks.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_HAS_AUDIO</td>
     * <td>Device has audio.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_HAS_VIDEO</td>
     * <td>Device has video.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_INDEX_READ</td>
     * <td>Device can read index marks.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_NEEDS_CALIBRATING</td>
     * <td>Device needs calibrating. See <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamextdevice-calibrate">IAMExtDevice::Calibrate</a>.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_TIMECODE_READ</td>
     * <td>Device can read SMPTE time code.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_TIMECODE_WRITE</td>
     * <td>Device can set SMPTE time code.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_USES_FILES</td>
     * <td>Device has a built-in file system.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_VIDEO_INPUTS</td>
     * <td>Device accepts video input.</td>
     * </tr>
     * </table>
     *  
     * 
     * For the following flags, the method returns a defined constant in the <i>pValue</i> parameter.
     * 
     * ED_DEVCAP_DEVICE_TYPE: Returns the device type.
     * 
     * <table>
     * <tr>
     * <th>Returned Constant
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_ATR</td>
     * <td>Audio tape recorder</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_CG</td>
     * <td>Character generator</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_DDR</td>
     * <td>Digital disk recorder</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_DVE</td>
     * <td>Digital video effects unit</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_GPI</td>
     * <td>General purpose interface trigger</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_KEYER</td>
     * <td>Video keyer</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_LASERDISK</td>
     * <td>Laserdisc</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_MIXER_AUDIO</td>
     * <td>Audio mixer</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_MIXER_VIDEO</td>
     * <td>Video mixer</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_ROUTER</td>
     * <td>Video router</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_TBC</td>
     * <td>Timebase corrector</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_TCG</td>
     * <td>Timecode generator/reader</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_VCR</td>
     * <td>VCR, or camcorder with full VCR capabilities</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_WIPEGEN</td>
     * <td>Video wipe generator</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_JOYSTICK</td>
     * <td>Joystick</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_KEYBOARD</td>
     * <td>Keyboard</td>
     * </tr>
     * </table>
     *  
     * 
     * ED_DEVCAP_SYNC_ACCURACY: Returns an indication of the device's synchronization accuracy.
     * 
     * <table>
     * <tr>
     * <th>Returned Constant
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_SYNCACC_PRECISE</td>
     * <td>Device has precise accuracy.</td>
     * </tr>
     * <tr>
     * <td>ED_SYNCACC_FRAME</td>
     * <td>Device is frame accurate.</td>
     * </tr>
     * <tr>
     * <td>ED_SYNCACC_ROUGH</td>
     * <td>Device is less than frame accurate.</td>
     * </tr>
     * </table>
     *  
     * 
     * ED_DEVCAP_NORMAL_RATE: Returns the device's normal frame rate.
     * 
     * <table>
     * <tr>
     * <th>Returned Constant
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_RATE_24</td>
     * <td>24 frames per second (fps)</td>
     * </tr>
     * <tr>
     * <td>ED_RATE_25</td>
     * <td>25 fps</td>
     * </tr>
     * <tr>
     * <td>ED_RATE_2997</td>
     * <td>29.97 fps</td>
     * </tr>
     * <tr>
     * <td>ED_RATE_30</td>
     * <td>30 fps</td>
     * </tr>
     * </table>
     *  
     * 
     * ED_DEVCAP_SEEK_TYPE: Returns an indication of the device's seeking accuracy.
     * 
     * <table>
     * <tr>
     * <th>Returned Constant
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ED_SEEK_PERFECT</td>
     * <td>Device can seek within one video frame without a signal break.</td>
     * </tr>
     * <tr>
     * <td>ED_SEEK_FAST</td>
     * <td>Device can seek quickly, with a short break in the signal.</td>
     * </tr>
     * <tr>
     * <td>ED_SEEK_SLOW</td>
     * <td>Device seeks slowly; such as tape transport.</td>
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
     * <td>ED_DEVCAP_EXTERNAL_DEVICE_ID</td>
     * <td>Manufacturer-specific identifier.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_PREROLL</td>
     * <td>Device preroll time.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVCAP_POSTROLL</td>
     * <td>Device postroll time.</td>
     * </tr>
     * </table>
     *  
     * 
     * In Windows XP Service Pack 2 and later, the following additional flags are supported for ED_DEVCAP_DEVICE_TYPE.
     * 
     * <table>
     * <tr>
     * <th>Returned Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_CAMERA_STORAGE</td>
     * <td>Storage for still images or short video files.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_DTV</td>
     * <td>Digital television with serial bus interface.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_PC_VIRTUAL</td>
     * <td>Virtual or emulated device on a computer.</td>
     * </tr>
     * </table>
     *  
     * 
     * To use these constants, include the header file Xprtdefs.h.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> and UVC drivers support the following behaviors.
     * 
     * The ED_DEVCAP_NORMAL_RATE flag returns the frame rate.
     * 
     * <table>
     * <tr>
     * <th>Returned Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_RATE_25</td>
     * <td>25 fps (default PAL frame rate)</td>
     * </tr>
     * <tr>
     * <td>ED_RATE_2997</td>
     * <td>29.997 fps (default NTSC frame rate)</td>
     * </tr>
     * </table>
     *  
     * 
     * For MSDV only, the ED_DEVCAP_DEVICE_TYPE flag returns the device type. Possible values are shown in the following table.  For UVC devices, use the <a href="https://docs.microsoft.com/windows/win32/api/vidcap/nn-vidcap-ikstopologyinfo">IKsTopologyInfo</a> interface instead.
     * 
     * <table>
     * <tr>
     * <th>Returned Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_CAMERA</td>
     * <td>Simple camera that can record or pause-record, but lacks full VCR capabilities.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_DVHS</td>
     * <td>Device supports D-VHS format.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_UNKNOWN</td>
     * <td>Unknown device type.</td>
     * </tr>
     * <tr>
     * <td>ED_DEVTYPE_VCR</td>
     * <td>Device has full VCR capabilities.</td>
     * </tr>
     * </table>
     * @param {Integer} Capability Specifies the capability to check. See Remarks for more information.
     * @param {Pointer<Integer>} pValue Pointer to a variable that receives a <b>long</b> integer. See Remarks for more information.
     * @param {Pointer<Float>} pdblValue Pointer to a variable that receives a <b>double</b>. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-getcapability
     */
    GetCapability(Capability, pValue, pdblValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pdblValueMarshal := pdblValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, "int", Capability, pValueMarshal, pValue, pdblValueMarshal, pdblValue, "HRESULT")
        return result
    }

    /**
     * The get_ExternalDeviceID method retrieves the model number of the external device.
     * @returns {PWSTR} Pointer to an <b>LPOLESTR</b> that receives the manufacturer-specific identification as a string. The caller must release the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-get_externaldeviceid
     */
    get_ExternalDeviceID() {
        result := ComCall(4, this, "ptr*", &ppszData := 0, "HRESULT")
        return ppszData
    }

    /**
     * The get_ExternalDeviceVersion retrieves the version number of the external device's operating software.
     * @returns {PWSTR} Pointer to an <b>LPOLESTR</b> that receives the manufacturer-specific operating software version number as a string. The caller must release the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-get_externaldeviceversion
     */
    get_ExternalDeviceVersion() {
        result := ComCall(5, this, "ptr*", &ppszData := 0, "HRESULT")
        return ppszData
    }

    /**
     * The put_DevicePower method assigns the external device's power mode to either on, off, or standby.
     * @param {Integer} PowerMode 
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-put_devicepower
     */
    put_DevicePower(PowerMode) {
        result := ComCall(6, this, "int", PowerMode, "HRESULT")
        return result
    }

    /**
     * The get_DevicePower method retrieves the external device's power mode.
     * @remarks
     * In Windows XP Service Pack 2 and later, the following additional power mode is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ED_POWER_DEVICE_DEPENDENT</td>
     * <td>Power is on with limited functions.</td>
     * </tr>
     * </table>
     *  
     * 
     * To use this constant, include the header file Xprtdefs.h.
     * 
     * <h3><a id="DV_and_MPEG_Camcorder_Implementation"></a><a id="dv_and_mpeg_camcorder_implementation"></a><a id="DV_AND_MPEG_CAMCORDER_IMPLEMENTATION"></a>DV and MPEG Camcorder Implementation</h3>
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> and UVC drivers return ED_POWER_ON when the camcorder is on. If the camcorder is off or in standby mode, the DV driver is not loaded, so this method is not available. If the camcorder is removed unexpectedly, the method can return ERROR_GEN_FAILURE.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mstape-driver">MSTape</a> supports both ED_POWER_OFF and ED_POWER_ON, but not ED_POWER_STANDBY.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-get_devicepower
     */
    get_DevicePower() {
        result := ComCall(7, this, "int*", &pPowerMode := 0, "HRESULT")
        return pPowerMode
    }

    /**
     * The Calibrate method calibrates an external device's transport mechanism.
     * @remarks
     * Use this method on certain external devices that require calibration; for example, rewinding a tape and resetting the counter, or computing the frame offset for a timecode reader.
     * 
     * Filters for various external devices can implement this method differently, depending on the calibration that the device needs. This method assumes the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediaeventsink">IMediaEventSink</a> interface has already established an event sink, or that another event signaling method has been established.
     * 
     * <h3><a id="DV_Implementation"></a><a id="dv_implementation"></a><a id="DV_IMPLEMENTATION"></a>DV Implementation</h3>
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/msdv-driver">MSDV</a> and UVC drivers do not support this method. The method returns E_NOTIMPL.
     * @param {Pointer} hEvent Handle to an event. The event is signaled when the action is complete.
     * @param {Integer} _Mode 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-calibrate
     */
    Calibrate(hEvent, _Mode) {
        result := ComCall(8, this, "ptr", hEvent, "int", _Mode, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The put_DevicePort method assigns the communication port to which the external device is connected.
     * @param {Integer} DevicePort 
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-put_deviceport
     */
    put_DevicePort(DevicePort) {
        result := ComCall(9, this, "int", DevicePort, "HRESULT")
        return result
    }

    /**
     * The get_DevicePort method retrieves the communication port to which the external device is connected.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-get_deviceport
     */
    get_DevicePort() {
        result := ComCall(10, this, "int*", &pDevicePort := 0, "HRESULT")
        return pDevicePort
    }
}
