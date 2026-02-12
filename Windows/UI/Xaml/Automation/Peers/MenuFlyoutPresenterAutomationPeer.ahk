#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ItemsControlAutomationPeer.ahk
#Include .\IMenuFlyoutPresenterAutomationPeer.ahk
#Include .\IMenuFlyoutPresenterAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [MenuFlyoutPresenter](../windows.ui.xaml.controls/menuflyoutpresenter.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [MenuFlyoutPresenter](../windows.ui.xaml.controls/menuflyoutpresenter.md) class creates a new MenuFlyoutPresenterAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from MenuFlyoutPresenterAutomationPeer if you are deriving a custom class from [MenuFlyoutPresenter](../windows.ui.xaml.controls/menuflyoutpresenter.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menuflyoutpresenterautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutPresenterAutomationPeer extends ItemsControlAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutPresenterAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutPresenterAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {MenuFlyoutPresenter} owner 
     * @returns {MenuFlyoutPresenterAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!MenuFlyoutPresenterAutomationPeer.HasProp("__IMenuFlyoutPresenterAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.MenuFlyoutPresenterAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutPresenterAutomationPeerFactory.IID)
            MenuFlyoutPresenterAutomationPeer.__IMenuFlyoutPresenterAutomationPeerFactory := IMenuFlyoutPresenterAutomationPeerFactory(factoryPtr)
        }

        return MenuFlyoutPresenterAutomationPeer.__IMenuFlyoutPresenterAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
