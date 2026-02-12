#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ToggleButtonAutomationPeer.ahk
#Include .\IRadioButtonAutomationPeer.ahk
#Include ..\Provider\ISelectionItemProvider.ahk
#Include .\IRadioButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [RadioButton](../windows.ui.xaml.controls/radiobutton.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [RadioButton](../windows.ui.xaml.controls/radiobutton.md) class creates a new RadioButtonAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from RadioButtonAutomationPeer if you are deriving a custom class from [RadioButton](../windows.ui.xaml.controls/radiobutton.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.radiobuttonautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class RadioButtonAutomationPeer extends ToggleButtonAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadioButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadioButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {RadioButton} owner 
     * @returns {RadioButtonAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!RadioButtonAutomationPeer.HasProp("__IRadioButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.RadioButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadioButtonAutomationPeerFactory.IID)
            RadioButtonAutomationPeer.__IRadioButtonAutomationPeerFactory := IRadioButtonAutomationPeerFactory(factoryPtr)
        }

        return RadioButtonAutomationPeer.__IRadioButtonAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether an item is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.radiobuttonautomationpeer.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * Gets the UI automation provider that implements [ISelectionProvider](../windows.ui.xaml.automation.provider/iselectionprovider.md) and acts as the container for the calling object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.radiobuttonautomationpeer.selectioncontainer
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.radiobuttonautomationpeer.addtoselection
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.radiobuttonautomationpeer.removefromselection
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.radiobuttonautomationpeer.select
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
