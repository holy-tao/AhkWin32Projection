#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetPersistentUseOptionsForConnection {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetPersistentUseOptionsForConnection) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpRemotePath 
     * @param {Integer} lpReadUseOptions 
     * @param {Integer} cbReadUseOptions 
     * @param {Integer} lpWriteUseOptions 
     * @param {Pointer<Integer>} lpSizeWriteUseOptions 
     * @returns {Integer} 
     */
    Call(lpRemotePath, lpReadUseOptions, cbReadUseOptions, lpWriteUseOptions, lpSizeWriteUseOptions) {
        lpRemotePath := lpRemotePath is String ? StrPtr(lpRemotePath) : lpRemotePath

        lpSizeWriteUseOptionsMarshal := lpSizeWriteUseOptions is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpRemotePath, IntPtr, lpReadUseOptions, UInt32, cbReadUseOptions, IntPtr, lpWriteUseOptions, lpSizeWriteUseOptionsMarshal, lpSizeWriteUseOptions, UInt32)
        return result
    }

    /**
     * A PF_NPGetPersistentUseOptionsForConnection that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetPersistentUseOptionsForConnection {
        /**
         * Creates a PF_NPGetPersistentUseOptionsForConnection pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, IntPtr, UInt32, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, IntPtr, UInt32, IntPtr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
