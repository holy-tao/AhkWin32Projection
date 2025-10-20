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
     * 
     * @param {Integer} Capability 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Double>} pdblValue 
     * @returns {HRESULT} 
     */
    GetCapability(Capability, pValue, pdblValue) {
        result := ComCall(3, this, "int", Capability, "int*", pValue, "double*", pdblValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszData 
     * @returns {HRESULT} 
     */
    get_ExternalDeviceID(ppszData) {
        result := ComCall(4, this, "ptr", ppszData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszData 
     * @returns {HRESULT} 
     */
    get_ExternalDeviceVersion(ppszData) {
        result := ComCall(5, this, "ptr", ppszData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PowerMode 
     * @returns {HRESULT} 
     */
    put_DevicePower(PowerMode) {
        result := ComCall(6, this, "int", PowerMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPowerMode 
     * @returns {HRESULT} 
     */
    get_DevicePower(pPowerMode) {
        result := ComCall(7, this, "int*", pPowerMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hEvent 
     * @param {Integer} Mode 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    Calibrate(hEvent, Mode, pStatus) {
        result := ComCall(8, this, "ptr", hEvent, "int", Mode, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DevicePort 
     * @returns {HRESULT} 
     */
    put_DevicePort(DevicePort) {
        result := ComCall(9, this, "int", DevicePort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDevicePort 
     * @returns {HRESULT} 
     */
    get_DevicePort(pDevicePort) {
        result := ComCall(10, this, "int*", pDevicePort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
