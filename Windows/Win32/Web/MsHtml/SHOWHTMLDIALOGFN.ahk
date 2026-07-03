#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct SHOWHTMLDIALOGFN {
    value : IntPtr

    __value {
        set {
            if (value is SHOWHTMLDIALOGFN) {
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
     * @param {IMoniker} pmk 
     * @param {Pointer<VARIANT>} pvarArgIn 
     * @param {PWSTR} pchOptions 
     * @param {Pointer<VARIANT>} pvArgOut 
     * @returns {HRESULT} 
     */
    Call(hwndParent, pmk, pvarArgIn, pchOptions, pvArgOut) {
        pchOptions := pchOptions is String ? StrPtr(pchOptions) : pchOptions

        result := DllCall(this.value, HWND, hwndParent, "ptr", pmk, VARIANT.Ptr, pvarArgIn, "ptr", pchOptions, VARIANT.Ptr, pvArgOut, "HRESULT")
        return result
    }

    /**
     * A SHOWHTMLDIALOGFN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SHOWHTMLDIALOGFN {
        /**
         * Creates a SHOWHTMLDIALOGFN pointer that invokes the given AHK function when called.
         * @param {Func(HWND, "ptr", VARIANT, PWSTR, VARIANT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, "ptr", VARIANT.Ptr, PWSTR, VARIANT.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
