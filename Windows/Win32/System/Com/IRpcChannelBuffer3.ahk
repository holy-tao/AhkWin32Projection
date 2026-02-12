#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcChannelBuffer2.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcChannelBuffer3 extends IRpcChannelBuffer2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRpcChannelBuffer3
     * @type {Guid}
     */
    static IID => Guid("{25b15600-0115-11d0-bf0d-00aa00b8dfd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Send", "Receive", "Cancel", "GetCallContext", "GetDestCtxEx", "GetState", "RegisterAsync"]

    /**
     * Send BLOB Data to SQL SERVER Using IROWSETFASTLOAD and ISEQUENTIALSTREAM in (Native Client OLE DB)
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/send-blob-data-to-sql-server-using-irowsetfastload-and-isequentialstream-ole-db
     */
    Send(pMsg) {
        result := ComCall(9, this, "ptr", pMsg, "uint*", &pulStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulStatus
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Integer} ulSize 
     * @returns {Integer} 
     */
    Receive(pMsg, ulSize) {
        result := ComCall(10, this, "ptr", pMsg, "uint", ulSize, "uint*", &pulStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulStatus
    }

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    Cancel(pMsg) {
        result := ComCall(11, this, "ptr", pMsg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCallContext(pMsg, riid) {
        result := ComCall(12, this, "ptr", pMsg, "ptr", riid, "ptr*", &pInterface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInterface
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Integer>} pdwDestContext 
     * @param {Pointer<Pointer<Void>>} ppvDestContext 
     * @returns {HRESULT} 
     */
    GetDestCtxEx(pMsg, pdwDestContext, ppvDestContext) {
        pdwDestContextMarshal := pdwDestContext is VarRef ? "uint*" : "ptr"
        ppvDestContextMarshal := ppvDestContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pMsg, pdwDestContextMarshal, pdwDestContext, ppvDestContextMarshal, ppvDestContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState(pMsg) {
        result := ComCall(14, this, "ptr", pMsg, "uint*", &pState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pState
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {IAsyncManager} pAsyncMgr 
     * @returns {HRESULT} 
     */
    RegisterAsync(pMsg, pAsyncMgr) {
        result := ComCall(15, this, "ptr", pMsg, "ptr", pAsyncMgr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
