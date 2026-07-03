#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPEnumResource {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPEnumResource) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hEnum 
     * @param {Pointer<Integer>} lpcCount 
     * @param {Integer} lpBuffer 
     * @param {Pointer<Integer>} lpBufferSize 
     * @returns {Integer} 
     */
    Call(hEnum, lpcCount, lpBuffer, lpBufferSize) {
        lpcCountMarshal := lpcCount is VarRef ? "uint*" : "ptr"
        lpBufferSizeMarshal := lpBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hEnum, lpcCountMarshal, lpcCount, IntPtr, lpBuffer, lpBufferSizeMarshal, lpBufferSize, UInt32)
        return result
    }

    /**
     * A PF_NPEnumResource that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPEnumResource {
        /**
         * Creates a PF_NPEnumResource pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "uint*", IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "uint*", IntPtr, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
