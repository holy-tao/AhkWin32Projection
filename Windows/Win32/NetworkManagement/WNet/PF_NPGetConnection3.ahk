#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetConnection3 {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetConnection3) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpLocalName 
     * @param {Integer} dwLevel 
     * @param {Integer} lpBuffer 
     * @param {Pointer<Integer>} lpBufferSize 
     * @returns {Integer} 
     */
    Call(lpLocalName, dwLevel, lpBuffer, lpBufferSize) {
        lpLocalName := lpLocalName is String ? StrPtr(lpLocalName) : lpLocalName

        lpBufferSizeMarshal := lpBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpLocalName, UInt32, dwLevel, IntPtr, lpBuffer, lpBufferSizeMarshal, lpBufferSize, UInt32)
        return result
    }

    /**
     * A PF_NPGetConnection3 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetConnection3 {
        /**
         * Creates a PF_NPGetConnection3 pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, IntPtr, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
