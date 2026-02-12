#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\CastingDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class ICastingDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{e7d958d7-4d13-4237-a365-4c4f6a4cfd2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDeviceSelectorFromCastingSourceAsync", "FromIdAsync", "DeviceInfoSupportsCastingAsync"]

    /**
     * 
     * @param {Integer} type 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(type) {
        value := HSTRING()
        result := ComCall(6, this, "uint", type, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CastingSource} castingSource_ 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetDeviceSelectorFromCastingSourceAsync(castingSource_) {
        result := ComCall(7, this, "ptr", castingSource_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IAsyncOperation<CastingDevice>} 
     */
    FromIdAsync(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CastingDevice, operation)
    }

    /**
     * 
     * @param {DeviceInformation} device 
     * @returns {IAsyncOperation<Boolean>} 
     */
    DeviceInfoSupportsCastingAsync(device) {
        result := ComCall(9, this, "ptr", device, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
