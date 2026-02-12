#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PwmController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Pwm
 * @version WindowsRuntime 1.4
 */
class IPwmControllerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPwmControllerStatics3
     * @type {Guid}
     */
    static IID => Guid("{b2581871-0229-4344-ae3f-9b7cd0e66b94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDeviceSelectorFromFriendlyName", "FromIdAsync"]

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
     * @param {HSTRING} friendlyName 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromFriendlyName(friendlyName) {
        if(friendlyName is String) {
            pin := HSTRING.Create(friendlyName)
            friendlyName := pin.Value
        }
        friendlyName := friendlyName is Win32Handle ? NumGet(friendlyName, "ptr") : friendlyName

        result_ := HSTRING()
        result := ComCall(7, this, "ptr", friendlyName, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<PwmController>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PwmController, operation)
    }
}
