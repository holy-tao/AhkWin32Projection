#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class ISystemSupportDeviceInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemSupportDeviceInfo
     * @type {Guid}
     */
    static IID => Guid("{05880b99-8247-441b-a996-a1784bab79a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OperatingSystem", "get_FriendlyName", "get_SystemManufacturer", "get_SystemProductName", "get_SystemSku", "get_SystemHardwareVersion", "get_SystemFirmwareVersion"]

    /**
     * @type {HSTRING} 
     */
    OperatingSystem {
        get => this.get_OperatingSystem()
    }

    /**
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * @type {HSTRING} 
     */
    SystemManufacturer {
        get => this.get_SystemManufacturer()
    }

    /**
     * @type {HSTRING} 
     */
    SystemProductName {
        get => this.get_SystemProductName()
    }

    /**
     * @type {HSTRING} 
     */
    SystemSku {
        get => this.get_SystemSku()
    }

    /**
     * @type {HSTRING} 
     */
    SystemHardwareVersion {
        get => this.get_SystemHardwareVersion()
    }

    /**
     * @type {HSTRING} 
     */
    SystemFirmwareVersion {
        get => this.get_SystemFirmwareVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OperatingSystem() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemManufacturer() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemProductName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemSku() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemHardwareVersion() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemFirmwareVersion() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
