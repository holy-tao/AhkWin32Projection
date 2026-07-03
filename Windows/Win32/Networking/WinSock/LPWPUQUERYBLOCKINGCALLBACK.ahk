#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPBLOCKINGCALLBACK.ahk" { LPBLOCKINGCALLBACK }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUQUERYBLOCKINGCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUQUERYBLOCKINGCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwCatalogEntryId 
     * @param {Pointer<Pointer<LPBLOCKINGCALLBACK>>} lplpfnCallback 
     * @param {Pointer<Pointer>} lpdwContext 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(dwCatalogEntryId, lplpfnCallback, lpdwContext, lpErrno) {
        lplpfnCallbackMarshal := lplpfnCallback is VarRef ? "ptr*" : "ptr"
        lpdwContextMarshal := lpdwContext is VarRef ? "ptr*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UInt32, dwCatalogEntryId, lplpfnCallbackMarshal, lplpfnCallback, lpdwContextMarshal, lpdwContext, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWPUQUERYBLOCKINGCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUQUERYBLOCKINGCALLBACK {
        /**
         * Creates a LPWPUQUERYBLOCKINGCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*", "ptr*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", "ptr*", "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
