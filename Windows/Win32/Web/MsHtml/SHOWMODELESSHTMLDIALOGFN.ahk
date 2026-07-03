#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct SHOWMODELESSHTMLDIALOGFN {
    value : IntPtr

    __value {
        set {
            if (value is SHOWMODELESSHTMLDIALOGFN) {
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
     * @param {Pointer<VARIANT>} pvarOptions 
     * @returns {IHTMLWindow2} 
     */
    Call(hwndParent, pmk, pvarArgIn, pvarOptions) {
        result := DllCall(this.value, HWND, hwndParent, "ptr", pmk, VARIANT.Ptr, pvarArgIn, VARIANT.Ptr, pvarOptions, "ptr*", &ppWindow := 0, "HRESULT")
        return IHTMLWindow2(ppWindow)
    }

    /**
     * A SHOWMODELESSHTMLDIALOGFN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SHOWMODELESSHTMLDIALOGFN {
        /**
         * Creates a SHOWMODELESSHTMLDIALOGFN pointer that invokes the given AHK function when called.
         * @param {Func(HWND, "ptr", VARIANT, VARIANT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, "ptr", VARIANT.Ptr, VARIANT.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
