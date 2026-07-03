#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICProgressOperation.ahk" { WICProgressOperation }

/**
 * Application defined callback function called when codec component progress is made.
 * @remarks
 * An operation can be canceled by returning <c>WINCODEC_ERR_ABORTED</c>.
 * 
 * To register your callback function, query the encoder or decoder for the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapcodecprogressnotification">IWICBitmapCodecProgressNotification</a> interface and call <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapcodecprogressnotification-registerprogressnotification">RegisterProgressNotification</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nc-wincodec-pfnprogressnotification
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct PFNProgressNotification {
    value : IntPtr

    __value {
        set {
            if (value is PFNProgressNotification) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvData Type: <b>LPVOID</b>
     * 
     * Component data passed to the callback function.
     * @param {Integer} uFrameNum Type: <b>ULONG</b>
     * 
     * The current frame number.
     * @param {WICProgressOperation} operation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicprogressoperation">WICProgressOperation</a></b>
     * 
     * The current operation the component is in.
     * @param {Float} dblProgress Type: <b>double</b>
     * 
     * The progress value. The range is 0.0 to 1.0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(pvData, uFrameNum, operation, dblProgress) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvDataMarshal, pvData, UInt32, uFrameNum, WICProgressOperation, operation, Float64, dblProgress, "HRESULT")
        return result
    }

    /**
     * A PFNProgressNotification that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNProgressNotification {
        /**
         * Creates a PFNProgressNotification pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, WICProgressOperation, Float64) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, WICProgressOperation, Float64, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
