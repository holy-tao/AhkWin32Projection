#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DTT_CALLBACK_PROC {
    value : IntPtr

    __value {
        set {
            if (value is DTT_CALLBACK_PROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDC} _hdc 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @param {Pointer<RECT>} prc 
     * @param {Integer} dwFlags 
     * @param {LPARAM} _lParam 
     * @returns {Integer} 
     */
    Call(_hdc, pszText, cchText, prc, dwFlags, _lParam) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall(this.value, HDC, _hdc, "ptr", pszText, Int32, cchText, RECT.Ptr, prc, UInt32, dwFlags, LPARAM, _lParam, Int32)
        return result
    }

    /**
     * A DTT_CALLBACK_PROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DTT_CALLBACK_PROC {
        /**
         * Creates a DTT_CALLBACK_PROC pointer that invokes the given AHK function when called.
         * @param {Func(HDC, PWSTR, Int32, RECT, UInt32, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDC, PWSTR, Int32, RECT.Ptr, UInt32, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
