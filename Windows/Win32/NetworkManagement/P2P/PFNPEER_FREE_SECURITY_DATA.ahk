#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PFNPEER_FREE_SECURITY_DATA callback specifies the function that the Peer Graphing Infrastructure calls to free data returned by PFNPEER_SECURE_RECORD and PFNPEER_VALIDATE_RECORD callbacks.
 * @remarks
 * This callback can be invoked from any of the Peer Graphing API functions involving records, such as <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/p2p/nc-p2p-pfnpeer_free_security_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 * @deprecated 
 */
class PFNPEER_FREE_SECURITY_DATA extends IUnknown {

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
     * @param {Pointer<PEER_DATA>} pSecurityData 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hGraph, pvContext, pSecurityData) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, hGraphMarshal, hGraph, pvContextMarshal, pvContext, "ptr", pSecurityData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
