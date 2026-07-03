#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A callback function that is used to create items in the cache. (FCACHE_RICHCREATE_CALLBACK)
 * @see https://learn.microsoft.com/windows/win32/api/filehc/nc-filehc-fcache_richcreate_callback
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FCACHE_RICHCREATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is FCACHE_RICHCREATE_CALLBACK) {
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
     * @param {Pointer<Void>} lpvData User-provided data to <a href="https://docs.microsoft.com/windows/desktop/api/filehc/nf-filehc-cacherichcreatefile">CacheRichCreateFile</a>.
     * @param {Pointer<Integer>} cbFileSize The size of the low <b>DWORD</b>.
     * @param {Pointer<Integer>} cbFileSizeHigh The size of the high <b>DWORD</b>.
     * @param {Pointer<BOOL>} pfDidWeScanIt Set to <b>TRUE</b> if the file has been scanned; otherwise, it is set to <b>FALSE</b>.
     * @param {Pointer<BOOL>} pfIsStuffed Set to <b>TRUE</b> if the file is dot stuffed; otherwise, it is set to <b>FALSE</b>.
     * @param {Pointer<BOOL>} pfStoredWithDots If set to <b>TRUE</b>, this parameter indicates that any dots  that appear at the beginning of a line are stored with an extra dot as required in NNTP, SMTP, and POP3 protocols. If this is <b>FALSE</b>, the message is stored without dot stuffing.
     * @param {Pointer<BOOL>} pfStoredWithTerminatingDot If set to <b>TRUE</b>, the file has been stored with a terminating dot; otherwise, it is <b>FALSE</b>.
     * @returns {HANDLE} Returns a handle to the file that was created in the cache.
     */
    Call(lpstrName, lpvData, cbFileSize, cbFileSizeHigh, pfDidWeScanIt, pfIsStuffed, pfStoredWithDots, pfStoredWithTerminatingDot) {
        lpstrName := lpstrName is String ? StrPtr(lpstrName) : lpstrName

        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"
        cbFileSizeMarshal := cbFileSize is VarRef ? "uint*" : "ptr"
        cbFileSizeHighMarshal := cbFileSizeHigh is VarRef ? "uint*" : "ptr"
        pfDidWeScanItMarshal := pfDidWeScanIt is VarRef ? "int*" : "ptr"
        pfIsStuffedMarshal := pfIsStuffed is VarRef ? "int*" : "ptr"
        pfStoredWithDotsMarshal := pfStoredWithDots is VarRef ? "int*" : "ptr"
        pfStoredWithTerminatingDotMarshal := pfStoredWithTerminatingDot is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", lpstrName, lpvDataMarshal, lpvData, cbFileSizeMarshal, cbFileSize, cbFileSizeHighMarshal, cbFileSizeHigh, pfDidWeScanItMarshal, pfDidWeScanIt, pfIsStuffedMarshal, pfIsStuffed, pfStoredWithDotsMarshal, pfStoredWithDots, pfStoredWithTerminatingDotMarshal, pfStoredWithTerminatingDot, HANDLE.Owned)
        return result
    }

    /**
     * A FCACHE_RICHCREATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FCACHE_RICHCREATE_CALLBACK {
        /**
         * Creates a FCACHE_RICHCREATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, "ptr", "uint*", "uint*", BOOL, BOOL, BOOL, BOOL) => HANDLE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, "ptr", "uint*", "uint*", BOOL.Ptr, BOOL.Ptr, BOOL.Ptr, BOOL.Ptr, HANDLE])
        }

        __Delete() => CallbackFree(this.value)
    }
}
