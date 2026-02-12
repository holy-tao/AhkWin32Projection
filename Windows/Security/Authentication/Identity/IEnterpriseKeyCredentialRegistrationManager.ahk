#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\EnterpriseKeyCredentialRegistrationInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity
 * @version WindowsRuntime 1.4
 */
class IEnterpriseKeyCredentialRegistrationManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnterpriseKeyCredentialRegistrationManager
     * @type {Guid}
     */
    static IID => Guid("{83f3be3f-a25f-4cba-bb8e-bdc32d03c297}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRegistrationsAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<EnterpriseKeyCredentialRegistrationInfo>>} 
     */
    GetRegistrationsAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EnterpriseKeyCredentialRegistrationInfo), value)
    }
}
