#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods for receiving event notifications.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IRowsetEvents</b> if your provider needs to receive notifications of rowset events. <b>IRowsetEvents</b> exposes methods for receiving event notifications, and must be implemented to receive the following notifications on events: <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">OnChangedItem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-ondeleteditem">OnDeletedItem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onnewitem">OnNewItem</a> and <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onrowsetevent">OnRowsetEvent</a>. The <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> and <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_type">ROWSETEVENT_TYPE</a> enumeratiors capture the item state and rowset event, respectively. 
 * 
 * Indexer eventing is a new feature for Windows 7 that allows providers to receive notifications on their rowsets. Providers can use eventing to maintain their rowsets in such a way that they behave akin to actual file system locations.
 * 
 * The <b>IRowsetEvents</b> interface is registered by connection point with an open indexer rowset.
 * 
 * <b>DBPROP_ENABLEROWSETEVENTS</b> must be set to <b>TRUE</b> with the OLE DB <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms711497(v=vs.85)">ICommandProperties::SetProperties</a> method prior to executing the query in order to use rowset eventing.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-irowsetevents
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetEvents
     * @type {Guid}
     */
    static IID => Guid("{1551aea5-5d66-4b11-86f5-d5634cb211b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNewItem", "OnChangedItem", "OnDeletedItem", "OnRowsetEvent"]

    /**
     * Called by the indexer to notify clients of a new item that may match some (or all) of the criteria for the client rowset.
     * @param {Pointer<PROPVARIANT>} itemID Type: <b>REFPROPVARIANT</b>
     * 
     * The new item that may match the original search criteria of the rowset.
     * @param {Integer} newItemState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a></b>
     * 
     * Specifies whether the new item matches all or some of the criteria for your rowset, as a <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-irowsetevents-onnewitem
     */
    OnNewItem(itemID, newItemState) {
        result := ComCall(3, this, "ptr", itemID, "int", newItemState, "HRESULT")
        return result
    }

    /**
     * Called by the indexer to notify clients that an item has been modified. This item may have matched some (or all) of the criteria for the client rowset.
     * @param {Pointer<PROPVARIANT>} itemID Type: <b>REFPROPVARIANT</b>
     * 
     * Specifies the item in the rowset that has changed.
     * @param {Integer} rowsetItemState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a></b>
     * 
     * Specifies whether the changed item was originally in the rowset.
     * @param {Integer} changedItemState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a></b>
     * 
     * Specifies whether the changed item is currently in the rowset, as a result of the change.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-irowsetevents-onchangeditem
     */
    OnChangedItem(itemID, rowsetItemState, changedItemState) {
        result := ComCall(4, this, "ptr", itemID, "int", rowsetItemState, "int", changedItemState, "HRESULT")
        return result
    }

    /**
     * Called by the indexer to notify clients that an item has been deleted. This item may have matched some (or all) of the search criteria for the client rowset.
     * @param {Pointer<PROPVARIANT>} itemID Type: <b>REFPROPVARIANT</b>
     * 
     * Specifies the item in the rowset that has been deleted.
     * @param {Integer} deletedItemState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a></b>
     * 
     * Specifies whether the deleted item is currently in the rowset, as a <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-irowsetevents-ondeleteditem
     */
    OnDeletedItem(itemID, deletedItemState) {
        result := ComCall(5, this, "ptr", itemID, "int", deletedItemState, "HRESULT")
        return result
    }

    /**
     * Called by the indexer to notify clients of an event related to the client rowset.
     * @param {Integer} eventType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_type">ROWSETEVENT_TYPE</a></b>
     * 
     * The event triggering the notification as the <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_type">ROWSETEVENT_TYPE</a> enumeration.
     * @param {Pointer<PROPVARIANT>} eventData Type: <b>REFPROPVARIANT</b>
     * 
     * The expected value of the event data for the event type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-irowsetevents-onrowsetevent
     */
    OnRowsetEvent(eventType, eventData) {
        result := ComCall(6, this, "int", eventType, "ptr", eventData, "HRESULT")
        return result
    }
}
