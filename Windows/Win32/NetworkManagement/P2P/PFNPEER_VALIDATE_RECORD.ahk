#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_RECORD.ahk" { PEER_RECORD }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PEER_RECORD_CHANGE_TYPE.ahk" { PEER_RECORD_CHANGE_TYPE }

/**
 * The PFNPEER_VALIDATE_RECORD callback specifies the function that the Peer Graphing Infrastructure calls to validate records.
 * @remarks
 * When this callback is called by the Peer Graphing Infrastructure, a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_record_change_type">PEER_RECORD_CHANGE_TYPE</a> value is passed.  This specifies  the operation just performed on the record.  The application must verify the record based on the change type.  If the application  requires more information to verify the record, it can return PEER_E_DEFERRED_VALIDATION  and the Peer Graphing  Infrastructure places the record  in a deferred-record list.  Once the security mechanism has enough information to validate the record, it  calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphvalidatedeferredrecords">PeerGraphValidateDeferredRecords</a>, and any record in the deferred-record list is re-submitted for validation.
 * 
 * This callback can be invoked from any of the Peer Graphing API functions involving records, such as <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/nc-p2p-pfnpeer_validate_record
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @deprecated
 */
export default struct PFNPEER_VALIDATE_RECORD {
    value : IntPtr

    __value {
        set {
            if (value is PFNPEER_VALIDATE_RECORD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hGraph Specifies the peer graph associated with the specified record.
     * @param {Pointer<Void>} pvContext Pointer to the security context. This parameter should point to the <b>pvContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_security_interface">PEER_SECURITY_INTERFACE</a> structure.
     * @param {Pointer<PEER_RECORD>} pRecord Specifies the record to validate.
     * @param {PEER_RECORD_CHANGE_TYPE} _changeType Specifies the reason the validation must occur.  Must be one of the  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_record_change_type">PEER_RECORD_CHANGE_TYPE</a> values.
     * @returns {HRESULT} If this callback succeeds, the return value is S_OK; otherwise, the function returns one of the following errors:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_DEFERRED_VALIDATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified record cannot be validated at this time because there is insufficient information to complete the operation. Validation is deferred. Call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphvalidatedeferredrecords">PeerGraphValidateDeferredRecords</a> when sufficient information is obtained.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_RECORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified record is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hGraph, pvContext, pRecord, _changeType) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hGraphMarshal, hGraph, pvContextMarshal, pvContext, PEER_RECORD.Ptr, pRecord, PEER_RECORD_CHANGE_TYPE, _changeType, "HRESULT")
        return result
    }

    /**
     * A PFNPEER_VALIDATE_RECORD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNPEER_VALIDATE_RECORD {
        /**
         * Creates a PFNPEER_VALIDATE_RECORD pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", PEER_RECORD, PEER_RECORD_CHANGE_TYPE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", PEER_RECORD.Ptr, PEER_RECORD_CHANGE_TYPE, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
