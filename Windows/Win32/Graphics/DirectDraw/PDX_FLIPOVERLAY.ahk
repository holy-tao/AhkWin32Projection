#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDFLIPOVERLAYINFO.ahk" { DDFLIPOVERLAYINFO }

/**
 * The DxFlipOverlay callback function is called when a client of the video miniport driver wants to flip the overlay or when autoflipping is enabled.
 * @remarks
 * If a hardware video port is not used and the client still wants the overlay to bob the data, the <b>dwFlags</b> member of the DDFLIPOVERLAYINFO structure at <i>FlipOverlayInfo</i> specifies the polarity of the data in the field being flipped (using the DDFLIP_EVEN or DDFLIP_ODD flags). These flags are not used when flipping a surface that is fed by a hardware video port.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_flipoverlay
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_FLIPOVERLAY {
    value : IntPtr

    __value {
        set {
            if (value is PDX_FLIPOVERLAY) {
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
     * @param {Pointer<DDFLIPOVERLAYINFO>} param1 Points to the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddflipoverlayinfo">DDFLIPOVERLAYINFO</a> structure that contains the flip information for the surface.
     * @param {Pointer<Void>} param2 Reserved for system use.
     * @returns {Integer} <i>DxFlipOverlay</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDFLIPOVERLAYINFO.Ptr, param1, param2Marshal, param2, UInt32)
        return result
    }

    /**
     * A PDX_FLIPOVERLAY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_FLIPOVERLAY {
        /**
         * Creates a PDX_FLIPOVERLAY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDFLIPOVERLAYINFO, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDFLIPOVERLAYINFO.Ptr, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
