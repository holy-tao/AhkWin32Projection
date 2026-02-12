#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DisplayMonitor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayMonitorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayMonitorStatics
     * @type {Guid}
     */
    static IID => Guid("{6eae698f-a228-4c05-821d-b695d667de8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "FromIdAsync", "FromInterfaceIdAsync"]

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
     * @returns {IAsyncOperation<DisplayMonitor>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DisplayMonitor, operation)
    }

    /**
     * 
     * @param {HSTRING} deviceInterfaceId 
     * @returns {IAsyncOperation<DisplayMonitor>} 
     */
    FromInterfaceIdAsync(deviceInterfaceId) {
        if(deviceInterfaceId is String) {
            pin := HSTRING.Create(deviceInterfaceId)
            deviceInterfaceId := pin.Value
        }
        deviceInterfaceId := deviceInterfaceId is Win32Handle ? NumGet(deviceInterfaceId, "ptr") : deviceInterfaceId

        result := ComCall(8, this, "ptr", deviceInterfaceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DisplayMonitor, operation)
    }
}
