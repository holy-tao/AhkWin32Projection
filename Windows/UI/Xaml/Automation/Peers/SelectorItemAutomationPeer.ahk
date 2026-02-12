#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ItemAutomationPeer.ahk
#Include .\ISelectorItemAutomationPeer.ahk
#Include ..\Provider\ISelectionItemProvider.ahk
#Include .\ISelectorItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes the items in a [Selector](../windows.ui.xaml.controls.primitives/selector.md) to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  SelectorItemAutomationPeer is created by selected item logic in [SelectorAutomationPeer](selectorautomationpeer.md), not by invoking a [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition on [SelectorItem](../windows.ui.xaml.controls.primitives/selectoritem.md). Derive an automation peer from SelectorItemAutomationPeer if you are also creating a peer based on [SelectorAutomationPeer](selectorautomationpeer.md) and want to change the selected-item automation info.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectoritemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class SelectorItemAutomationPeer extends ItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelectorItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelectorItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IInspectable} item 
     * @param {SelectorAutomationPeer} parent 
     * @returns {SelectorItemAutomationPeer} 
     */
    static CreateInstanceWithParentAndItem(item, parent) {
        if (!SelectorItemAutomationPeer.HasProp("__ISelectorItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.SelectorItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorItemAutomationPeerFactory.IID)
            SelectorItemAutomationPeer.__ISelectorItemAutomationPeerFactory := ISelectorItemAutomationPeerFactory(factoryPtr)
        }

        return SelectorItemAutomationPeer.__ISelectorItemAutomationPeerFactory.CreateInstanceWithParentAndItem(item, parent, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether an item is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectoritemautomationpeer.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * Gets the UI Automation provider that implements [ISelectionProvider](../windows.ui.xaml.automation.provider/iselectionprovider.md) and acts as container for the calling object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectoritemautomationpeer.selectioncontainer
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectoritemautomationpeer.addtoselection
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectoritemautomationpeer.removefromselection
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectoritemautomationpeer.select
     */
    Select() {
        if (!this.HasProp("__ISelectionItemProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionItemProvider := ISelectionItemProvider(outPtr)
        }

        return this.__ISelectionItemProvider.Select()
    }

;@endregion Instance Methods
}
