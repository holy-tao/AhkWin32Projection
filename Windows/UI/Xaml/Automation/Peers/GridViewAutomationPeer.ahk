#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewBaseAutomationPeer.ahk
#Include .\IGridViewAutomationPeer.ahk
#Include .\IGridViewAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [GridView](../windows.ui.xaml.controls/gridview.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [GridView](../windows.ui.xaml.controls/gridview.md) class creates a new GridViewAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from GridViewAutomationPeer if you are deriving a custom class from [GridView](../windows.ui.xaml.controls/gridview.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.gridviewautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class GridViewAutomationPeer extends ListViewBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridViewAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridViewAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {GridView} owner 
     * @returns {GridViewAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!GridViewAutomationPeer.HasProp("__IGridViewAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.GridViewAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewAutomationPeerFactory.IID)
            GridViewAutomationPeer.__IGridViewAutomationPeerFactory := IGridViewAutomationPeerFactory(factoryPtr)
        }

        return GridViewAutomationPeer.__IGridViewAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
