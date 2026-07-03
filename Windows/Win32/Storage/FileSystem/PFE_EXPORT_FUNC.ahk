#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An application-defined callback function used with ReadEncryptedFileRaw.
 * @remarks
 * You can use the application-defined context block for internal tracking of information such as the file handle 
 *      and the current offset in the file.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-pfe_export_func
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PFE_EXPORT_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFE_EXPORT_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pbData A pointer to a block of the encrypted file's data to be backed up. This block of data is allocated by the 
     *       system.
     * @param {Pointer<Void>} pvCallbackContext A pointer to an application-defined and allocated context block. The application passes this pointer to 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-readencryptedfileraw">ReadEncryptedFileRaw</a>, and 
     *       <b>ReadEncryptedFileRaw</b> passes this pointer to the 
     *       callback function so that it can have access to application-specific data. This data can be a structure and can 
     *       contain any data the application needs, such as the handle to the file that contains the backup copy of the 
     *       encrypted file.
     * @param {Integer} ulLength The size of the data pointed to by the <i>pbData</i> parameter, in bytes.
     * @returns {Integer} If the function succeeds, it must set the return value to <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, set the return value to a nonzero error code defined in WinError.h. For 
     *        example, if this function fails because an API that it calls fails, you can set the return value to the value 
     *        returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for the failed API.
     */
    Call(pbData, pvCallbackContext, ulLength) {
        pvCallbackContextMarshal := pvCallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, pbData, pvCallbackContextMarshal, pvCallbackContext, UInt32, ulLength, UInt32)
        return result
    }

    /**
     * A PFE_EXPORT_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFE_EXPORT_FUNC {
        /**
         * Creates a PFE_EXPORT_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
