#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\LineDisplay.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayStatics
     * @type {Guid}
     */
    static IID => Guid("{022dc0b6-11b0-4690-9547-0b39c5af2114}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdAsync", "GetDefaultAsync", "GetDeviceSelector", "GetDeviceSelectorWithConnectionTypes"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<LineDisplay>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LineDisplay, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<LineDisplay>} 
     */
    GetDefaultAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LineDisplay, result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} connectionTypes 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorWithConnectionTypes(connectionTypes) {
        value := HSTRING()
        result := ComCall(9, this, "uint", connectionTypes, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
