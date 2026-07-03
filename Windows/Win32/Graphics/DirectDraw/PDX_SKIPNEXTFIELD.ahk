#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSKIPNEXTFIELDINFO.ahk" { DDSKIPNEXTFIELDINFO }

/**
 * The DxSkipNextField callback function is called when the next field needs to be skipped or reenabled.
 * @remarks
 * If the <b>dwSkipFlags</b> member of the DDSKIPNEXTFIELDINFO structure at <i>SkipNextFieldInfo</i> is DDSKIP_SKIPNEXT, the following field should be skipped. If the vertical blanking interval (VBI) height is greater than zero, only the video data should be skipped (not the VBI data). If <b>dwSkipFlags</b> is set to DDSKIP_ENABLENEXT, the next field should be restored.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_skipnextfield
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_SKIPNEXTFIELD {
    value : IntPtr

    __value {
        set {
            if (value is PDX_SKIPNEXTFIELD) {
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
     * @param {Pointer<DDSKIPNEXTFIELDINFO>} param1 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddskipnextfieldinfo">DDSKIPNEXTFIELDINFO</a> structure that contains the skip information for the <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object.
     * @param {Pointer<Void>} param2 Reserved for system use.
     * @returns {Integer} <i>DxSkipNextField</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDSKIPNEXTFIELDINFO.Ptr, param1, param2Marshal, param2, UInt32)
        return result
    }

    /**
     * A PDX_SKIPNEXTFIELD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_SKIPNEXTFIELD {
        /**
         * Creates a PDX_SKIPNEXTFIELD pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDSKIPNEXTFIELDINFO, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDSKIPNEXTFIELDINFO.Ptr, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
