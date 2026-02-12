#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastCollection.ahk
#Include .\IToastCollectionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group of notifications for a particular app.
 * @remarks
 * Use a [ToastCollectionManager](toastcollectionmanager.md) to save, update, and remove ToastCollection objects.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollection
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastCollection.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new toast notification group.
     * @param {HSTRING} collectionId The ID of the group. You can use the ID to manipulate the group with a [ToastCollectionManager](toastcollectionmanager.md)
     * @param {HSTRING} displayName The title of group to display in the Action Center.
     * @param {HSTRING} launchArgs The launch arguments that are passed to the app when the user clicks the notification group title in the Action Center.
     * @param {Uri} iconUri The icon to display next to the title in the Action Center.
     * @returns {ToastCollection} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollection.#ctor
     */
    static CreateInstance(collectionId, displayName, launchArgs, iconUri) {
        if (!ToastCollection.HasProp("__IToastCollectionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastCollection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastCollectionFactory.IID)
            ToastCollection.__IToastCollectionFactory := IToastCollectionFactory(factoryPtr)
        }

        return ToastCollection.__IToastCollectionFactory.CreateInstance(collectionId, displayName, launchArgs, iconUri)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the ID of this notification group.
     * @remarks
     * Storing the ID of the notification group enables you to use the [ToastCollectionManager](toastcollectionmanager.md) to manipulate it later.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollection.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the group title that displays in the Action Center.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollection.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the launch arguments provided to app when the notification group title is clicked in the Action Center.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollection.launchargs
     * @type {HSTRING} 
     */
    LaunchArgs {
        get => this.get_LaunchArgs()
        set => this.put_LaunchArgs(value)
    }

    /**
     * Gets or sets the icon that displays next to the group title in the Action Center.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastcollection.icon
     * @type {Uri} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IToastCollection")) {
            if ((queryResult := this.QueryInterface(IToastCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollection := IToastCollection(outPtr)
        }

        return this.__IToastCollection.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IToastCollection")) {
            if ((queryResult := this.QueryInterface(IToastCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollection := IToastCollection(outPtr)
        }

        return this.__IToastCollection.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IToastCollection")) {
            if ((queryResult := this.QueryInterface(IToastCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollection := IToastCollection(outPtr)
        }

        return this.__IToastCollection.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LaunchArgs() {
        if (!this.HasProp("__IToastCollection")) {
            if ((queryResult := this.QueryInterface(IToastCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollection := IToastCollection(outPtr)
        }

        return this.__IToastCollection.get_LaunchArgs()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LaunchArgs(value) {
        if (!this.HasProp("__IToastCollection")) {
            if ((queryResult := this.QueryInterface(IToastCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollection := IToastCollection(outPtr)
        }

        return this.__IToastCollection.put_LaunchArgs(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Icon() {
        if (!this.HasProp("__IToastCollection")) {
            if ((queryResult := this.QueryInterface(IToastCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollection := IToastCollection(outPtr)
        }

        return this.__IToastCollection.get_Icon()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__IToastCollection")) {
            if ((queryResult := this.QueryInterface(IToastCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastCollection := IToastCollection(outPtr)
        }

        return this.__IToastCollection.put_Icon(value)
    }

;@endregion Instance Methods
}
