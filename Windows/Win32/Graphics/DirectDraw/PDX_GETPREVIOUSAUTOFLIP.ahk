#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDGETPREVIOUSAUTOFLIPININFO.ahk" { DDGETPREVIOUSAUTOFLIPININFO }
#Import ".\DDGETPREVIOUSAUTOFLIPOUTINFO.ahk" { DDGETPREVIOUSAUTOFLIPOUTINFO }

/**
 * The DxGetPreviousAutoflip callback function is called when the device is hardware autoflipping and a client of the video miniport driver wants to know which surface received the previous field of video data for capture purposes.
 * @remarks
 * If interleaving, the surface that received the previous field may be the same surface that is receiving the current field. 
 * 
 * <i>DxGetPreviousAutoflip</i> returns the index in the autoflip chain of the correct surface in the <b>dwSurfaceIndex</b> member of the DDGETPREVIOUSAUTOFLIPOUTINFO structure at <i>GetPreviousAutoflipOutInfo</i>.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_getpreviousautoflip
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_GETPREVIOUSAUTOFLIP {
    value : IntPtr

    __value {
        set {
            if (value is PDX_GETPREVIOUSAUTOFLIP) {
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
     * @param {Pointer<DDGETPREVIOUSAUTOFLIPININFO>} param1 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetpreviousautoflipininfo">DDGETPREVIOUSAUTOFLIPININFO</a> structure that contains the <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object information.
     * @param {Pointer<DDGETPREVIOUSAUTOFLIPOUTINFO>} param2 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetpreviousautoflipoutinfo">DDGETPREVIOUSAUTOFLIPOUTINFO</a> structure that contains the index of the autoflip chain.
     * @returns {Integer} <i>DxGetPreviousAutoflip</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDGETPREVIOUSAUTOFLIPININFO.Ptr, param1, DDGETPREVIOUSAUTOFLIPOUTINFO.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PDX_GETPREVIOUSAUTOFLIP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_GETPREVIOUSAUTOFLIP {
        /**
         * Creates a PDX_GETPREVIOUSAUTOFLIP pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDGETPREVIOUSAUTOFLIPININFO, DDGETPREVIOUSAUTOFLIPOUTINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDGETPREVIOUSAUTOFLIPININFO.Ptr, DDGETPREVIOUSAUTOFLIPOUTINFO.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
