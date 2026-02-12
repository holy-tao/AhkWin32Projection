#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IFlyoutPresenterAutomationPeer.ahk
#Include .\IFlyoutPresenterAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [FlyoutPresenter](../windows.ui.xaml.controls/flyoutpresenter.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [FlyoutPresenter](../windows.ui.xaml.controls/flyoutpresenter.md) class creates a new FlyoutPresenterAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from FlyoutPresenterAutomationPeer if you are deriving a custom class from [FlyoutPresenter](../windows.ui.xaml.controls/flyoutpresenter.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.flyoutpresenterautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class FlyoutPresenterAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlyoutPresenterAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlyoutPresenterAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {FlyoutPresenter} owner 
     * @returns {FlyoutPresenterAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!FlyoutPresenterAutomationPeer.HasProp("__IFlyoutPresenterAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.FlyoutPresenterAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutPresenterAutomationPeerFactory.IID)
            FlyoutPresenterAutomationPeer.__IFlyoutPresenterAutomationPeerFactory := IFlyoutPresenterAutomationPeerFactory(factoryPtr)
        }

        return FlyoutPresenterAutomationPeer.__IFlyoutPresenterAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
