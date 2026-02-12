#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcChannelBuffer2.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAsyncRpcChannelBuffer extends IRpcChannelBuffer2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncRpcChannelBuffer
     * @type {Guid}
     */
    static IID => Guid("{a5029fb6-3c34-11d1-9c99-00c04fb998aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Send", "Receive", "GetDestCtxEx"]

    /**
     * Send BLOB Data to SQL SERVER Using IROWSETFASTLOAD and ISEQUENTIALSTREAM in (Native Client OLE DB)
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {ISynchronize} pSync 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/send-blob-data-to-sql-server-using-irowsetfastload-and-isequentialstream-ole-db
     */
    Send(pMsg, pSync) {
        result := ComCall(9, this, "ptr", pMsg, "ptr", pSync, "uint*", &pulStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulStatus
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     */
    Receive(pMsg) {
        result := ComCall(10, this, "ptr", pMsg, "uint*", &pulStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulStatus
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

        result := ComCall(11, this, "ptr", pMsg, pdwDestContextMarshal, pdwDestContext, ppvDestContextMarshal, ppvDestContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
