#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ItemAutomationPeer.ahk
#Include .\IPivotItemDataAutomationPeer.ahk
#Include ..\Provider\IScrollItemProvider.ahk
#Include ..\Provider\ISelectionItemProvider.ahk
#Include ..\Provider\IVirtualizedItemProvider.ahk
#Include .\IPivotItemDataAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes the data content of a [PivotItem](../windows.ui.xaml.controls/pivotitem.md) to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class PivotItemDataAutomationPeer extends ItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPivotItemDataAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPivotItemDataAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [PivotItemDataAutomationPeer](pivotitemdataautomationpeer.md) class.
     * @param {IInspectable} item The specific data item.
     * @param {PivotAutomationPeer} parent The automation peer for the [Pivot](../windows.ui.xaml.controls/pivot.md) object that contains the item.
     * @returns {PivotItemDataAutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer.#ctor
     */
    static CreateInstanceWithParentAndItem(item, parent) {
        if (!PivotItemDataAutomationPeer.HasProp("__IPivotItemDataAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.PivotItemDataAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotItemDataAutomationPeerFactory.IID)
            PivotItemDataAutomationPeer.__IPivotItemDataAutomationPeerFactory := IPivotItemDataAutomationPeerFactory(factoryPtr)
        }

        return PivotItemDataAutomationPeer.__IPivotItemDataAutomationPeerFactory.CreateInstanceWithParentAndItem(item, parent)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether an item is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * Gets the UI automation provider that implements [ISelectionProvider](../windows.ui.xaml.automation.provider/iselectionprovider.md) and acts as the container for the calling object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer.selectioncontainer
     * @type {IRawElementProviderSimple} 
     */
    SelectionContainer {
        get => this.get_SelectionContainer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Scrolls the content area of the parent container in order to display the item within the visible region (viewport) of the container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer.scrollintoview
     */
    ScrollIntoView() {
        if (!this.HasProp("__IScrollItemProvider")) {
            if ((queryResult := this.QueryInterface(IScrollItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollItemProvider := IScrollItemProvider(outPtr)
        }

        return this.__IScrollItemProvider.ScrollIntoView()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
        if (!this.HasProp("__ISelectionItemProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionItemProvider := ISelectionItemProvider(outPtr)
        }

        return this.__ISelectionItemProvider.get_IsSelected()
    }

    /**
     * 
     * @returns {IRawElementProviderSimple} 
     */
    get_SelectionContainer() {
        if (!this.HasProp("__ISelectionItemProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionItemProvider := ISelectionItemProvider(outPtr)
        }

        return this.__ISelectionItemProvider.get_SelectionContainer()
    }

    /**
     * Adds the current element to the collection of selected items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer.addtoselection
     */
    AddToSelection() {
        if (!this.HasProp("__ISelectionItemProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionItemProvider := ISelectionItemProvider(outPtr)
        }

        return this.__ISelectionItemProvider.AddToSelection()
    }

    /**
     * Removes the current element from the collection of selected items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer.removefromselection
     */
    RemoveFromSelection() {
        if (!this.HasProp("__ISelectionItemProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionItemProvider := ISelectionItemProvider(outPtr)
        }

        return this.__ISelectionItemProvider.RemoveFromSelection()
    }

    /**
     * Clears any existing selection and then selects the current element.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer.select
     */
    Select() {
        if (!this.HasProp("__ISelectionItemProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionItemProvider := ISelectionItemProvider(outPtr)
        }

        return this.__ISelectionItemProvider.Select()
    }

    /**
     * Makes the virtual item fully accessible as a Microsoft UI Automation element.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemdataautomationpeer.realize
     */
    Realize() {
        if (!this.HasProp("__IVirtualizedItemProvider")) {
            if ((queryResult := this.QueryInterface(IVirtualizedItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizedItemProvider := IVirtualizedItemProvider(outPtr)
        }

        return this.__IVirtualizedItemProvider.Realize()
    }

;@endregion Instance Methods
}
