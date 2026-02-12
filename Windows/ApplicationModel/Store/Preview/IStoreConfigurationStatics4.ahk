#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStoreConfigurationStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreConfigurationStatics4
     * @type {Guid}
     */
    static IID => Guid("{20ff56d2-4ee3-4cf0-9b12-552c03310f75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStoreWebAccountId", "GetStoreWebAccountIdForUser", "SetEnterpriseStoreWebAccountId", "SetEnterpriseStoreWebAccountIdForUser", "GetEnterpriseStoreWebAccountId", "GetEnterpriseStoreWebAccountIdForUser", "ShouldRestrictToEnterpriseStoreOnly", "ShouldRestrictToEnterpriseStoreOnlyForUser"]

    /**
     * 
     * @returns {HSTRING} 
     */
    GetStoreWebAccountId() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {HSTRING} 
     */
    GetStoreWebAccountIdForUser(user_) {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", user_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} webAccountId 
     * @returns {HRESULT} 
     */
    SetEnterpriseStoreWebAccountId(webAccountId) {
        if(webAccountId is String) {
            pin := HSTRING.Create(webAccountId)
            webAccountId := pin.Value
        }
        webAccountId := webAccountId is Win32Handle ? NumGet(webAccountId, "ptr") : webAccountId

        result := ComCall(8, this, "ptr", webAccountId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} webAccountId 
     * @returns {HRESULT} 
     */
    SetEnterpriseStoreWebAccountIdForUser(user_, webAccountId) {
        if(webAccountId is String) {
            pin := HSTRING.Create(webAccountId)
            webAccountId := pin.Value
        }
        webAccountId := webAccountId is Win32Handle ? NumGet(webAccountId, "ptr") : webAccountId

        result := ComCall(9, this, "ptr", user_, "ptr", webAccountId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetEnterpriseStoreWebAccountId() {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {HSTRING} 
     */
    GetEnterpriseStoreWebAccountIdForUser(user_) {
        result_ := HSTRING()
        result := ComCall(11, this, "ptr", user_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    ShouldRestrictToEnterpriseStoreOnly() {
        result := ComCall(12, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {Boolean} 
     */
    ShouldRestrictToEnterpriseStoreOnlyForUser(user_) {
        result := ComCall(13, this, "ptr", user_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
