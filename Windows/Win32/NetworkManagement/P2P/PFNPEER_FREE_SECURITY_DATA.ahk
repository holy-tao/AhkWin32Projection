#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PEER_DATA.ahk" { PEER_DATA }

/**
 * The PFNPEER_FREE_SECURITY_DATA callback specifies the function that the Peer Graphing Infrastructure calls to free data returned by PFNPEER_SECURE_RECORD and PFNPEER_VALIDATE_RECORD callbacks.
 * @remarks
 * This callback can be invoked from any of the Peer Graphing API functions involving records, such as <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/nc-p2p-pfnpeer_free_security_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @deprecated
 */
export default struct PFNPEER_FREE_SECURITY_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PFNPEER_FREE_SECURITY_DATA) {
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
     * @param {Pointer<Void>} pvContext Pointer to the security context to free. This  parameter is set to the value of the <b>pvContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_security_interface">PEER_SECURITY_INTERFACE</a> structure passed in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>.
     * @param {Pointer<PEER_DATA>} pSecurityData Pointer to the security data to  free.
     * @returns {HRESULT} If the callback is successful, the return value is S_OK. Otherwise, the callback   returns one of the following values.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hGraph, pvContext, pSecurityData) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hGraphMarshal, hGraph, pvContextMarshal, pvContext, PEER_DATA.Ptr, pSecurityData, "HRESULT")
        return result
    }

    /**
     * A PFNPEER_FREE_SECURITY_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNPEER_FREE_SECURITY_DATA {
        /**
         * Creates a PFNPEER_FREE_SECURITY_DATA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", PEER_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", PEER_DATA.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
