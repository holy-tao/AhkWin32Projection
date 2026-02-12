#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts.Provider
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountProviderResolveErrorsOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountProviderResolveErrorsOperation
     * @type {Guid}
     */
    static IID => Guid("{6235dc15-bfcb-41e1-9957-9759a28846cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserDataAccountId", "ReportCompleted"]

    /**
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReportCompleted() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
