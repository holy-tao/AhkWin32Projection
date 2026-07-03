#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPFormatNetworkName {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPFormatNetworkName) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpRemoteName 
     * @param {PWSTR} lpFormattedName 
     * @param {Pointer<Integer>} lpnLength 
     * @param {Integer} dwFlags 
     * @param {Integer} dwAveCharPerLine 
     * @returns {Integer} 
     */
    Call(lpRemoteName, lpFormattedName, lpnLength, dwFlags, dwAveCharPerLine) {
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName
        lpFormattedName := lpFormattedName is String ? StrPtr(lpFormattedName) : lpFormattedName

        lpnLengthMarshal := lpnLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpRemoteName, "ptr", lpFormattedName, lpnLengthMarshal, lpnLength, UInt32, dwFlags, UInt32, dwAveCharPerLine, UInt32)
        return result
    }

    /**
     * A PF_NPFormatNetworkName that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPFormatNetworkName {
        /**
         * Creates a PF_NPFormatNetworkName pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "uint*", UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "uint*", UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
