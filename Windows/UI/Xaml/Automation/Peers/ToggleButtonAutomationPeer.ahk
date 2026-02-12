#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ButtonBaseAutomationPeer.ahk
#Include .\IToggleButtonAutomationPeer.ahk
#Include ..\Provider\IToggleProvider.ahk
#Include .\IToggleButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) class creates a new ToggleButtonAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition.
 * 
 * [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) has several derived classes such as [RadioButton](../windows.ui.xaml.controls/radiobutton.md), which have template support and practical implementations of some important functionality. Make sure that you really want to derive from the base class. If you're sure you want to derive from [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md), directly, derive your automation peer from ToggleButtonAutomationPeer and override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.togglebuttonautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ToggleButtonAutomationPeer extends ButtonBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ToggleButton} owner 
     * @returns {ToggleButtonAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ToggleButtonAutomationPeer.HasProp("__IToggleButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ToggleButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleButtonAutomationPeerFactory.IID)
            ToggleButtonAutomationPeer.__IToggleButtonAutomationPeerFactory := IToggleButtonAutomationPeerFactory(factoryPtr)
        }

        return ToggleButtonAutomationPeer.__IToggleButtonAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the toggle state of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.togglebuttonautomationpeer.togglestate
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.togglebuttonautomationpeer.toggle
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
