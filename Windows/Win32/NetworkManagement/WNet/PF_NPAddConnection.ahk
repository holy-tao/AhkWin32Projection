#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NETRESOURCEW.ahk" { NETRESOURCEW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPAddConnection {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPAddConnection) {
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
     * @param {PWSTR} lpPassword 
     * @param {PWSTR} lpUserName 
     * @returns {Integer} 
     */
    Call(lpNetResource, lpPassword, lpUserName) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        result := DllCall(this.value, NETRESOURCEW.Ptr, lpNetResource, "ptr", lpPassword, "ptr", lpUserName, UInt32)
        return result
    }

    /**
     * A PF_NPAddConnection that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPAddConnection {
        /**
         * Creates a PF_NPAddConnection pointer that invokes the given AHK function when called.
         * @param {Func(NETRESOURCEW, PWSTR, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NETRESOURCEW.Ptr, PWSTR, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
