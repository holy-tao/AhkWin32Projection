#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDGETCURRENTAUTOFLIPININFO.ahk" { DDGETCURRENTAUTOFLIPININFO }
#Import ".\DDGETCURRENTAUTOFLIPOUTINFO.ahk" { DDGETCURRENTAUTOFLIPOUTINFO }

/**
 * The DxGetCurrentAutoflip callback function is called when the device is hardware autoflipping and a client of the video miniport driver wants to know which surface is receiving the current field of video data for capture purposes.
 * @remarks
 * The <i>DxGetCurrentAutoflip</i> function returns the current index in the autoflip chain of the current surface in the <b>dwSurfaceIndex</b> member of the DDGETCURRENTAUTOFLIPOUTINFO structure at <i>GetCurrentAutoflipOutInfo</i>.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_getcurrentautoflip
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_GETCURRENTAUTOFLIP {
    value : IntPtr

    __value {
        set {
            if (value is PDX_GETCURRENTAUTOFLIP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 Points to the miniport driver's device extension.
     * @param {Pointer<DDGETCURRENTAUTOFLIPININFO>} param1 Points to the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetcurrentautoflipininfo">DDGETCURRENTAUTOFLIPININFO</a> structure that contains the VPE object information.
     * @param {Pointer<DDGETCURRENTAUTOFLIPOUTINFO>} param2 Points to the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetcurrentautoflipoutinfo">DDGETCURRENTAUTOFLIPOUTINFO</a> structure that contains the surface information.
     * @returns {Integer} <i>DxGetCurrentAutoflip</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDGETCURRENTAUTOFLIPININFO.Ptr, param1, DDGETCURRENTAUTOFLIPOUTINFO.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PDX_GETCURRENTAUTOFLIP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_GETCURRENTAUTOFLIP {
        /**
         * Creates a PDX_GETCURRENTAUTOFLIP pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDGETCURRENTAUTOFLIPININFO, DDGETCURRENTAUTOFLIPOUTINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDGETCURRENTAUTOFLIPININFO.Ptr, DDGETCURRENTAUTOFLIPOUTINFO.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
