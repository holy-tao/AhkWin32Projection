#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalGetPrmCache {
    value : IntPtr

    __value {
        set {
            if (value is pHalGetPrmCache) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<LIST_ENTRY>>} FirmwareList 
     * @param {Pointer<Pointer<LIST_ENTRY>>} UpdateList 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FirmwareList, UpdateList) {
        FirmwareListMarshal := FirmwareList is VarRef ? "ptr*" : "ptr"
        UpdateListMarshal := UpdateList is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, FirmwareListMarshal, FirmwareList, UpdateListMarshal, UpdateList)
    }

    /**
     * A pHalGetPrmCache that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalGetPrmCache {
        /**
         * Creates a pHalGetPrmCache pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "ptr*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
