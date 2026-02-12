#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IFlipViewItemAutomationPeer.ahk
#Include .\IFlipViewItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes a [FlipViewItem](../windows.ui.xaml.controls/flipviewitem.md) to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [FlipViewItem](../windows.ui.xaml.controls/flipviewitem.md) class creates a new FlipViewItemAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from FlipViewItemAutomationPeer if you are deriving a custom class from [FlipViewItem](../windows.ui.xaml.controls/flipviewitem.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.flipviewitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class FlipViewItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlipViewItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlipViewItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {FlipViewItem} owner 
     * @returns {FlipViewItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!FlipViewItemAutomationPeer.HasProp("__IFlipViewItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.FlipViewItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlipViewItemAutomationPeerFactory.IID)
            FlipViewItemAutomationPeer.__IFlipViewItemAutomationPeerFactory := IFlipViewItemAutomationPeerFactory(factoryPtr)
        }

        return FlipViewItemAutomationPeer.__IFlipViewItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
