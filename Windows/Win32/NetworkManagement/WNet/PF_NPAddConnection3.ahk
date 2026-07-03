#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NETRESOURCEW.ahk" { NETRESOURCEW }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPAddConnection3 {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPAddConnection3) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {PWSTR} lpPassword 
     * @param {PWSTR} lpUserName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(hwndOwner, lpNetResource, lpPassword, lpUserName, dwFlags) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        result := DllCall(this.value, HWND, hwndOwner, NETRESOURCEW.Ptr, lpNetResource, "ptr", lpPassword, "ptr", lpUserName, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PF_NPAddConnection3 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPAddConnection3 {
        /**
         * Creates a PF_NPAddConnection3 pointer that invokes the given AHK function when called.
         * @param {Func(HWND, NETRESOURCEW, PWSTR, PWSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, NETRESOURCEW.Ptr, PWSTR, PWSTR, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
