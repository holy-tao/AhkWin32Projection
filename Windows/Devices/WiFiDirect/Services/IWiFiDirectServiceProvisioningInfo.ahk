#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectServiceProvisioningInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectServiceProvisioningInfo
     * @type {Guid}
     */
    static IID => Guid("{8bdb7cfe-97d9-45a2-8e99-db50910fb6a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedConfigurationMethod", "get_IsGroupFormationNeeded"]

    /**
     * @type {Integer} 
     */
    SelectedConfigurationMethod {
        get => this.get_SelectedConfigurationMethod()
    }

    /**
     * @type {Boolean} 
     */
    IsGroupFormationNeeded {
        get => this.get_IsGroupFormationNeeded()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedConfigurationMethod() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGroupFormationNeeded() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
