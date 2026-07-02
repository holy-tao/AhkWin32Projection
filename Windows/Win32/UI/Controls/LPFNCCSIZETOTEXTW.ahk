#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Graphics\Gdi\HFONT.ahk" { HFONT }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct LPFNCCSIZETOTEXTW {
    value : IntPtr

    __value {
        set {
            if (value is LPFNCCSIZETOTEXTW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} flStyle 
     * @param {Integer} flExtStyle 
     * @param {HFONT} _hfont 
     * @param {PWSTR} pszText 
     * @returns {Integer} 
     */
    Call(flStyle, flExtStyle, _hfont, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall(this.value, UInt32, flStyle, UInt32, flExtStyle, HFONT, _hfont, "ptr", pszText, Int32)
        return result
    }

    /**
     * A LPFNCCSIZETOTEXTW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNCCSIZETOTEXTW {
        /**
         * Creates a LPFNCCSIZETOTEXTW pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, HFONT, PWSTR) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, HFONT, PWSTR, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
