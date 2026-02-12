#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\I2cDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides ways to open a communications channel to a device on an inter-integrated circuit (I<sup>2</sup> C) bus.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.ii2cdevicestatics
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class II2cDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for II2cDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{91a33be3-7334-4512-96bc-fbae9459f5f6}")

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
     * Retrieves an Advanced Query Syntax (AQS) string for the inter-integrated circuit (I<sup>2</sup> C) bus that has the specified friendly name. You can use this string with the [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) method to get a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object for that bus.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.ii2cdevicestatics.getdeviceselector
     */
    GetDeviceSelector() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves an Advanced Query Syntax (AQS) string for all of the inter-integrated circuit (I<sup>2</sup> C) bus controllers on the system. You can use this string with the [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) method to get [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects for those bus controllers.
     * @param {HSTRING} friendlyName 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.ii2cdevicestatics.getdeviceselector
     */
    GetDeviceSelectorFromFriendlyName(friendlyName) {
        if(friendlyName is String) {
            pin := HSTRING.Create(friendlyName)
            friendlyName := pin.Value
        }
        friendlyName := friendlyName is Win32Handle ? NumGet(friendlyName, "ptr") : friendlyName

        value := HSTRING()
        result := ComCall(7, this, "ptr", friendlyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves an [I2cDevice](i2cdevice.md) object asynchronously for the inter-integrated circuit (I<sup>2</sup> C) bus controller that has the specified plug and play device identifier, using the specified connection settings.
     * @param {HSTRING} deviceId The plug and play device identifier of the I<sup>2</sup> C bus controller for which you want to create an [I2cDevice](i2cdevice.md) object.
     * @param {I2cConnectionSettings} settings The connection settings to use for communication with the I<sup>2</sup> C bus controller that *deviceId* specifies.
     * @returns {IAsyncOperation<I2cDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.ii2cdevicestatics.fromidasync
     */
    FromIdAsync(deviceId, settings) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "ptr", settings, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(I2cDevice, operation)
    }
}
