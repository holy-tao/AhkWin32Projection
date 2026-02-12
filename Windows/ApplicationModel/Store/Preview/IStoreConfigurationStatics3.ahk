#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStoreConfigurationStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreConfigurationStatics3
     * @type {Guid}
     */
    static IID => Guid("{6d45f57c-f144-4cb5-9d3f-4eb05e30b6d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasStoreWebAccount", "HasStoreWebAccountForUser", "GetStoreLogDataAsync", "SetStoreWebAccountIdForUser", "IsStoreWebAccountIdForUser", "GetPurchasePromptingPolicyForUser", "SetPurchasePromptingPolicyForUser"]

    /**
     * 
     * @returns {Boolean} 
     */
    HasStoreWebAccount() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {Boolean} 
     */
    HasStoreWebAccountForUser(user_) {
        result := ComCall(7, this, "ptr", user_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IAsyncOperation<IRandomAccessStreamReference>} 
     */
    GetStoreLogDataAsync(options) {
        result := ComCall(8, this, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamReference, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} webAccountId 
     * @returns {HRESULT} 
     */
    SetStoreWebAccountIdForUser(user_, webAccountId) {
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
     * @param {User} user_ 
     * @param {HSTRING} webAccountId 
     * @returns {Boolean} 
     */
    IsStoreWebAccountIdForUser(user_, webAccountId) {
        if(webAccountId is String) {
            pin := HSTRING.Create(webAccountId)
            webAccountId := pin.Value
        }
        webAccountId := webAccountId is Win32Handle ? NumGet(webAccountId, "ptr") : webAccountId

        result := ComCall(10, this, "ptr", user_, "ptr", webAccountId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {IReference<Integer>} 
     */
    GetPurchasePromptingPolicyForUser(user_) {
        result := ComCall(11, this, "ptr", user_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    SetPurchasePromptingPolicyForUser(user_, value) {
        result := ComCall(12, this, "ptr", user_, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
