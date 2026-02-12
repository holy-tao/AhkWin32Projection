#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\MicrosoftAccountMultiFactorSessionInfo.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo
     * @type {Guid}
     */
    static IID => Guid("{aa7ec5fb-da3f-4088-a20d-5618afadb2e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Sessions", "get_UnregisteredAccounts", "get_ServiceResponse"]

    /**
     * @type {IVectorView<MicrosoftAccountMultiFactorSessionInfo>} 
     */
    Sessions {
        get => this.get_Sessions()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    UnregisteredAccounts {
        get => this.get_UnregisteredAccounts()
    }

    /**
     * @type {Integer} 
     */
    ServiceResponse {
        get => this.get_ServiceResponse()
    }

    /**
     * 
     * @returns {IVectorView<MicrosoftAccountMultiFactorSessionInfo>} 
     */
    get_Sessions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MicrosoftAccountMultiFactorSessionInfo, value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_UnregisteredAccounts() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceResponse() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
