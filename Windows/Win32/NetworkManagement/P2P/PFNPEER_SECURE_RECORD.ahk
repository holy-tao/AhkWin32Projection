#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_RECORD.ahk" { PEER_RECORD }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import ".\PEER_RECORD_CHANGE_TYPE.ahk" { PEER_RECORD_CHANGE_TYPE }

/**
 * The PFNPEER_SECURE_RECORD callback specifies the function that the Peer Graphing Infrastructure calls to secure records.
 * @remarks
 * This callback is invoked whenever an application calls any of the methods that modify records, such as <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphaddrecord">PeerGraphAddRecord</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>. This callback  
 * should create  data that is specific to this record, such as a small digital signature, and return it through the <i>ppSecurityData</i> parameter.
 * This data is then  added to the record in the <b>securityData</b> member, and is  verified by the method specified by the <b>pfnValidateRecord</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_security_interface">PEER_SECURITY_INTERFACE</a>.
 * 
 * <div class="alert"><b>Note</b>  This process happens on the local computer as well as any peer connected to the graph when the peer receives the record.</div>
 * <div> </div>
 *  If the operation specified by the <i>changeType</i> parameter is not allowed, the callback should return a failure code, such as PEER_E_NOT_AUTHORIZED,  instead of S_OK.
 * 
 * This callback can be invoked from any of the Peer Graphing API functions involving records, such as <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/nc-p2p-pfnpeer_secure_record
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @deprecated
 */
export default struct PFNPEER_SECURE_RECORD {
    value : IntPtr

    __value {
        set {
            if (value is PFNPEER_SECURE_RECORD) {
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
     * @param {Pointer<Void>} pvContext Pointer to the security context. This parameter  points to the <b>pvContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_security_interface">PEER_SECURITY_INTERFACE</a> structure.
     * @param {Pointer<PEER_RECORD>} pRecord Pointer to the record to secure.
     * @param {PEER_RECORD_CHANGE_TYPE} _changeType Specifies the reason the validation must occur.     <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_record_change_type">PEER_RECORD_CHANGE_TYPE</a> enumerates the valid values.
     * @returns {Pointer<PEER_DATA>} Specifies the security data for this record. This data is released by calling the method specified in the <b>pfnFreeSecurityData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_security_interface">PEER_SECURITY_INTERFACE</a> after the data is copied and added to the record.
     */
    Call(hGraph, pvContext, pRecord, _changeType) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hGraphMarshal, hGraph, pvContextMarshal, pvContext, PEER_RECORD.Ptr, pRecord, PEER_RECORD_CHANGE_TYPE, _changeType, "ptr*", &ppSecurityData := 0, "HRESULT")
        return ppSecurityData
    }

    /**
     * A PFNPEER_SECURE_RECORD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNPEER_SECURE_RECORD {
        /**
         * Creates a PFNPEER_SECURE_RECORD pointer that invokes the given AHK function when called.
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
