#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NETRESOURCEW.ahk" { NETRESOURCEW }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPSearchDialog {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPSearchDialog) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} lpnFlags 
     * @returns {Integer} 
     */
    Call(hwndParent, lpNetResource, lpBuffer, cbBuffer, lpnFlags) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        lpnFlagsMarshal := lpnFlags is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HWND, hwndParent, NETRESOURCEW.Ptr, lpNetResource, lpBufferMarshal, lpBuffer, UInt32, cbBuffer, lpnFlagsMarshal, lpnFlags, UInt32)
        return result
    }

    /**
     * A PF_NPSearchDialog that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPSearchDialog {
        /**
         * Creates a PF_NPSearchDialog pointer that invokes the given AHK function when called.
         * @param {Func(HWND, NETRESOURCEW, "ptr", UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, NETRESOURCEW.Ptr, "ptr", UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
