#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DeviceAccessInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceAccessInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceAccessInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{574bd3d3-5f30-45cd-8a94-724fe5973084}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromId", "CreateFromDeviceClassId", "CreateFromDeviceClass"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {DeviceAccessInformation} 
     */
    CreateFromId(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceAccessInformation(value)
    }

    /**
     * 
     * @param {Guid} deviceClassId 
     * @returns {DeviceAccessInformation} 
     */
    CreateFromDeviceClassId(deviceClassId) {
        result := ComCall(7, this, "ptr", deviceClassId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceAccessInformation(value)
    }

    /**
     * 
     * @param {Integer} deviceClass_ 
     * @returns {DeviceAccessInformation} 
     */
    CreateFromDeviceClass(deviceClass_) {
        result := ComCall(8, this, "int", deviceClass_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceAccessInformation(value)
    }
}
