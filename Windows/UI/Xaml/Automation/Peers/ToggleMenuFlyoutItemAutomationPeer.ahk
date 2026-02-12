#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IToggleMenuFlyoutItemAutomationPeer.ahk
#Include ..\Provider\IToggleProvider.ahk
#Include .\IToggleMenuFlyoutItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes ToggleMenuFlyoutItem types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.togglemenuflyoutitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ToggleMenuFlyoutItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleMenuFlyoutItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleMenuFlyoutItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ToggleMenuFlyoutItem} owner 
     * @returns {ToggleMenuFlyoutItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ToggleMenuFlyoutItemAutomationPeer.HasProp("__IToggleMenuFlyoutItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ToggleMenuFlyoutItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleMenuFlyoutItemAutomationPeerFactory.IID)
            ToggleMenuFlyoutItemAutomationPeer.__IToggleMenuFlyoutItemAutomationPeerFactory := IToggleMenuFlyoutItemAutomationPeerFactory(factoryPtr)
        }

        return ToggleMenuFlyoutItemAutomationPeer.__IToggleMenuFlyoutItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the toggle state of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.togglemenuflyoutitemautomationpeer.togglestate
     * @type {Integer} 
     */
    ToggleState {
        get => this.get_ToggleState()
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
    get_ToggleState() {
        if (!this.HasProp("__IToggleProvider")) {
            if ((queryResult := this.QueryInterface(IToggleProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleProvider := IToggleProvider(outPtr)
        }

        return this.__IToggleProvider.get_ToggleState()
    }

    /**
     * Cycles through the toggle states of a control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.togglemenuflyoutitemautomationpeer.toggle
     */
    Toggle() {
        if (!this.HasProp("__IToggleProvider")) {
            if ((queryResult := this.QueryInterface(IToggleProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleProvider := IToggleProvider(outPtr)
        }

        return this.__IToggleProvider.Toggle()
    }

;@endregion Instance Methods
}
