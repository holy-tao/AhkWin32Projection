#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AutomationPeer.ahk
#Include .\IItemAutomationPeer.ahk
#Include ..\Provider\IVirtualizedItemProvider.ahk
#Include .\IItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes a data item in an [Items](../windows.ui.xaml.controls/itemscontrol_items.md) collection to Microsoft UI Automation.
 * @remarks
 * ItemAutomationPeer is generated from items control logic and [ItemsControlAutomationPeer](itemscontrolautomationpeer.md), not an associated control class.
 * 
 * In addition to the typical peer implementation API, ItemAutomationPeer has an [ItemsControlAutomationPeer](itemautomationpeer_itemscontrolautomationpeer.md) property to reference its container peer. The container peer potentially supplies the logic for [AutomationPeer](automationpeer.md) methods as called against the ItemAutomationPeer. There is also an [Item](itemautomationpeer_item.md) property that is similar in purpose to the **Owner** property on other peers (it provides the reference to the object that this peer provides the automation exposure for). Both these values must be set in the [ItemAutomationPeer](itemautomationpeer_itemautomationpeer_183553765.md) constructor.
 * 
 * ItemAutomationPeer implements the [Realize](itemautomationpeer_realize_1392015295.md) method in order to support the [IVirtualizedItemProvider](../windows.ui.xaml.automation.provider/ivirtualizeditemprovider.md) control pattern. Clients can call their framework's equivalent pattern access to [Realize](itemautomationpeer_realize_1392015295.md) to get a non-virtualized result. This generates more information about the item in an automation tree view.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.itemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ItemAutomationPeer extends AutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IInspectable} item 
     * @param {ItemsControlAutomationPeer} parent 
     * @returns {ItemAutomationPeer} 
     */
    static CreateInstanceWithParentAndItem(item, parent) {
        if (!ItemAutomationPeer.HasProp("__IItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemAutomationPeerFactory.IID)
            ItemAutomationPeer.__IItemAutomationPeerFactory := IItemAutomationPeerFactory(factoryPtr)
        }

        return ItemAutomationPeer.__IItemAutomationPeerFactory.CreateInstanceWithParentAndItem(item, parent, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the data item in the [Items](../windows.ui.xaml.controls/itemscontrol_items.md) collection that is associated with this [ItemAutomationPeer](itemautomationpeer.md).
     * @remarks
     * This property is similar in purpose to the **Owner** property on other peers (it provides the reference to the object that this peer provides the automation exposure for). Its value must be set in the [ItemAutomationPeer](itemautomationpeer_itemautomationpeer_183553765.md) constructor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.itemautomationpeer.item
     * @type {IInspectable} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * Gets the [ItemsControlAutomationPeer](itemscontrolautomationpeer.md) that is associated with the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) that holds the [Items](../windows.ui.xaml.controls/itemscontrol_items.md) collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.itemautomationpeer.itemscontrolautomationpeer
     * @type {ItemsControlAutomationPeer} 
     */
    ItemsControlAutomationPeer {
        get => this.get_ItemsControlAutomationPeer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Item() {
        if (!this.HasProp("__IItemAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IItemAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemAutomationPeer := IItemAutomationPeer(outPtr)
        }

        return this.__IItemAutomationPeer.get_Item()
    }

    /**
     * 
     * @returns {ItemsControlAutomationPeer} 
     */
    get_ItemsControlAutomationPeer() {
        if (!this.HasProp("__IItemAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IItemAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemAutomationPeer := IItemAutomationPeer(outPtr)
        }

        return this.__IItemAutomationPeer.get_ItemsControlAutomationPeer()
    }

    /**
     * Makes the virtual item fully accessible as a Microsoft UI Automation element.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.itemautomationpeer.realize
     */
    Realize() {
        if (!this.HasProp("__IVirtualizedItemProvider")) {
            if ((queryResult := this.QueryInterface(IVirtualizedItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizedItemProvider := IVirtualizedItemProvider(outPtr)
        }

        return this.__IVirtualizedItemProvider.Realize()
    }

;@endregion Instance Methods
}
