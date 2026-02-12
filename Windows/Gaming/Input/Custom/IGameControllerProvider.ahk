#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GameControllerVersionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Base interface that represents the physical game controller devices connected to the system.
 * @remarks
 * Device classes are not activatable, they can be enumerated via a collection property on the device manager runtime class, however this is restricted to store apps with the xboxAccessoryManagement capability. The typical way to gain access to a device class object is by registering a factory for a custom game controller class.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerprovider
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IGameControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{e6d73982-2996-4559-b16c-3e57d46e58d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FirmwareVersionInfo", "get_HardwareProductId", "get_HardwareVendorId", "get_HardwareVersionInfo", "get_IsConnected"]

    /**
     * Contains information on the firmware version of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerprovider.firmwareversioninfo
     * @type {GameControllerVersionInfo} 
     */
    FirmwareVersionInfo {
        get => this.get_FirmwareVersionInfo()
    }

    /**
     * The hardware product ID of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerprovider.hardwareproductid
     * @type {Integer} 
     */
    HardwareProductId {
        get => this.get_HardwareProductId()
    }

    /**
     * The hardware vendor ID of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerprovider.hardwarevendorid
     * @type {Integer} 
     */
    HardwareVendorId {
        get => this.get_HardwareVendorId()
    }

    /**
     * Contains information on the hardware version.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerprovider.hardwareversioninfo
     * @type {GameControllerVersionInfo} 
     */
    HardwareVersionInfo {
        get => this.get_HardwareVersionInfo()
    }

    /**
     * Boolean value indicating whether the controller is connected.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerprovider.isconnected
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * 
     * @returns {GameControllerVersionInfo} 
     */
    get_FirmwareVersionInfo() {
        value := GameControllerVersionInfo()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareProductId() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVendorId() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GameControllerVersionInfo} 
     */
    get_HardwareVersionInfo() {
        value := GameControllerVersionInfo()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
