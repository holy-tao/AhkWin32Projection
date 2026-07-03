#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDFLIPVIDEOPORTINFO.ahk" { DDFLIPVIDEOPORTINFO }

/**
 * The DxFlipVideoPort callback function is called when a client of the video miniport driver wants to flip the video port extensions (VPE) object or when autoflipping is enabled.
 * @remarks
 * The <b>dwFlipVPFlags</b> member of the DDFLIPVIDEOPORTINFO structure at <i>FlipVideoPortInfo</i> uses the DDVPFLIP_VIDEO or DDVPFLIP_VBI flag to indicate whether the surfaces represent VBI surfaces or regular surfaces.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_flipvideoport
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_FLIPVIDEOPORT {
    value : IntPtr

    __value {
        set {
            if (value is PDX_FLIPVIDEOPORT) {
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
     * @param {Pointer<DDFLIPVIDEOPORTINFO>} param1 Points to the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddflipvideoportinfo">DDFLIPVIDEOPORTINFO</a> structure that contains the flip information for the surface and VPE object.
     * @param {Pointer<Void>} param2 Reserved for system use.
     * @returns {Integer} <i>DxFlipVideoPort</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDFLIPVIDEOPORTINFO.Ptr, param1, param2Marshal, param2, UInt32)
        return result
    }

    /**
     * A PDX_FLIPVIDEOPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_FLIPVIDEOPORT {
        /**
         * Creates a PDX_FLIPVIDEOPORT pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDFLIPVIDEOPORTINFO, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDFLIPVIDEOPORTINFO.Ptr, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
