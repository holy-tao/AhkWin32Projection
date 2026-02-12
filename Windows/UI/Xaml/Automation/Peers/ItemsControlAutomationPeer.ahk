#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IItemsControlAutomationPeer.ahk
#Include .\IItemsControlAutomationPeer2.ahk
#Include .\IItemsControlAutomationPeerOverrides2.ahk
#Include ..\Provider\IItemContainerProvider.ahk
#Include .\IItemsControlAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) class creates a new ItemsControlAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ItemsControlAutomationPeer if you are deriving a custom class from [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer. Make sure though that there aren't any existing derived classes from [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) that might better suit your scenario. For example, [Selector](../windows.ui.xaml.controls.primitives/selector.md), [FlipView](../windows.ui.xaml.controls/flipview.md), [GridView](../windows.ui.xaml.controls/gridview.md), [ComboBox](../windows.ui.xaml.controls/combobox.md), [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) and [ListBox](../windows.ui.xaml.controls/listbox.md) are all a type of [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md). Each of these already has a dedicated automation peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.itemscontrolautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ItemsControlAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemsControlAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemsControlAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ItemsControl} owner 
     * @returns {ItemsControlAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ItemsControlAutomationPeer.HasProp("__IItemsControlAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ItemsControlAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlAutomationPeerFactory.IID)
            ItemsControlAutomationPeer.__IItemsControlAutomationPeerFactory := IItemsControlAutomationPeerFactory(factoryPtr)
        }

        return ItemsControlAutomationPeer.__IItemsControlAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates a new instance of the [ItemAutomationPeer](itemautomationpeer.md) for a data item in the [Items](../windows.ui.xaml.controls/itemscontrol_items.md) collection of this [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md).
     * @param {IInspectable} item The data item that is associated with this [ItemAutomationPeer](itemautomationpeer.md).
     * @returns {ItemAutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.itemscontrolautomationpeer.createitemautomationpeer
     */
    CreateItemAutomationPeer(item) {
        if (!this.HasProp("__IItemsControlAutomationPeer2")) {
            if ((queryResult := this.QueryInterface(IItemsControlAutomationPeer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlAutomationPeer2 := IItemsControlAutomationPeer2(outPtr)
        }

        return this.__IItemsControlAutomationPeer2.CreateItemAutomationPeer(item)
    }

    /**
     * Invoked whenever a new instance of the [ItemAutomationPeer](itemautomationpeer.md) is created for a data item in the [Items](../windows.ui.xaml.controls/itemscontrol_items.md) collection of this [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md).
     * @param {IInspectable} item The data item that is associated with this [ItemAutomationPeer](itemautomationpeer.md).
     * @returns {ItemAutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.itemscontrolautomationpeer.oncreateitemautomationpeer
     */
    OnCreateItemAutomationPeer(item) {
        if (!this.HasProp("__IItemsControlAutomationPeerOverrides2")) {
            if ((queryResult := this.QueryInterface(IItemsControlAutomationPeerOverrides2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlAutomationPeerOverrides2 := IItemsControlAutomationPeerOverrides2(outPtr)
        }

        return this.__IItemsControlAutomationPeerOverrides2.OnCreateItemAutomationPeer(item)
    }

    /**
     * Retrieves an element by the specified property value.
     * @param {IRawElementProviderSimple} startAfter The item in the container after which to begin the search.
     * @param {AutomationProperty} automationProperty_ The property that contains the value to retrieve.
     * @param {IInspectable} value The value to retrieve.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.itemscontrolautomationpeer.finditembyproperty
     */
    FindItemByProperty(startAfter, automationProperty_, value) {
        if (!this.HasProp("__IItemContainerProvider")) {
            if ((queryResult := this.QueryInterface(IItemContainerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerProvider := IItemContainerProvider(outPtr)
        }

        return this.__IItemContainerProvider.FindItemByProperty(startAfter, automationProperty_, value)
    }

;@endregion Instance Methods
}
