#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\SocialFeedUpdater.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SocialDashboardItemUpdater.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.SocialInfo.Provider
 * @version WindowsRuntime 1.4
 */
class ISocialInfoProviderManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocialInfoProviderManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{1b88e52b-7787-48d6-aa12-d8e8f47ab85a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSocialFeedUpdaterAsync", "CreateDashboardItemUpdaterAsync", "UpdateBadgeCountValue", "ReportNewContentAvailable", "ProvisionAsync", "DeprovisionAsync"]

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} mode_ 
     * @param {HSTRING} ownerRemoteId 
     * @returns {IAsyncOperation<SocialFeedUpdater>} 
     */
    CreateSocialFeedUpdaterAsync(kind, mode_, ownerRemoteId) {
        if(ownerRemoteId is String) {
            pin := HSTRING.Create(ownerRemoteId)
            ownerRemoteId := pin.Value
        }
        ownerRemoteId := ownerRemoteId is Win32Handle ? NumGet(ownerRemoteId, "ptr") : ownerRemoteId

        result := ComCall(6, this, "int", kind, "int", mode_, "ptr", ownerRemoteId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SocialFeedUpdater, operation)
    }

    /**
     * 
     * @param {HSTRING} ownerRemoteId 
     * @returns {IAsyncOperation<SocialDashboardItemUpdater>} 
     */
    CreateDashboardItemUpdaterAsync(ownerRemoteId) {
        if(ownerRemoteId is String) {
            pin := HSTRING.Create(ownerRemoteId)
            ownerRemoteId := pin.Value
        }
        ownerRemoteId := ownerRemoteId is Win32Handle ? NumGet(ownerRemoteId, "ptr") : ownerRemoteId

        result := ComCall(7, this, "ptr", ownerRemoteId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SocialDashboardItemUpdater, operation)
    }

    /**
     * 
     * @param {HSTRING} itemRemoteId 
     * @param {Integer} newCount 
     * @returns {HRESULT} 
     */
    UpdateBadgeCountValue(itemRemoteId, newCount) {
        if(itemRemoteId is String) {
            pin := HSTRING.Create(itemRemoteId)
            itemRemoteId := pin.Value
        }
        itemRemoteId := itemRemoteId is Win32Handle ? NumGet(itemRemoteId, "ptr") : itemRemoteId

        result := ComCall(8, this, "ptr", itemRemoteId, "int", newCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} contactRemoteId 
     * @param {Integer} kind 
     * @returns {HRESULT} 
     */
    ReportNewContentAvailable(contactRemoteId, kind) {
        if(contactRemoteId is String) {
            pin := HSTRING.Create(contactRemoteId)
            contactRemoteId := pin.Value
        }
        contactRemoteId := contactRemoteId is Win32Handle ? NumGet(contactRemoteId, "ptr") : contactRemoteId

        result := ComCall(9, this, "ptr", contactRemoteId, "int", kind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ProvisionAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeprovisionAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
