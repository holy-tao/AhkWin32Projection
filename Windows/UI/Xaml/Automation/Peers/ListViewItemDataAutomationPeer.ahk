#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorItemAutomationPeer.ahk
#Include .\IListViewItemDataAutomationPeer.ahk
#Include ..\Provider\IScrollItemProvider.ahk
#Include .\IListViewItemDataAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ListView](../windows.ui.xaml.controls/listview.md) items to Microsoft UI Automation, using a data representation of the item so that the peer supports scrolling to that item with data awareness.
 * @remarks
 * ListViewItemDataAutomationPeer is generated from [ListViewAutomationPeer](listviewautomationpeer.md) logic, not an associated control class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listviewitemdataautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ListViewItemDataAutomationPeer extends SelectorItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewItemDataAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewItemDataAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IInspectable} item 
     * @param {ListViewBaseAutomationPeer} parent 
     * @returns {ListViewItemDataAutomationPeer} 
     */
    static CreateInstanceWithParentAndItem(item, parent) {
        if (!ListViewItemDataAutomationPeer.HasProp("__IListViewItemDataAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ListViewItemDataAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemDataAutomationPeerFactory.IID)
            ListViewItemDataAutomationPeer.__IListViewItemDataAutomationPeerFactory := IListViewItemDataAutomationPeerFactory(factoryPtr)
        }

        return ListViewItemDataAutomationPeer.__IListViewItemDataAutomationPeerFactory.CreateInstanceWithParentAndItem(item, parent, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Scrolls the content area of the parent container in order to display the peer's data within the visible region (viewport) of the container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listviewitemdataautomationpeer.scrollintoview
     */
    ScrollIntoView() {
        if (!this.HasProp("__IScrollItemProvider")) {
            if ((queryResult := this.QueryInterface(IScrollItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollItemProvider := IScrollItemProvider(outPtr)
        }

        return this.__IScrollItemProvider.ScrollIntoView()
    }

;@endregion Instance Methods
}
