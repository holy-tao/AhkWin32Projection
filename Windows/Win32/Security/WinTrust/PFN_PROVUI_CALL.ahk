#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_PROVUI_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PROVUI_CALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hWndSecurityDialog 
     * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData 
     * @returns {BOOL} 
     */
    Call(hWndSecurityDialog, pProvData) {
        result := DllCall(this.value, HWND, hWndSecurityDialog, CRYPT_PROVIDER_DATA.Ptr, pProvData, BOOL)
        return result
    }

    /**
     * A PFN_PROVUI_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PROVUI_CALL {
        /**
         * Creates a PFN_PROVUI_CALL pointer that invokes the given AHK function when called.
         * @param {Func(HWND, CRYPT_PROVIDER_DATA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, CRYPT_PROVIDER_DATA.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
