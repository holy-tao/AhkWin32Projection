#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFHDCPStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFHDCPStatus
     * @type {Guid}
     */
    static IID => Guid("{de400f54-5bf1-40cf-8964-0bea136b1e3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Query", "Set"]

    /**
     * Query Notifications Event Category
     * @param {Pointer<Integer>} pStatus 
     * @param {Pointer<BOOL>} pfStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/event-classes/query-notifications-event-category
     */
    Query(pStatus, pfStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pfStatusMarshal := pfStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStatusMarshal, pStatus, pfStatusMarshal, pfStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Set Large Data (Native Client OLE DB provider)
     * @param {Integer} status_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/set-large-data-ole-db
     */
    Set(status_) {
        result := ComCall(4, this, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
