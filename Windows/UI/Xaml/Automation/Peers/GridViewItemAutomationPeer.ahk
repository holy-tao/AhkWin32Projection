#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IGridViewItemAutomationPeer.ahk
#Include .\IGridViewItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes a [GridViewItem](../windows.ui.xaml.controls/gridviewitem.md) to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [GridViewItem](../windows.ui.xaml.controls/gridviewitem.md) class creates a new GridViewItemAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from GridViewItemAutomationPeer if you are deriving a custom class from [GridViewItem](../windows.ui.xaml.controls/gridviewitem.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.gridviewitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class GridViewItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridViewItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridViewItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {GridViewItem} owner 
     * @returns {GridViewItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!GridViewItemAutomationPeer.HasProp("__IGridViewItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.GridViewItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemAutomationPeerFactory.IID)
            GridViewItemAutomationPeer.__IGridViewItemAutomationPeerFactory := IGridViewItemAutomationPeerFactory(factoryPtr)
        }

        return GridViewItemAutomationPeer.__IGridViewItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
