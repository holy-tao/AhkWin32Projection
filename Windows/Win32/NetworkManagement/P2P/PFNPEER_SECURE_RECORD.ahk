#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/p2p/nc-p2p-pfnpeer_secure_record
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 * @deprecated 
 */
class PFNPEER_SECURE_RECORD extends IUnknown {

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
     * @returns {Pointer<PEER_DATA>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hGraph, pvContext, pRecord, changeType_) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, hGraphMarshal, hGraph, pvContextMarshal, pvContext, "ptr", pRecord, "int", changeType_, "ptr*", &ppSecurityData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppSecurityData
    }
}
