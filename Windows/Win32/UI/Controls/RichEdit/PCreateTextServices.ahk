#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITextHost.ahk" { ITextHost }

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PCreateTextServices {
    value : IntPtr

    __value {
        set {
            if (value is PCreateTextServices) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} punkOuter 
     * @param {ITextHost} pITextHost 
     * @returns {IUnknown} 
     */
    Call(punkOuter, pITextHost) {
        result := DllCall(this.value, "ptr", punkOuter, "ptr", pITextHost, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * A PCreateTextServices that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCreateTextServices {
        /**
         * Creates a PCreateTextServices pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
