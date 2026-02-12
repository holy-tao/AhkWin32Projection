#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorAutomationPeer.ahk
#Include .\IFlipViewAutomationPeer.ahk
#Include .\IFlipViewAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [FlipView](../windows.ui.xaml.controls/flipview.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [FlipView](../windows.ui.xaml.controls/flipview.md) class creates a new FlipViewAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from FlipViewAutomationPeer if you are deriving a custom class from [FlipView](../windows.ui.xaml.controls/flipview.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.flipviewautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class FlipViewAutomationPeer extends SelectorAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlipViewAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlipViewAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {FlipView} owner 
     * @returns {FlipViewAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!FlipViewAutomationPeer.HasProp("__IFlipViewAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.FlipViewAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlipViewAutomationPeerFactory.IID)
            FlipViewAutomationPeer.__IFlipViewAutomationPeerFactory := IFlipViewAutomationPeerFactory(factoryPtr)
        }

        return FlipViewAutomationPeer.__IFlipViewAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
