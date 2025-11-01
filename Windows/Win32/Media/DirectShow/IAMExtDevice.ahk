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
     * 
     * @param {Integer} Capability 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Float>} pdblValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-getcapability
     */
    GetCapability(Capability, pValue, pdblValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pdblValueMarshal := pdblValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, "int", Capability, pValueMarshal, pValue, pdblValueMarshal, pdblValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-get_externaldeviceid
     */
    get_ExternalDeviceID(ppszData) {
        result := ComCall(4, this, "ptr", ppszData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-get_externaldeviceversion
     */
    get_ExternalDeviceVersion(ppszData) {
        result := ComCall(5, this, "ptr", ppszData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PowerMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-put_devicepower
     */
    put_DevicePower(PowerMode) {
        result := ComCall(6, this, "int", PowerMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPowerMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-get_devicepower
     */
    get_DevicePower(pPowerMode) {
        pPowerModeMarshal := pPowerMode is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pPowerModeMarshal, pPowerMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hEvent 
     * @param {Integer} Mode 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-calibrate
     */
    Calibrate(hEvent, Mode, pStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", hEvent, "int", Mode, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DevicePort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-put_deviceport
     */
    put_DevicePort(DevicePort) {
        result := ComCall(9, this, "int", DevicePort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDevicePort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamextdevice-get_deviceport
     */
    get_DevicePort(pDevicePort) {
        pDevicePortMarshal := pDevicePort is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pDevicePortMarshal, pDevicePort, "HRESULT")
        return result
    }
}
