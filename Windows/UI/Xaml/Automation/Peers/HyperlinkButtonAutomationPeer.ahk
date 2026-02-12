#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ButtonBaseAutomationPeer.ahk
#Include .\IHyperlinkButtonAutomationPeer.ahk
#Include ..\Provider\IInvokeProvider.ahk
#Include .\IHyperlinkButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md) class creates a new HyperlinkButtonAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from HyperlinkButtonAutomationPeer if you are deriving a custom class from [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.hyperlinkbuttonautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class HyperlinkButtonAutomationPeer extends ButtonBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHyperlinkButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHyperlinkButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HyperlinkButton} owner 
     * @returns {HyperlinkButtonAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!HyperlinkButtonAutomationPeer.HasProp("__IHyperlinkButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.HyperlinkButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkButtonAutomationPeerFactory.IID)
            HyperlinkButtonAutomationPeer.__IHyperlinkButtonAutomationPeerFactory := IHyperlinkButtonAutomationPeerFactory(factoryPtr)
        }

        return HyperlinkButtonAutomationPeer.__IHyperlinkButtonAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends a request to click the hyperlink button associated with the automation peer.
     * @remarks
     * Calls to **Invoke** should return immediately without blocking. However, this behavior is entirely dependent on the Microsoft UI Automation provider implementation. In scenarios where calling **Invoke** causes a blocking issue, such as a modal dialog, a separate helper thread may be required to call the method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.hyperlinkbuttonautomationpeer.invoke
     */
    Invoke() {
        if (!this.HasProp("__IInvokeProvider")) {
            if ((queryResult := this.QueryInterface(IInvokeProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInvokeProvider := IInvokeProvider(outPtr)
        }

        return this.__IInvokeProvider.Invoke()
    }

;@endregion Instance Methods
}
