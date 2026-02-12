#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ItemsControlAutomationPeer.ahk
#Include .\ISelectorAutomationPeer.ahk
#Include ..\Provider\ISelectionProvider.ahk
#Include .\ISelectorAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * A base class that provides a Microsoft UI Automation peer implementation for types that derive from [Selector](../windows.ui.xaml.controls.primitives/selector.md).
 * @remarks
 * The Windows Runtime  [Selector](../windows.ui.xaml.controls.primitives/selector.md) class creates a new SelectorAutomationPeer as part of internal logic that checks for listeners of certain automation events. [Selector](../windows.ui.xaml.controls.primitives/selector.md) doesn't have an [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) that automatically hooks up the peer on creation, because [Selector](../windows.ui.xaml.controls.primitives/selector.md) is usually a base class.
 * 
 *  [Selector](../windows.ui.xaml.controls.primitives/selector.md) has several derived classes such as [ListBox](../windows.ui.xaml.controls/listbox.md), which have template support and practical implementations of some important functionality. Make sure that you really want to derive from the base class. If you're sure you want to derive from [Selector](../windows.ui.xaml.controls.primitives/selector.md), directly, derive your automation peer from SelectorAutomationPeer and override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectorautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class SelectorAutomationPeer extends ItemsControlAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelectorAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelectorAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Selector} owner 
     * @returns {SelectorAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!SelectorAutomationPeer.HasProp("__ISelectorAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.SelectorAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorAutomationPeerFactory.IID)
            SelectorAutomationPeer.__ISelectorAutomationPeerFactory := ISelectorAutomationPeerFactory(factoryPtr)
        }

        return SelectorAutomationPeer.__ISelectorAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the Microsoft UI Automation provider allows more than one child element to be selected concurrently.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectorautomationpeer.canselectmultiple
     * @type {Boolean} 
     */
    CanSelectMultiple {
        get => this.get_CanSelectMultiple()
    }

    /**
     * Gets a value that indicates whether the Microsoft UI Automation provider requires at least one child element to be selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectorautomationpeer.isselectionrequired
     * @type {Boolean} 
     */
    IsSelectionRequired {
        get => this.get_IsSelectionRequired()
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
    get_CanSelectMultiple() {
        if (!this.HasProp("__ISelectionProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionProvider := ISelectionProvider(outPtr)
        }

        return this.__ISelectionProvider.get_CanSelectMultiple()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelectionRequired() {
        if (!this.HasProp("__ISelectionProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionProvider := ISelectionProvider(outPtr)
        }

        return this.__ISelectionProvider.get_IsSelectionRequired()
    }

    /**
     * Retrieves a Microsoft UI Automation provider for each child element that is selected.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} A generic list of Microsoft UI Automation providers.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.selectorautomationpeer.getselection
     */
    GetSelection(result_) {
        if (!this.HasProp("__ISelectionProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionProvider := ISelectionProvider(outPtr)
        }

        return this.__ISelectionProvider.GetSelection(result_)
    }

;@endregion Instance Methods
}
