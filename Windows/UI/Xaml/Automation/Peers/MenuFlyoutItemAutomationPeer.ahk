#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IMenuFlyoutItemAutomationPeer.ahk
#Include ..\Provider\IInvokeProvider.ahk
#Include .\IMenuFlyoutItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) class creates a new MenuFlyoutItemAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from MenuFlyoutItemAutomationPeer if you are deriving a custom class from [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menuflyoutitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {MenuFlyoutItem} owner 
     * @returns {MenuFlyoutItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!MenuFlyoutItemAutomationPeer.HasProp("__IMenuFlyoutItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.MenuFlyoutItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutItemAutomationPeerFactory.IID)
            MenuFlyoutItemAutomationPeer.__IMenuFlyoutItemAutomationPeerFactory := IMenuFlyoutItemAutomationPeerFactory(factoryPtr)
        }

        return MenuFlyoutItemAutomationPeer.__IMenuFlyoutItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends a request to invoke the menu flyout associated with the automation peer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menuflyoutitemautomationpeer.invoke
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
