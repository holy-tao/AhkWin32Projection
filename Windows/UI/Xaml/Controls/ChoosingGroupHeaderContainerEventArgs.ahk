#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChoosingGroupHeaderContainerEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ListViewBase.ChoosingGroupHeaderContainer](listviewbase_choosinggroupheadercontainer.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosinggroupheadercontainereventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ChoosingGroupHeaderContainerEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChoosingGroupHeaderContainerEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChoosingGroupHeaderContainerEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the UI container that will be used to display the current data group.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosinggroupheadercontainereventargs.groupheadercontainer
     * @type {ListViewBaseHeaderItem} 
     */
    GroupHeaderContainer {
        get => this.get_GroupHeaderContainer()
        set => this.put_GroupHeaderContainer(value)
    }

    /**
     * Gets the index in the [ItemsSource](itemscontrol_itemssource.md) of the data group for which a container is being selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosinggroupheadercontainereventargs.groupindex
     * @type {Integer} 
     */
    GroupIndex {
        get => this.get_GroupIndex()
    }

    /**
     * Gets the data group associated with this [GroupHeaderContainer](choosinggroupheadercontainereventargs_groupheadercontainer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.choosinggroupheadercontainereventargs.group
     * @type {IInspectable} 
     */
    Group {
        get => this.get_Group()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ChoosingGroupHeaderContainerEventArgs](choosinggroupheadercontainereventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ChoosingGroupHeaderContainerEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {ListViewBaseHeaderItem} 
     */
    get_GroupHeaderContainer() {
        if (!this.HasProp("__IChoosingGroupHeaderContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingGroupHeaderContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingGroupHeaderContainerEventArgs := IChoosingGroupHeaderContainerEventArgs(outPtr)
        }

        return this.__IChoosingGroupHeaderContainerEventArgs.get_GroupHeaderContainer()
    }

    /**
     * 
     * @param {ListViewBaseHeaderItem} value 
     * @returns {HRESULT} 
     */
    put_GroupHeaderContainer(value) {
        if (!this.HasProp("__IChoosingGroupHeaderContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingGroupHeaderContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingGroupHeaderContainerEventArgs := IChoosingGroupHeaderContainerEventArgs(outPtr)
        }

        return this.__IChoosingGroupHeaderContainerEventArgs.put_GroupHeaderContainer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GroupIndex() {
        if (!this.HasProp("__IChoosingGroupHeaderContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingGroupHeaderContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingGroupHeaderContainerEventArgs := IChoosingGroupHeaderContainerEventArgs(outPtr)
        }

        return this.__IChoosingGroupHeaderContainerEventArgs.get_GroupIndex()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Group() {
        if (!this.HasProp("__IChoosingGroupHeaderContainerEventArgs")) {
            if ((queryResult := this.QueryInterface(IChoosingGroupHeaderContainerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChoosingGroupHeaderContainerEventArgs := IChoosingGroupHeaderContainerEventArgs(outPtr)
        }

        return this.__IChoosingGroupHeaderContainerEventArgs.get_Group()
    }

;@endregion Instance Methods
}
