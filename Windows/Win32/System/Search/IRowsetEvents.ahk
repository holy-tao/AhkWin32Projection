#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\ROWSETEVENT_ITEMSTATE.ahk" { ROWSETEVENT_ITEMSTATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ROWSETEVENT_TYPE.ahk" { ROWSETEVENT_TYPE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for receiving event notifications.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IRowsetEvents</b> if your provider needs to receive notifications of rowset events. <b>IRowsetEvents</b> exposes methods for receiving event notifications, and must be implemented to receive the following notifications on events: <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">OnChangedItem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-ondeleteditem">OnDeletedItem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onnewitem">OnNewItem</a> and <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onrowsetevent">OnRowsetEvent</a>. The <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> and <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_type">ROWSETEVENT_TYPE</a> enumerators capture the item state and rowset event, respectively. 
 * 
 * Indexer eventing is a new feature for Windows 7 that allows providers to receive notifications on their rowsets. Providers can use eventing to maintain their rowsets in such a way that they behave akin to actual file system locations.
 * 
 * The <b>IRowsetEvents</b> interface is registered by connection point with an open indexer rowset.
 * 
 * <b>DBPROP_ENABLEROWSETEVENTS</b> must be set to <b>TRUE</b> with the OLE DB <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms711497(v=vs.85)">ICommandProperties::SetProperties</a> method prior to executing the query in order to use rowset eventing.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-irowsetevents
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetEvents extends IUnknown {
    /**
     * The interface identifier for IRowsetEvents
     * @type {Guid}
     */
    static IID := Guid("{1551aea5-5d66-4b11-86f5-d5634cb211b9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnNewItem     : IntPtr
        OnChangedItem : IntPtr
        OnDeletedItem : IntPtr
        OnRowsetEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the indexer to notify clients of a new item that may match some (or all) of the criteria for the client rowset.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> indicates the degree to which the new item may match the original search criteria of a rowset:
     *         
     * 
     * <ul>
     * <li><i>ROWSETEVENT_ITEMSTATE_INROWSET</i> indicates that the new item definitely matches all criteria for your rowset.</li>
     * <li><i>ROWSETEVENT_ITEMSTATE_UNKNOWN</i> indicates that the new item at least partially matches some criteria for your rowset. It may match fully.</li>
     * <li><i>ROWSETEVENT_ITEMSTATE_NOTINROWSET</i> is not applicable for new items.</li>
     * </ul>
     * @param {Pointer<PROPVARIANT>} itemID Type: <b>REFPROPVARIANT</b>
     * 
     * The new item that may match the original search criteria of the rowset.
     * @param {ROWSETEVENT_ITEMSTATE} newItemState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a></b>
     * 
     * Specifies whether the new item matches all or some of the criteria for your rowset, as a <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-irowsetevents-onnewitem
     */
    OnNewItem(itemID, newItemState) {
        result := ComCall(3, this, PROPVARIANT.Ptr, itemID, ROWSETEVENT_ITEMSTATE, newItemState, "HRESULT")
        return result
    }

    /**
     * Called by the indexer to notify clients that an item has been modified. This item may have matched some (or all) of the criteria for the client rowset.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> for <i>rowsetItemState</i> indicates whether the item was contained in the original rowset: 
     * 
     * <ul>
     * <li><i>ROWSETEVENT_ITEMSTATE_INROWSET</i> indicates that the item is definitely contained within your rowset.</li>
     * <li><i>ROWSETEVENT_ITEMSTATE_UNKNOWN</i> indicates that the item may be contained within your rowset. The containment status is not known because your rowset is not fully evaluated.</li>
     * <li><i>ROWSETEVENT_ITEMSTATE_NOTINROWSET</i> indicates indicates that the item was not originally in your rowset</li>
     * </ul>
     * The <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> for <i>changedItemState</i> indicates whether the newly modified item now matches the degree to which the new item may match the original search criteria of a rowset: 
     * 
     * <ul>
     * <li><i>ROWSETEVENT_ITEMSTATE_INROWSET</i> indicates that the item definitely belongs in your rowset.</li>
     * <li><i>ROWSETEVENT_ITEMSTATE_UNKNOWN</i> indicates that the item may now belong in your rowset.</li>
     * <li><i>ROWSETEVENT_ITEMSTATE_NOTINROWSET</i> indicates that the item does not belong in your rowset.</li>
     * </ul>
     * @param {Pointer<PROPVARIANT>} itemID Type: <b>REFPROPVARIANT</b>
     * 
     * Specifies the item in the rowset that has changed.
     * @param {ROWSETEVENT_ITEMSTATE} rowsetItemState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a></b>
     * 
     * Specifies whether the changed item was originally in the rowset.
     * @param {ROWSETEVENT_ITEMSTATE} changedItemState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a></b>
     * 
     * Specifies whether the changed item is currently in the rowset, as a result of the change.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-irowsetevents-onchangeditem
     */
    OnChangedItem(itemID, rowsetItemState, changedItemState) {
        result := ComCall(4, this, PROPVARIANT.Ptr, itemID, ROWSETEVENT_ITEMSTATE, rowsetItemState, ROWSETEVENT_ITEMSTATE, changedItemState, "HRESULT")
        return result
    }

    /**
     * Called by the indexer to notify clients that an item has been deleted. This item may have matched some (or all) of the search criteria for the client rowset.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> indicates whether or not the item was contained in the original rowset:
     *         
     * 
     * <ul>
     * <li><i>ROWSETEVENT_ITEMSTATE_INROWSET</i> indicates that the deleted item is definitely in your rowset.</li>
     * <li><i>ROWSETEVENT_ITEMSTATE_UNKNOWN</i> indicates that the deleted item may be in your rowset.  The containment status is not known because your rowset is not fully evaluated.</li>
     * <li><i>ROWSETEVENT_ITEMSTATE_NOTINROWSET</i> indicates the deleted item was definitely not in your original rowset (but may have already been given via an  <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onnewitem">OnNewItem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onnewitem">OnChangedItem</a> event).</li>
     * </ul>
     * @param {Pointer<PROPVARIANT>} itemID Type: <b>REFPROPVARIANT</b>
     * 
     * Specifies the item in the rowset that has been deleted.
     * @param {ROWSETEVENT_ITEMSTATE} deletedItemState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a></b>
     * 
     * Specifies whether the deleted item is currently in the rowset, as a <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-irowsetevents-ondeleteditem
     */
    OnDeletedItem(itemID, deletedItemState) {
        result := ComCall(5, this, PROPVARIANT.Ptr, itemID, ROWSETEVENT_ITEMSTATE, deletedItemState, "HRESULT")
        return result
    }

    /**
     * Called by the indexer to notify clients of an event related to the client rowset.
     * @param {ROWSETEVENT_TYPE} eventType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_type">ROWSETEVENT_TYPE</a></b>
     * 
     * The event triggering the notification as the <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_type">ROWSETEVENT_TYPE</a> enumeration.
     * @param {Pointer<PROPVARIANT>} eventData Type: <b>REFPROPVARIANT</b>
     * 
     * The expected value of the event data for the event type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-irowsetevents-onrowsetevent
     */
    OnRowsetEvent(eventType, eventData) {
        result := ComCall(6, this, ROWSETEVENT_TYPE, eventType, PROPVARIANT.Ptr, eventData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnNewItem := CallbackCreate(GetMethod(implObj, "OnNewItem"), flags, 3)
        this.vtbl.OnChangedItem := CallbackCreate(GetMethod(implObj, "OnChangedItem"), flags, 4)
        this.vtbl.OnDeletedItem := CallbackCreate(GetMethod(implObj, "OnDeletedItem"), flags, 3)
        this.vtbl.OnRowsetEvent := CallbackCreate(GetMethod(implObj, "OnRowsetEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnNewItem)
        CallbackFree(this.vtbl.OnChangedItem)
        CallbackFree(this.vtbl.OnDeletedItem)
        CallbackFree(this.vtbl.OnRowsetEvent)
    }
}
