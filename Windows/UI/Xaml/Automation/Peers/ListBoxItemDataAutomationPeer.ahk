#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorItemAutomationPeer.ahk
#Include .\IListBoxItemDataAutomationPeer.ahk
#Include ..\Provider\IScrollItemProvider.ahk
#Include .\IListBoxItemDataAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ListBox](../windows.ui.xaml.controls/listbox.md) items to Microsoft UI Automation, using a data representation of the item so that the peer supports scrolling to that item with data awareness.
 * @remarks
 * ListBoxItemDataAutomationPeer is generated from [ListBoxAutomationPeer](listboxautomationpeer.md) logic, not an associated control class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listboxitemdataautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ListBoxItemDataAutomationPeer extends SelectorItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListBoxItemDataAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListBoxItemDataAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IInspectable} item 
     * @param {ListBoxAutomationPeer} parent 
     * @returns {ListBoxItemDataAutomationPeer} 
     */
    static CreateInstanceWithParentAndItem(item, parent) {
        if (!ListBoxItemDataAutomationPeer.HasProp("__IListBoxItemDataAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ListBoxItemDataAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListBoxItemDataAutomationPeerFactory.IID)
            ListBoxItemDataAutomationPeer.__IListBoxItemDataAutomationPeerFactory := IListBoxItemDataAutomationPeerFactory(factoryPtr)
        }

        return ListBoxItemDataAutomationPeer.__IListBoxItemDataAutomationPeerFactory.CreateInstanceWithParentAndItem(item, parent, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Scrolls the content area of a container object in order to display the control within the visible region (viewport) of the container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listboxitemdataautomationpeer.scrollintoview
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
