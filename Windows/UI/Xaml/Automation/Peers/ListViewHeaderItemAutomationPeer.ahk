#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewBaseHeaderItemAutomationPeer.ahk
#Include .\IListViewHeaderItemAutomationPeer.ahk
#Include .\IListViewHeaderItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ListViewHeaderItem](../windows.ui.xaml.controls/listviewheaderitem.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listviewheaderitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ListViewHeaderItemAutomationPeer extends ListViewBaseHeaderItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewHeaderItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewHeaderItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ListViewHeaderItem} owner 
     * @returns {ListViewHeaderItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ListViewHeaderItemAutomationPeer.HasProp("__IListViewHeaderItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ListViewHeaderItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewHeaderItemAutomationPeerFactory.IID)
            ListViewHeaderItemAutomationPeer.__IListViewHeaderItemAutomationPeerFactory := IListViewHeaderItemAutomationPeerFactory(factoryPtr)
        }

        return ListViewHeaderItemAutomationPeer.__IListViewHeaderItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
