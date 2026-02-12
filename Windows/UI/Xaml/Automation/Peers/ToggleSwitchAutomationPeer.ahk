#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IToggleSwitchAutomationPeer.ahk
#Include ..\Provider\IToggleProvider.ahk
#Include .\IToggleSwitchAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) class creates a new ToggleSwitchAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) is sealed, so the normal scenario of deriving from the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) class and its existing peer isn't applicable to ToggleSwitchAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.toggleswitchautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ToggleSwitchAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleSwitchAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleSwitchAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ToggleSwitch} owner 
     * @returns {ToggleSwitchAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ToggleSwitchAutomationPeer.HasProp("__IToggleSwitchAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ToggleSwitchAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSwitchAutomationPeerFactory.IID)
            ToggleSwitchAutomationPeer.__IToggleSwitchAutomationPeerFactory := IToggleSwitchAutomationPeerFactory(factoryPtr)
        }

        return ToggleSwitchAutomationPeer.__IToggleSwitchAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the toggle state of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.toggleswitchautomationpeer.togglestate
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.toggleswitchautomationpeer.toggle
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
