#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChoosingItemContainerEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ListViewBase.ChoosingItemContainer](listviewbase_choosingitemcontainer.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosingitemcontainereventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ChoosingItemContainerEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChoosingItemContainerEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChoosingItemContainerEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the index in the [ItemsSource](itemscontrol_itemssource.md) of the data item for which a container is being selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosingitemcontainereventargs.itemindex
     * @type {Integer} 
     */
    ItemIndex {
        get => this.get_ItemIndex()
    }

    /**
     * Gets the data item associated with this [ItemContainer](choosingitemcontainereventargs_itemcontainer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosingitemcontainereventargs.item
     * @type {IInspectable} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * Gets or sets the UI container that will be used to display the current data item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosingitemcontainereventargs.itemcontainer
     * @type {SelectorItem} 
     */
    ItemContainer {
        get => this.get_ItemContainer()
        set => this.put_ItemContainer(value)
    }

    /**
     * Gets or sets a value that indicates whether the container is ready for use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosingitemcontainereventargs.iscontainerprepared
     * @type {Boolean} 
     */
    IsContainerPrepared {
        get => this.get_IsContainerPrepared()
        set => this.put_IsContainerPrepared(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ChoosingItemContainerEventArgs](choosingitemcontainereventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ChoosingItemContainerEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemIndex() {
        if (!this.HasProp("__IChoosingItemContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingItemContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingItemContainerEventArgs := IChoosingItemContainerEventArgs(outPtr)
        }

        return this.__IChoosingItemContainerEventArgs.get_ItemIndex()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Item() {
        if (!this.HasProp("__IChoosingItemContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingItemContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingItemContainerEventArgs := IChoosingItemContainerEventArgs(outPtr)
        }

        return this.__IChoosingItemContainerEventArgs.get_Item()
    }

    /**
     * 
     * @returns {SelectorItem} 
     */
    get_ItemContainer() {
        if (!this.HasProp("__IChoosingItemContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingItemContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingItemContainerEventArgs := IChoosingItemContainerEventArgs(outPtr)
        }

        return this.__IChoosingItemContainerEventArgs.get_ItemContainer()
    }

    /**
     * 
     * @param {SelectorItem} value 
     * @returns {HRESULT} 
     */
    put_ItemContainer(value) {
        if (!this.HasProp("__IChoosingItemContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingItemContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingItemContainerEventArgs := IChoosingItemContainerEventArgs(outPtr)
        }

        return this.__IChoosingItemContainerEventArgs.put_ItemContainer(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContainerPrepared() {
        if (!this.HasProp("__IChoosingItemContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingItemContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingItemContainerEventArgs := IChoosingItemContainerEventArgs(outPtr)
        }

        return this.__IChoosingItemContainerEventArgs.get_IsContainerPrepared()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsContainerPrepared(value) {
        if (!this.HasProp("__IChoosingItemContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingItemContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingItemContainerEventArgs := IChoosingItemContainerEventArgs(outPtr)
        }

        return this.__IChoosingItemContainerEventArgs.put_IsContainerPrepared(value)
    }

;@endregion Instance Methods
}
