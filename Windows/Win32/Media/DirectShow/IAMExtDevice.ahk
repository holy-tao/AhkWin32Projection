#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMExtDevice interface controls an external device, such as a DV camera or video tape recoder (VTR).
 * @remarks
 * 
 * The DV device drivers require some additional constants that are defined in the header file Xprtdefs.h.
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-ext-device">PROPSETID_EXT_DEVICE</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documtenation.
 * 
 * <h3><a id="Hardware_Requirements"></a><a id="hardware_requirements"></a><a id="HARDWARE_REQUIREMENTS"></a>Hardware Requirements</h3>
 * To control an external VCR, certain hardware requirements are recommended. VCRs with an RS-422 serial interface require a special serial port card or an external RS-232-to-RS-422 adapter. In addition, for best performance, your computer should have a serial port card built with a 16550 high-performance UART (Universal Asynchronous Receiver/Transmitter) to sustain higher baud rates, such as 38.4 baud.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamextdevice
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
     * @param {Integer} Capability Specifies the capability to check. See Remarks for more information.
     * @param {Pointer<Integer>} pValue Pointer to a variable that receives a <b>long</b> integer. See Remarks for more information.
     * @param {Pointer<Float>} pdblValue Pointer to a variable that receives a <b>double</b>. See Remarks for more information.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamextdevice-getcapability
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamextdevice-get_externaldeviceid
     */
    get_ExternalDeviceID() {
        result := ComCall(4, this, "ptr*", &ppszData := 0, "HRESULT")
        return ppszData
    }

    /**
     * The get_ExternalDeviceVersion retrieves the version number of the external device's operating software.
     * @returns {PWSTR} Pointer to an <b>LPOLESTR</b> that receives the manufacturer-specific operating software version number as a string. The caller must release the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamextdevice-get_externaldeviceversion
     */
    get_ExternalDeviceVersion() {
        result := ComCall(5, this, "ptr*", &ppszData := 0, "HRESULT")
        return ppszData
    }

    /**
     * The put_DevicePower method assigns the external device's power mode to either on, off, or standby.
     * @param {Integer} PowerMode 
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamextdevice-put_devicepower
     */
    put_DevicePower(PowerMode) {
        result := ComCall(6, this, "int", PowerMode, "HRESULT")
        return result
    }

    /**
     * The get_DevicePower method retrieves the external device's power mode.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamextdevice-get_devicepower
     */
    get_DevicePower() {
        result := ComCall(7, this, "int*", &pPowerMode := 0, "HRESULT")
        return pPowerMode
    }

    /**
     * The Calibrate method calibrates an external device's transport mechanism.
     * @param {Pointer} hEvent Handle to an event. The event is signaled when the action is complete.
     * @param {Integer} Mode Specifies a value that activates or deactivates the calibration process:
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
     * <td>Activates the calibration process.</td>
     * </tr>
     * <tr>
     * <td>ED_INACTIVE</td>
     * <td>Deactivates the calibration process.</td>
     * </tr>
     * <tr>
     * <td><b>NULL</b></td>
     * <td>No action; return the calibration status in <i>pStatus</i>.</td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamextdevice-calibrate
     */
    Calibrate(hEvent, Mode) {
        result := ComCall(8, this, "ptr", hEvent, "int", Mode, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The put_DevicePort method assigns the communication port to which the external device is connected.
     * @param {Integer} DevicePort 
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamextdevice-put_deviceport
     */
    put_DevicePort(DevicePort) {
        result := ComCall(9, this, "int", DevicePort, "HRESULT")
        return result
    }

    /**
     * The get_DevicePort method retrieves the communication port to which the external device is connected.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamextdevice-get_deviceport
     */
    get_DevicePort() {
        result := ComCall(10, this, "int*", &pDevicePort := 0, "HRESULT")
        return pDevicePort
    }
}
