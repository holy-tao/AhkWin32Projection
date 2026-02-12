#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IppPrintDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppPrintDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppPrintDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{7dc19f08-7f20-52ab-94a7-894b83b2a17e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "FromId", "FromPrinterName", "IsIppPrinter"]

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IppPrintDevice} 
     */
    FromId(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppPrintDevice(result_)
    }

    /**
     * 
     * @param {HSTRING} printerName 
     * @returns {IppPrintDevice} 
     */
    FromPrinterName(printerName) {
        if(printerName is String) {
            pin := HSTRING.Create(printerName)
            printerName := pin.Value
        }
        printerName := printerName is Win32Handle ? NumGet(printerName, "ptr") : printerName

        result := ComCall(8, this, "ptr", printerName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppPrintDevice(result_)
    }

    /**
     * 
     * @param {HSTRING} printerName 
     * @returns {Boolean} 
     */
    IsIppPrinter(printerName) {
        if(printerName is String) {
            pin := HSTRING.Create(printerName)
            printerName := pin.Value
        }
        printerName := printerName is Win32Handle ? NumGet(printerName, "ptr") : printerName

        result := ComCall(9, this, "ptr", printerName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
