#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An application-defined callback function used with WriteEncryptedFileRaw. The system calls ImportCallback one or more times, each time to retrieve a portion of a backup file's data.
 * @remarks
 * The system calls the <b>ImportCallback</b> function until the 
 *      callback function indicates there is no more data to restore. To indicate that there is no more data to be 
 *      restored, set <i>*ulLength</i> to 0 and use a return code of 
 *      <b>ERROR_SUCCESS</b>. You can use the application-defined context block for internal tracking 
 *      of information such as the file handle and the current offset in the file.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-pfe_import_func
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PFE_IMPORT_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFE_IMPORT_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pbData A pointer to a system-supplied buffer that will receive a block of data to be restored.
     * @param {Pointer<Void>} pvCallbackContext A pointer to an application-defined and allocated context block. The application passes this pointer to 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-writeencryptedfileraw">WriteEncryptedFileRaw</a>, and it passes this 
     *       pointer to the callback function so that the callback function can have access to application-specific data. 
     *       This data can be a structure and can contain any data the application needs, such as the handle to the file that 
     *       contains the backup copy of the encrypted file.
     * @param {Pointer<Integer>} ulLength On function entry, this parameter specifies the length of the buffer the system has supplied. The callback 
     *        function must write no more than this many bytes to the buffer pointed to by the 
     *        <i>pbData</i> parameter.
     * 
     * On exit, the function must set this to the number of bytes of data written into the 
     *        <i>pbData</i>.
     * @returns {Integer} If the function succeeds, it must set the return value to <b>ERROR_SUCCESS</b>, and set 
     *        the value pointed to by the <i>ulLength</i> parameter to the number of bytes copied into 
     *        <i>pbData</i>.
     * 
     * When the end of the backup file is reached, set <i>ulLength</i> to zero to tell the system 
     *        that the entire file has been processed.
     * 
     * If the function fails, set the return value to a nonzero error code defined in WinError.h. For 
     *        example, if this function fails because an API that it calls fails, you can set the return value to the value 
     *        returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for the failed API.
     */
    Call(pbData, pvCallbackContext, ulLength) {
        pvCallbackContextMarshal := pvCallbackContext is VarRef ? "ptr" : "ptr"
        ulLengthMarshal := ulLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, pbData, pvCallbackContextMarshal, pvCallbackContext, ulLengthMarshal, ulLength, UInt32)
        return result
    }

    /**
     * A PFE_IMPORT_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFE_IMPORT_FUNC {
        /**
         * Creates a PFE_IMPORT_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
