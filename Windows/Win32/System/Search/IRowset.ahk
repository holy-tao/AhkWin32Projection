#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

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
 * @version v4.0.30319
 */
class IRowset extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowset
     * @type {Guid}
     */
    static IID => Guid("{0c733a7c-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRefRows", "GetData", "GetNextRows", "ReleaseRows", "RestartPosition"]

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRefCounts 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    AddRefRows(cRows, rghRows, rgRefCounts, rgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRefCountsMarshal := rgRefCounts is VarRef ? "uint*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", cRows, rghRowsMarshal, rghRows, rgRefCountsMarshal, rgRefCounts, rgRowStatusMarshal, rgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} _hAccessor 
     * @returns {Void} 
     */
    GetData(hRow, _hAccessor) {
        _hAccessor := _hAccessor is Win32Handle ? NumGet(_hAccessor, "ptr") : _hAccessor

        result := ComCall(4, this, "ptr", hRow, "ptr", _hAccessor, "ptr", &pData := 0, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @param {Pointer<Pointer<Pointer>>} prghRows 
     * @returns {HRESULT} 
     */
    GetNextRows(hReserved, lRowsOffset, cRows, pcRowsObtained, prghRows) {
        pcRowsObtainedMarshal := pcRowsObtained is VarRef ? "ptr*" : "ptr"
        prghRowsMarshal := prghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", hReserved, "ptr", lRowsOffset, "ptr", cRows, pcRowsObtainedMarshal, pcRowsObtained, prghRowsMarshal, prghRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRowOptions 
     * @param {Pointer<Integer>} rgRefCounts 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    ReleaseRows(cRows, rghRows, rgRowOptions, rgRefCounts, rgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRowOptionsMarshal := rgRowOptions is VarRef ? "uint*" : "ptr"
        rgRefCountsMarshal := rgRefCounts is VarRef ? "uint*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", cRows, rghRowsMarshal, rghRows, rgRowOptionsMarshal, rgRowOptions, rgRefCountsMarshal, rgRefCounts, rgRowStatusMarshal, rgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @returns {HRESULT} 
     */
    RestartPosition(hReserved) {
        result := ComCall(7, this, "ptr", hReserved, "HRESULT")
        return result
    }
}
