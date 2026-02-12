#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattDeviceService.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattDeviceServiceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattDeviceServiceStatics
     * @type {Guid}
     */
    static IID => Guid("{196d0022-faad-45dc-ae5b-2ac3184e84db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdAsync", "GetDeviceSelectorFromUuid", "GetDeviceSelectorFromShortId", "ConvertShortIdToUuid"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<GattDeviceService>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDeviceService, asyncOp)
    }

    /**
     * 
     * @param {Guid} serviceUuid 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromUuid(serviceUuid) {
        selector_ := HSTRING()
        result := ComCall(7, this, "ptr", serviceUuid, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {Integer} serviceShortId 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromShortId(serviceShortId) {
        selector_ := HSTRING()
        result := ComCall(8, this, "ushort", serviceShortId, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {Integer} shortId 
     * @returns {Guid} 
     */
    ConvertShortIdToUuid(shortId) {
        serviceUuid := Guid()
        result := ComCall(9, this, "ushort", shortId, "ptr", serviceUuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return serviceUuid
    }
}
