#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Graphics\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }
#Import ".\IPdfRendererNative.ahk" { IPdfRendererNative }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.WinRT.Pdf
 */
export default struct PFN_PDF_CREATE_RENDERER {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PDF_CREATE_RENDERER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDXGIDevice} param0 
     * @returns {IPdfRendererNative} 
     */
    Call(param0) {
        result := DllCall(this.value, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IPdfRendererNative(param1)
    }

    /**
     * A PFN_PDF_CREATE_RENDERER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PDF_CREATE_RENDERER {
        /**
         * Creates a PFN_PDF_CREATE_RENDERER pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
