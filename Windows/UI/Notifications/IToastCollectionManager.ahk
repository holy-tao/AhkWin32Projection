#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ToastCollection.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastCollectionManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastCollectionManager
     * @type {Guid}
     */
    static IID => Guid("{2a1821fe-179d-49bc-b79d-a527920d3665}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveToastCollectionAsync", "FindAllToastCollectionsAsync", "GetToastCollectionAsync", "RemoveToastCollectionAsync", "RemoveAllToastCollectionsAsync", "get_User", "get_AppId"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * 
     * @param {ToastCollection} collection 
     * @returns {IAsyncAction} 
     */
    SaveToastCollectionAsync(collection) {
        result := ComCall(6, this, "ptr", collection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ToastCollection>>} 
     */
    FindAllToastCollectionsAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ToastCollection), operation)
    }

    /**
     * 
     * @param {HSTRING} collectionId 
     * @returns {IAsyncOperation<ToastCollection>} 
     */
    GetToastCollectionAsync(collectionId) {
        if(collectionId is String) {
            pin := HSTRING.Create(collectionId)
            collectionId := pin.Value
        }
        collectionId := collectionId is Win32Handle ? NumGet(collectionId, "ptr") : collectionId

        result := ComCall(8, this, "ptr", collectionId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ToastCollection, operation)
    }

    /**
     * 
     * @param {HSTRING} collectionId 
     * @returns {IAsyncAction} 
     */
    RemoveToastCollectionAsync(collectionId) {
        if(collectionId is String) {
            pin := HSTRING.Create(collectionId)
            collectionId := pin.Value
        }
        collectionId := collectionId is Win32Handle ? NumGet(collectionId, "ptr") : collectionId

        result := ComCall(9, this, "ptr", collectionId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    RemoveAllToastCollectionsAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppId() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
