#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PFNPEER_VALIDATE_RECORD callback specifies the function that the Peer Graphing Infrastructure calls to validate records.
 * @remarks
 * When this callback is called by the Peer Graphing Infrastructure, a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_record_change_type">PEER_RECORD_CHANGE_TYPE</a> value is passed.  This specifies  the operation just performed on the record.  The application must verify the record based on the change type.  If the application  requires more information to verify the record, it can return PEER_E_DEFERRED_VALIDATION  and the Peer Graphing  Infrastructure places the record  in a deferred-record list.  Once the security mechanism has enough information to validate the record, it  calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphvalidatedeferredrecords">PeerGraphValidateDeferredRecords</a>, and any record in the deferred-record list is re-submitted for validation.
 * 
 * This callback can be invoked from any of the Peer Graphing API functions involving records, such as <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/p2p/nc-p2p-pfnpeer_validate_record
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 * @deprecated 
 */
class PFNPEER_VALIDATE_RECORD extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} hGraph 
     * @param {Pointer<Void>} pvContext 
     * @param {Pointer<PEER_RECORD>} pRecord 
     * @param {Integer} changeType_ 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hGraph, pvContext, pRecord, changeType_) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, hGraphMarshal, hGraph, pvContextMarshal, pvContext, "ptr", pRecord, "int", changeType_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
