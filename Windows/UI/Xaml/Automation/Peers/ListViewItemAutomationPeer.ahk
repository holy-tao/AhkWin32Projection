#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IListViewItemAutomationPeer.ahk
#Include .\IListViewItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes a [ListViewItem](../windows.ui.xaml.controls/listviewitem.md) to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ListViewItem](../windows.ui.xaml.controls/listviewitem.md) class creates a new ListViewItemAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ListViewItemAutomationPeer if you are deriving a custom class from [ListViewItem](../windows.ui.xaml.controls/listviewitem.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listviewitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ListViewItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ListViewItem} owner 
     * @returns {ListViewItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ListViewItemAutomationPeer.HasProp("__IListViewItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ListViewItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemAutomationPeerFactory.IID)
            ListViewItemAutomationPeer.__IListViewItemAutomationPeerFactory := IListViewItemAutomationPeerFactory(factoryPtr)
        }

        return ListViewItemAutomationPeer.__IListViewItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
