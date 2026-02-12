#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastCollectionManager.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for creating, retrieving, updating, and removing [ToastCollection](toastcollection.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollectionmanager
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastCollectionManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastCollectionManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastCollectionManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user who receives the toast notification groups created by this toast collection manager.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollectionmanager.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets the ID of the app to which this manager belongs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollectionmanager.appid
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Starts the asynchronous creation or update of the specified toast notification group.
     * @param {ToastCollection} collection The toast notification group to create or update.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollectionmanager.savetoastcollectionasync
     */
    SaveToastCollectionAsync(collection) {
        if (!this.HasProp("__IToastCollectionManager")) {
            if ((queryResult := this.QueryInterface(IToastCollectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollectionManager := IToastCollectionManager(outPtr)
        }

        return this.__IToastCollectionManager.SaveToastCollectionAsync(collection)
    }

    /**
     * Starts the retrieval of all toast notification groups created by this manager.
     * @returns {IAsyncOperation<IVectorView<ToastCollection>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollectionmanager.findalltoastcollectionsasync
     */
    FindAllToastCollectionsAsync() {
        if (!this.HasProp("__IToastCollectionManager")) {
            if ((queryResult := this.QueryInterface(IToastCollectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollectionManager := IToastCollectionManager(outPtr)
        }

        return this.__IToastCollectionManager.FindAllToastCollectionsAsync()
    }

    /**
     * Starts the retrieval of the specified notification group.
     * @param {HSTRING} collectionId The ID of the notification group to retrieve.
     * @returns {IAsyncOperation<ToastCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollectionmanager.gettoastcollectionasync
     */
    GetToastCollectionAsync(collectionId) {
        if (!this.HasProp("__IToastCollectionManager")) {
            if ((queryResult := this.QueryInterface(IToastCollectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollectionManager := IToastCollectionManager(outPtr)
        }

        return this.__IToastCollectionManager.GetToastCollectionAsync(collectionId)
    }

    /**
     * Starts the asynchronous removal of the specified toast notification group.
     * @param {HSTRING} collectionId The ID of toast notification group to remove.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollectionmanager.removetoastcollectionasync
     */
    RemoveToastCollectionAsync(collectionId) {
        if (!this.HasProp("__IToastCollectionManager")) {
            if ((queryResult := this.QueryInterface(IToastCollectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollectionManager := IToastCollectionManager(outPtr)
        }

        return this.__IToastCollectionManager.RemoveToastCollectionAsync(collectionId)
    }

    /**
     * Starts the asynchronous removal of all toast notification groups for the app.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollectionmanager.removealltoastcollectionsasync
     */
    RemoveAllToastCollectionsAsync() {
        if (!this.HasProp("__IToastCollectionManager")) {
            if ((queryResult := this.QueryInterface(IToastCollectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollectionManager := IToastCollectionManager(outPtr)
        }

        return this.__IToastCollectionManager.RemoveAllToastCollectionsAsync()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IToastCollectionManager")) {
            if ((queryResult := this.QueryInterface(IToastCollectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollectionManager := IToastCollectionManager(outPtr)
        }

        return this.__IToastCollectionManager.get_User()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppId() {
        if (!this.HasProp("__IToastCollectionManager")) {
            if ((queryResult := this.QueryInterface(IToastCollectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollectionManager := IToastCollectionManager(outPtr)
        }

        return this.__IToastCollectionManager.get_AppId()
    }

;@endregion Instance Methods
}
