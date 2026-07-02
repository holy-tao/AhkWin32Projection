#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetUniversalName {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetUniversalName) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpLocalPath 
     * @param {Integer} dwInfoLevel 
     * @param {Integer} lpBuffer 
     * @param {Pointer<Integer>} lpnBufferSize 
     * @returns {Integer} 
     */
    Call(lpLocalPath, dwInfoLevel, lpBuffer, lpnBufferSize) {
        lpLocalPath := lpLocalPath is String ? StrPtr(lpLocalPath) : lpLocalPath

        lpnBufferSizeMarshal := lpnBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpLocalPath, UInt32, dwInfoLevel, IntPtr, lpBuffer, lpnBufferSizeMarshal, lpnBufferSize, UInt32)
        return result
    }

    /**
     * A PF_NPGetUniversalName that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetUniversalName {
        /**
         * Creates a PF_NPGetUniversalName pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, IntPtr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
