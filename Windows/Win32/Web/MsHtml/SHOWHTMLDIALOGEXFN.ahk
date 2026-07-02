#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct SHOWHTMLDIALOGEXFN {
    value : IntPtr

    __value {
        set {
            if (value is SHOWHTMLDIALOGEXFN) {
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
     * @param {Integer} dwDialogFlags 
     * @param {Pointer<VARIANT>} pvarArgIn 
     * @param {PWSTR} pchOptions 
     * @param {Pointer<VARIANT>} pvArgOut 
     * @returns {HRESULT} 
     */
    Call(hwndParent, pmk, dwDialogFlags, pvarArgIn, pchOptions, pvArgOut) {
        pchOptions := pchOptions is String ? StrPtr(pchOptions) : pchOptions

        result := DllCall(this.value, HWND, hwndParent, "ptr", pmk, UInt32, dwDialogFlags, VARIANT.Ptr, pvarArgIn, "ptr", pchOptions, VARIANT.Ptr, pvArgOut, "HRESULT")
        return result
    }

    /**
     * A SHOWHTMLDIALOGEXFN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SHOWHTMLDIALOGEXFN {
        /**
         * Creates a SHOWHTMLDIALOGEXFN pointer that invokes the given AHK function when called.
         * @param {Func(HWND, "ptr", UInt32, VARIANT, PWSTR, VARIANT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, "ptr", UInt32, VARIANT.Ptr, PWSTR, VARIANT.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
