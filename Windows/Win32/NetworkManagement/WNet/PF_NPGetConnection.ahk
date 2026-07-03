#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetConnection {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetConnection) {
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
     * @param {PWSTR} lpRemoteName 
     * @param {Pointer<Integer>} lpnBufferLen 
     * @returns {Integer} 
     */
    Call(lpLocalName, lpRemoteName, lpnBufferLen) {
        lpLocalName := lpLocalName is String ? StrPtr(lpLocalName) : lpLocalName
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName

        lpnBufferLenMarshal := lpnBufferLen is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpLocalName, "ptr", lpRemoteName, lpnBufferLenMarshal, lpnBufferLen, UInt32)
        return result
    }

    /**
     * A PF_NPGetConnection that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetConnection {
        /**
         * Creates a PF_NPGetConnection pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
