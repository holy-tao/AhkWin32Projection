#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewBaseAutomationPeer.ahk
#Include .\IListViewAutomationPeer.ahk
#Include .\IListViewAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ListView](../windows.ui.xaml.controls/listview.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ListView](../windows.ui.xaml.controls/listview.md) class creates a new ListViewAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ListViewAutomationPeer if you are deriving a custom class from [ListView](../windows.ui.xaml.controls/listview.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listviewautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ListViewAutomationPeer extends ListViewBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ListView} owner 
     * @returns {ListViewAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ListViewAutomationPeer.HasProp("__IListViewAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ListViewAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewAutomationPeerFactory.IID)
            ListViewAutomationPeer.__IListViewAutomationPeerFactory := IListViewAutomationPeerFactory(factoryPtr)
        }

        return ListViewAutomationPeer.__IListViewAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
