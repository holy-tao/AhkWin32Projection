#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\CustomDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class ICustomDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{c8220312-ef4c-46b1-a58e-eeb308dc8917}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "FromIdAsync"]

    /**
     * 
     * @param {Guid} classGuid 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(classGuid) {
        value := HSTRING()
        result := ComCall(6, this, "ptr", classGuid, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} desiredAccess 
     * @param {Integer} sharingMode 
     * @returns {IAsyncOperation<CustomDevice>} 
     */
    FromIdAsync(deviceId, desiredAccess, sharingMode) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "int", desiredAccess, "int", sharingMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CustomDevice, operation)
    }
}
