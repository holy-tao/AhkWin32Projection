#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCWRITEPROVIDERORDER {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCWRITEPROVIDERORDER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} lpwdCatalogEntryId 
     * @param {Integer} dwNumberOfEntries 
     * @returns {Integer} 
     */
    Call(lpwdCatalogEntryId, dwNumberOfEntries) {
        lpwdCatalogEntryIdMarshal := lpwdCatalogEntryId is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, lpwdCatalogEntryIdMarshal, lpwdCatalogEntryId, UInt32, dwNumberOfEntries, Int32)
        return result
    }

    /**
     * A LPWSCWRITEPROVIDERORDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCWRITEPROVIDERORDER {
        /**
         * Creates a LPWSCWRITEPROVIDERORDER pointer that invokes the given AHK function when called.
         * @param {Func("uint*", UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", UInt32, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
