#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Battery.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class IBatteryStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBatteryStatics
     * @type {Guid}
     */
    static IID => Guid("{79cd72b6-9e5e-4452-bea6-dfcd541e597f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AggregateBattery", "FromIdAsync", "GetDeviceSelector"]

    /**
     * @type {Battery} 
     */
    AggregateBattery {
        get => this.get_AggregateBattery()
    }

    /**
     * 
     * @returns {Battery} 
     */
    get_AggregateBattery() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Battery(result_)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<Battery>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Battery, result_)
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
}
