#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ToastNotifier.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ToastNotificationHistory.ahk
#Include .\ToastCollectionManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationManagerForUser2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationManagerForUser2
     * @type {Guid}
     */
    static IID => Guid("{679c64b7-81ab-42c2-8819-c958767753f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetToastNotifierForToastCollectionIdAsync", "GetHistoryForToastCollectionIdAsync", "GetToastCollectionManager", "GetToastCollectionManagerWithAppId"]

    /**
     * 
     * @param {HSTRING} collectionId 
     * @returns {IAsyncOperation<ToastNotifier>} 
     */
    GetToastNotifierForToastCollectionIdAsync(collectionId) {
        if(collectionId is String) {
            pin := HSTRING.Create(collectionId)
            collectionId := pin.Value
        }
        collectionId := collectionId is Win32Handle ? NumGet(collectionId, "ptr") : collectionId

        result := ComCall(6, this, "ptr", collectionId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ToastNotifier, operation)
    }

    /**
     * 
     * @param {HSTRING} collectionId 
     * @returns {IAsyncOperation<ToastNotificationHistory>} 
     */
    GetHistoryForToastCollectionIdAsync(collectionId) {
        if(collectionId is String) {
            pin := HSTRING.Create(collectionId)
            collectionId := pin.Value
        }
        collectionId := collectionId is Win32Handle ? NumGet(collectionId, "ptr") : collectionId

        result := ComCall(7, this, "ptr", collectionId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ToastNotificationHistory, operation)
    }

    /**
     * 
     * @returns {ToastCollectionManager} 
     */
    GetToastCollectionManager() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastCollectionManager(result_)
    }

    /**
     * 
     * @param {HSTRING} appId 
     * @returns {ToastCollectionManager} 
     */
    GetToastCollectionManagerWithAppId(appId) {
        if(appId is String) {
            pin := HSTRING.Create(appId)
            appId := pin.Value
        }
        appId := appId is Win32Handle ? NumGet(appId, "ptr") : appId

        result := ComCall(9, this, "ptr", appId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastCollectionManager(result_)
    }
}
