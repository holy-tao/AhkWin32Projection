#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Receives encrypted or decrypted data from tasks started by using the NCryptStreamOpenToProtect or NCryptStreamOpenToUnprotect functions.
 * @remarks
 * Set a pointer to this callback function in the <b>pfnStreamOutput</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/ns-ncryptprotect-ncrypt_protect_stream_info">NCRYPT_PROTECT_STREAM_INFO</a> structure. Set a pointer to the structure in the <i>pStreamInfo</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nf-ncryptprotect-ncryptstreamopentoprotect">NCryptStreamOpenToProtect</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nf-ncryptprotect-ncryptstreamopentounprotect">NCryptStreamOpenToUnprotect</a> functions.
 * 
 * You can use this callback to further process the encrypted or decrypted data. A common use of the function is to write the data to disk as it is received from the data protection API. The blocks of encrypted or unencrypted data are created by the <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nf-ncryptprotect-ncryptstreamupdate">NCryptStreamUpdate</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ncryptprotect/nc-ncryptprotect-pfncryptstreamoutputcallback
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFNCryptStreamOutputCallback {
    value : IntPtr

    __value {
        set {
            if (value is PFNCryptStreamOutputCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCallbackCtxt Pointer to data that you can use to keep track of your application. The data is not modified by the data protection API. 
     * 
     * <div class="alert"><b>Note</b>  You can set a pointer to your context data in the <b>pvCallbackCtxt</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/ns-ncryptprotect-ncrypt_protect_stream_info">NCRYPT_PROTECT_STREAM_INFO</a> structure before passing a pointer to that structure in the <i>pStreamInfo</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nf-ncryptprotect-ncryptstreamopentoprotect">NCryptStreamOpenToProtect</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nf-ncryptprotect-ncryptstreamopentounprotect">NCryptStreamOpenToUnprotect</a> functions.</div>
     * <div> </div>
     * @param {Integer} pbData Pointer to a block of processed data that can be used by the application.
     * @param {Pointer} cbData The size, in bytes, of the processed data pointed to by the <i>pbData</i> parameter.
     * @param {BOOL} fFinal If this value is <b>TRUE</b>, the current data block is the last to be processed and this
     *         is the last time the callback will be called.
     * @returns {HRESULT} If you return any status code other than <b>ERROR_SUCCESS</b> from your implementation of this callback function, the stream encryption or decryption process will fail.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pvCallbackCtxt, pbData, cbData, fFinal) {
        pvCallbackCtxtMarshal := pvCallbackCtxt is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvCallbackCtxtMarshal, pvCallbackCtxt, IntPtr, pbData, IntPtr, cbData, BOOL, fFinal, "HRESULT")
        return result
    }

    /**
     * A PFNCryptStreamOutputCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCryptStreamOutputCallback {
        /**
         * Creates a PFNCryptStreamOutputCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, IntPtr, BOOL) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, IntPtr, BOOL, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
