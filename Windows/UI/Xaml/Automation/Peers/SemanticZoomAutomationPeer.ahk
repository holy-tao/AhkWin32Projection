#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ISemanticZoomAutomationPeer.ahk
#Include ..\Provider\IToggleProvider.ahk
#Include .\ISemanticZoomAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) class creates a new SemanticZoomAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) is sealed, so the normal scenario of deriving from the [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) class and its existing peer isn't applicable to SemanticZoomAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.semanticzoomautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class SemanticZoomAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISemanticZoomAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISemanticZoomAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {SemanticZoom} owner 
     * @returns {SemanticZoomAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!SemanticZoomAutomationPeer.HasProp("__ISemanticZoomAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.SemanticZoomAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISemanticZoomAutomationPeerFactory.IID)
            SemanticZoomAutomationPeer.__ISemanticZoomAutomationPeerFactory := ISemanticZoomAutomationPeerFactory(factoryPtr)
        }

        return SemanticZoomAutomationPeer.__ISemanticZoomAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the [Toggle](semanticzoomautomationpeer_toggle_7432421.md) method can be called and result in a toggled view.
     * @remarks
     * For a [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md), this property is equivalent to reading [CanChangeViews](../windows.ui.xaml.controls/semanticzoom_canchangeviews.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.semanticzoomautomationpeer.togglestate
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
     * @remarks
     * For a [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md), the toggle action switches the view, equivalent to calling [ToggleActiveView](../windows.ui.xaml.controls/semanticzoom_toggleactiveview_1246922025.md) so long as [CanChangeViews](../windows.ui.xaml.controls/semanticzoom_canchangeviews.md) is true.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.semanticzoomautomationpeer.toggle
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
