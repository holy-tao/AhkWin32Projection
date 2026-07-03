#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A callback function that is used to create items in the cache. (FCACHE_CREATE_CALLBACK)
 * @see https://learn.microsoft.com/windows/win32/api/filehc/nc-filehc-fcache_create_callback
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FCACHE_CREATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is FCACHE_CREATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpstrName The name of the file.
     * @param {Pointer<Void>} lpvData User-provided data to <a href="https://docs.microsoft.com/windows/desktop/api/filehc/nf-filehc-cachecreatefile">CacheCreateFile</a>.
     * @param {Pointer<Integer>} cbFileSize The size of the file.
     * @param {Pointer<Integer>} cbFileSizeHigh The location to return the high <b>DWORD</b> of the file size.
     * @returns {HANDLE} Returns a handle to the file created in the cache.
     */
    Call(lpstrName, lpvData, cbFileSize, cbFileSizeHigh) {
        lpstrName := lpstrName is String ? StrPtr(lpstrName) : lpstrName

        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"
        cbFileSizeMarshal := cbFileSize is VarRef ? "uint*" : "ptr"
        cbFileSizeHighMarshal := cbFileSizeHigh is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpstrName, lpvDataMarshal, lpvData, cbFileSizeMarshal, cbFileSize, cbFileSizeHighMarshal, cbFileSizeHigh, HANDLE.Owned)
        return result
    }

    /**
     * A FCACHE_CREATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FCACHE_CREATE_CALLBACK {
        /**
         * Creates a FCACHE_CREATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, "ptr", "uint*", "uint*") => HANDLE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, "ptr", "uint*", "uint*", HANDLE])
        }

        __Delete() => CallbackFree(this.value)
    }
}
