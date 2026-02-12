#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Enumeration\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information when an app is activated as a result of a device pairing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.idevicepairingactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IDevicePairingActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePairingActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{eba0d1e4-ecc6-4148-94ed-f4b37ec05b3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceInformation"]

    /**
     * Gets the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object for the device object that is being paired.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.idevicepairingactivatedeventargs.deviceinformation
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }
}
