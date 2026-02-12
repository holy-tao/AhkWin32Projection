#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContainerContentChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ContainerContentChanging](listviewbase_containercontentchanging.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContainerContentChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContainerContentChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContainerContentChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the UI container used to display the current data item.
     * @remarks
     * Use this container to visualize data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs.itemcontainer
     * @type {SelectorItem} 
     */
    ItemContainer {
        get => this.get_ItemContainer()
    }

    /**
     * Gets a value that indicates whether this container is in the recycle queue of the [ListViewBase](listviewbase.md) and is not being used to visualize a data item.
     * @remarks
     * You can check this property in a [ContainerContentChanging](listviewbase_containercontentchanging.md) event to determine if you should release references to the data item. If this property is **true**, [ItemIndex](containercontentchangingeventargs_itemindex.md) is -1 and [Item](containercontentchangingeventargs_item.md) is **null**.
     * 
     * 
     * <!--Needs review for accuracy.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs.inrecyclequeue
     * @type {Boolean} 
     */
    InRecycleQueue {
        get => this.get_InRecycleQueue()
    }

    /**
     * Gets the index in the [ItemsSource](itemscontrol_itemssource.md) of the data item associated with this container.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs.itemindex
     * @type {Integer} 
     */
    ItemIndex {
        get => this.get_ItemIndex()
    }

    /**
     * Gets the data item associated with this container.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs.item
     * @type {IInspectable} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * Gets the number of times this container and data item pair has been called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs.phase
     * @type {Integer} 
     */
    Phase {
        get => this.get_Phase()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContainerContentChangingEventArgs](containercontentchangingeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContainerContentChangingEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {SelectorItem} 
     */
    get_ItemContainer() {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.get_ItemContainer()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InRecycleQueue() {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.get_InRecycleQueue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemIndex() {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.get_ItemIndex()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Item() {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.get_Item()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Phase() {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.get_Phase()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.put_Handled(value)
    }

    /**
     * Registers the event handler to be called again during the next phase.
     * @param {TypedEventHandler<ListViewBase, ContainerContentChangingEventArgs>} callback The event handler function.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs.registerupdatecallback
     */
    RegisterUpdateCallback(callback) {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.RegisterUpdateCallback(callback)
    }

    /**
     * Registers the event handler to be called again during the specified phase.
     * @param {Integer} callbackPhase The phase during which the callback should occur.
     * @param {TypedEventHandler<ListViewBase, ContainerContentChangingEventArgs>} callback The event handler function.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.containercontentchangingeventargs.registerupdatecallback
     */
    RegisterUpdateCallbackWithPhase(callbackPhase, callback) {
        if (!this.HasProp("__IContainerContentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContainerContentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerContentChangingEventArgs := IContainerContentChangingEventArgs(outPtr)
        }

        return this.__IContainerContentChangingEventArgs.RegisterUpdateCallbackWithPhase(callbackPhase, callback)
    }

;@endregion Instance Methods
}
