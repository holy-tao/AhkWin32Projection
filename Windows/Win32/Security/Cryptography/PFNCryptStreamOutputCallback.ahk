#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives encrypted or decrypted data from tasks started by using the NCryptStreamOpenToProtect or NCryptStreamOpenToUnprotect functions.
 * @remarks
 * Set a pointer to this callback function in the <b>pfnStreamOutput</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/ns-ncryptprotect-ncrypt_protect_stream_info">NCRYPT_PROTECT_STREAM_INFO</a> structure. Set a pointer to the structure in the <i>pStreamInfo</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nf-ncryptprotect-ncryptstreamopentoprotect">NCryptStreamOpenToProtect</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nf-ncryptprotect-ncryptstreamopentounprotect">NCryptStreamOpenToUnprotect</a> functions.
 * 
 * You can use this callback to further process the encrypted or decrypted data. A common use of the function is to write the data to disk as it is received from the data protection API. The blocks of encrypted or unencrypted data are created by the <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nf-ncryptprotect-ncryptstreamupdate">NCryptStreamUpdate</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ncryptprotect/nc-ncryptprotect-pfncryptstreamoutputcallback
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFNCryptStreamOutputCallback extends IUnknown {

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
     * @param {Pointer<Void>} pvCallbackCtxt 
     * @param {Pointer} pbData 
     * @param {Pointer} cbData 
     * @param {BOOL} fFinal 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvCallbackCtxt, pbData, cbData, fFinal) {
        pvCallbackCtxtMarshal := pvCallbackCtxt is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvCallbackCtxtMarshal, pvCallbackCtxt, "ptr", pbData, "ptr", cbData, "int", fFinal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
