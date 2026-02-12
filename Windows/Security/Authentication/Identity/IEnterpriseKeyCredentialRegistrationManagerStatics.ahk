#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\EnterpriseKeyCredentialRegistrationManager.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity
 * @version WindowsRuntime 1.4
 */
class IEnterpriseKeyCredentialRegistrationManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnterpriseKeyCredentialRegistrationManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{77b85e9e-acf4-4bc0-bac2-40bb46efbb3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current"]

    /**
     * @type {EnterpriseKeyCredentialRegistrationManager} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {EnterpriseKeyCredentialRegistrationManager} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EnterpriseKeyCredentialRegistrationManager(value)
    }
}
