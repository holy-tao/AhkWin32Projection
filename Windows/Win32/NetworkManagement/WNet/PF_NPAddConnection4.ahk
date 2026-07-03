#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NETRESOURCEW.ahk" { NETRESOURCEW }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPAddConnection4 {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPAddConnection4) {
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
     * @param {Integer} lpAuthBuffer 
     * @param {Integer} cbAuthBuffer 
     * @param {Integer} dwFlags 
     * @param {Integer} lpUseOptions 
     * @param {Integer} cbUseOptions 
     * @returns {Integer} 
     */
    Call(hwndOwner, lpNetResource, lpAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions) {
        result := DllCall(this.value, HWND, hwndOwner, NETRESOURCEW.Ptr, lpNetResource, IntPtr, lpAuthBuffer, UInt32, cbAuthBuffer, UInt32, dwFlags, IntPtr, lpUseOptions, UInt32, cbUseOptions, UInt32)
        return result
    }

    /**
     * A PF_NPAddConnection4 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPAddConnection4 {
        /**
         * Creates a PF_NPAddConnection4 pointer that invokes the given AHK function when called.
         * @param {Func(HWND, NETRESOURCEW, IntPtr, UInt32, UInt32, IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, NETRESOURCEW.Ptr, IntPtr, UInt32, UInt32, IntPtr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
