#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ContentRestrictionsBrowsePolicy.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.ContentRestrictions
 * @version WindowsRuntime 1.4
 */
class IRatedContentRestrictions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRatedContentRestrictions
     * @type {Guid}
     */
    static IID => Guid("{3f7f23cb-ba07-4401-a49d-8b9222205723}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBrowsePolicyAsync", "GetRestrictionLevelAsync", "RequestContentAccessAsync", "add_RestrictionsChanged", "remove_RestrictionsChanged"]

    /**
     * 
     * @returns {IAsyncOperation<ContentRestrictionsBrowsePolicy>} 
     */
    GetBrowsePolicyAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContentRestrictionsBrowsePolicy, operation)
    }

    /**
     * 
     * @param {RatedContentDescription} RatedContentDescription_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetRestrictionLevelAsync(RatedContentDescription_) {
        result := ComCall(7, this, "ptr", RatedContentDescription_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {RatedContentDescription} RatedContentDescription_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestContentAccessAsync(RatedContentDescription_) {
        result := ComCall(8, this, "ptr", RatedContentDescription_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RestrictionsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RestrictionsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
