#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NETRESOURCEW.ahk" { NETRESOURCEW }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetResourceInformation {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetResourceInformation) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Integer} lpBuffer 
     * @param {Pointer<Integer>} lpBufferSize 
     * @param {Pointer<PWSTR>} lplpSystem 
     * @returns {Integer} 
     */
    Call(lpNetResource, lpBuffer, lpBufferSize, lplpSystem) {
        lpBufferSizeMarshal := lpBufferSize is VarRef ? "uint*" : "ptr"
        lplpSystemMarshal := lplpSystem is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, NETRESOURCEW.Ptr, lpNetResource, IntPtr, lpBuffer, lpBufferSizeMarshal, lpBufferSize, lplpSystemMarshal, lplpSystem, UInt32)
        return result
    }

    /**
     * A PF_NPGetResourceInformation that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetResourceInformation {
        /**
         * Creates a PF_NPGetResourceInformation pointer that invokes the given AHK function when called.
         * @param {Func(NETRESOURCEW, IntPtr, "uint*", PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NETRESOURCEW.Ptr, IntPtr, "uint*", PWSTR.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
