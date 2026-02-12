#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ILoopingSelectorItemAutomationPeer.ahk
#Include ..\Provider\IScrollItemProvider.ahk
#Include ..\Provider\ISelectionItemProvider.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [LoopingSelectorItem](../windows.ui.xaml.controls.primitives/loopingselectoritem.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class LoopingSelectorItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoopingSelectorItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoopingSelectorItemAutomationPeer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether an item is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemautomationpeer.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * Gets the UI automation provider that implements [ISelectionProvider](../windows.ui.xaml.automation.provider/iselectionprovider.md) and acts as the container for the calling object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemautomationpeer.selectioncontainer
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemautomationpeer.scrollintoview
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemautomationpeer.addtoselection
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemautomationpeer.removefromselection
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemautomationpeer.select
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
