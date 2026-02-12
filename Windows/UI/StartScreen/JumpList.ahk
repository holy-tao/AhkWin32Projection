#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IJumpList.ahk
#Include .\IJumpListStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for an app's jump list. A jump list is a system-provided menu that appears when the user right-clicks a program in the taskbar or on the Start menu. It is used to provide quick access to recently or frequently-used documents and offer direct links to app functionality. Not all device families support jump lists.
 * @remarks
 * An app's JumpList is retrieved using the [LoadCurrentAsync](jumplist_loadcurrentasync_313230072.md) method. If an application does not customize its jump list, the system provides a default jump list. Currently, the default jump list shows recent items. Make sure your app has registered to become the default file handler for a certain file type that you want to show in the recent items list. For more information, see [Handle file activation](/windows/uwp/launch-resume/handle-file-activation).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplist
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class JumpList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJumpList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJumpList.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously retrieves the current jump list and its items.
     * @returns {IAsyncOperation<JumpList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplist.loadcurrentasync
     */
    static LoadCurrentAsync() {
        if (!JumpList.HasProp("__IJumpListStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.JumpList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJumpListStatics.IID)
            JumpList.__IJumpListStatics := IJumpListStatics(factoryPtr)
        }

        return JumpList.__IJumpListStatics.LoadCurrentAsync()
    }

    /**
     * Gets a value that indicates whether the system supports jump lists.
     * 
     * > [!NOTE]
     * > Only the desktop device family supports jump lists, changes made to a jump list with a different device family will not persist.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplist.issupported
     */
    static IsSupported() {
        if (!JumpList.HasProp("__IJumpListStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.JumpList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJumpListStatics.IID)
            JumpList.__IJumpListStatics := IJumpListStatics(factoryPtr)
        }

        return JumpList.__IJumpListStatics.IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of [JumpListItem](jumplistitem.md)'s for the jump list.  Items is of type [IVector(JumpListItem)](../windows.foundation.collections/ivector_1.md).
     * @remarks
     * Apps may modify the collection by adding items, removing items, or modifying existing items. After the app saves the jump list using [SaveAsync](jumplist_saveasync_2143735121.md), the changes to the collection will be reflected in the jump list shown to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplist.items
     * @type {IVector<JumpListItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets the current type of the system managed jump list group.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplist.systemgroupkind
     * @type {Integer} 
     */
    SystemGroupKind {
        get => this.get_SystemGroupKind()
        set => this.put_SystemGroupKind(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<JumpListItem>} 
     */
    get_Items() {
        if (!this.HasProp("__IJumpList")) {
            if ((queryResult := this.QueryInterface(IJumpList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpList := IJumpList(outPtr)
        }

        return this.__IJumpList.get_Items()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SystemGroupKind() {
        if (!this.HasProp("__IJumpList")) {
            if ((queryResult := this.QueryInterface(IJumpList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpList := IJumpList(outPtr)
        }

        return this.__IJumpList.get_SystemGroupKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SystemGroupKind(value) {
        if (!this.HasProp("__IJumpList")) {
            if ((queryResult := this.QueryInterface(IJumpList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpList := IJumpList(outPtr)
        }

        return this.__IJumpList.put_SystemGroupKind(value)
    }

    /**
     * Asynchronously saves changes to the jump list and its items.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplist.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IJumpList")) {
            if ((queryResult := this.QueryInterface(IJumpList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpList := IJumpList(outPtr)
        }

        return this.__IJumpList.SaveAsync()
    }

;@endregion Instance Methods
}
