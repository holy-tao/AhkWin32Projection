#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IJumpListItem.ahk
#Include .\IJumpListItemStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for creating and defining jump list items for an app's jump list.
 * @remarks
 * A JumpListItem is created using the [CreateWithArguments](jumplistitem_createwitharguments_277799170.md) and [CreateSeparator](jumplistitem_createseparator_149131182.md) methods. After creation, they can be added to the app's jump list using the jump list's [Items](jumplist_items.md) property and the [SaveAsync](jumplist_saveasync_2143735121.md) method. Be aware that in the user interface, a user can right-click a jump list item that is in a custom group and select “Remove from this list”. When this action occurs, the system marks the item as removed by user and suppresses it from the UI. The next time an app loads the jump list, it should check the items to see if the item's [RemovedByUser](jumplistitem_removedbyuser.md) property is set to True. If [RemovedByUser](jumplistitem_removedbyuser.md) is True, then the app should update its internal state to be in sync with the user initiated change. It is the apps responsibility to make sure that a removed item is not added back to the jump list until such time as the conditions for its addition are again met, for example, by the user opening the associated document again.
 * 
 * When an app saves the [JumpList](jumplist.md) using [SaveAsync](jumplist_saveasync_2143735121.md), the operating system organizes the items as follows.
 * 
 * + Any items with RemovedByUser equal to True are removed.
 * + Items with the same GroupName property are placed together, preserving their relative order.
 * + Groups are ordered by the original position of the first item in the group, with the exception that system-managed groups are always at the top and the Tasks group is always at the bottom if they are present.
 *  That means that when an app loads its [JumpList](jumplist.md) using the [LoadCurrentAsync](jumplist_loadcurrentasync_313230072.md) method, the items are retrieved in their organized order, which might not agree with the order of the items in the jump list when it was originally saved.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class JumpListItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJumpListItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJumpListItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new jump list item for an app's jump list.
     * @param {HSTRING} arguments String that specifies any command line arguments that should be passed onto the app when the jump list item is selected by a user.
     * @param {HSTRING} displayName String that specifies a display name for the jump list item. If localization is desired, this string must be a *ms-resource:* scheme specified URI.
     * @returns {JumpListItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.createwitharguments
     */
    static CreateWithArguments(arguments, displayName) {
        if (!JumpListItem.HasProp("__IJumpListItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.JumpListItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJumpListItemStatics.IID)
            JumpListItem.__IJumpListItemStatics := IJumpListItemStatics(factoryPtr)
        }

        return JumpListItem.__IJumpListItemStatics.CreateWithArguments(arguments, displayName)
    }

    /**
     * Creates a jump list item that is an inert separator for a custom group within the app's jump list.
     * @returns {JumpListItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.createseparator
     */
    static CreateSeparator() {
        if (!JumpListItem.HasProp("__IJumpListItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.JumpListItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJumpListItemStatics.IID)
            JumpListItem.__IJumpListItemStatics := IJumpListItemStatics(factoryPtr)
        }

        return JumpListItem.__IJumpListItemStatics.CreateSeparator()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [JumpListItemKind](jumplistitemkind.md) of a jump list item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the command line arguments for the jump list item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * Gets a boolean indicating whether the jump list item was removed from the app's jump list by the user.
     * @remarks
     * If the RemovedByUser property is True, then the item will not be saved to the jump list when the [SaveAsync](jumplist_saveasync_2143735121.md) method is called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.removedbyuser
     * @type {Boolean} 
     */
    RemovedByUser {
        get => this.get_RemovedByUser()
    }

    /**
     * Gets or sets the jump list item task description.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets the jump list item display name. The display name can also be specified as a parameter using the [CreateWithArguments](jumplistitem_createwitharguments_277799170.md) method when the jump list item is created.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the jump list item custom group name. If no name is specified, the item will be added to the Tasks group by default.
     * @remarks
     * If this string is not provided, then the item will be added to the Tasks group.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.groupname
     * @type {HSTRING} 
     */
    GroupName {
        get => this.get_GroupName()
        set => this.put_GroupName(value)
    }

    /**
     * Gets or sets the jump list item's logo.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitem.logo
     * @type {Uri} 
     */
    Logo {
        get => this.get_Logo()
        set => this.put_Logo(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.get_Kind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arguments() {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.get_Arguments()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RemovedByUser() {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.get_RemovedByUser()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GroupName() {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.get_GroupName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_GroupName(value) {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.put_GroupName(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Logo() {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.get_Logo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Logo(value) {
        if (!this.HasProp("__IJumpListItem")) {
            if ((queryResult := this.QueryInterface(IJumpListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItem := IJumpListItem(outPtr)
        }

        return this.__IJumpListItem.put_Logo(value)
    }

;@endregion Instance Methods
}
