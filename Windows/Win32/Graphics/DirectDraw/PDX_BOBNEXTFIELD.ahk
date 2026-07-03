#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDBOBNEXTFIELDINFO.ahk" { DDBOBNEXTFIELDINFO }

/**
 * The DxBobNextField callback function bobs the next field of interleaved data.
 * @remarks
 * When data is interleaved, the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> function is called every other frame. This is insufficient for bob because it must be notified after every V-sync. The driver's <i>DxBobNextField</i> function is called when a V-sync does not cause a flip.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_bobnextfield
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_BOBNEXTFIELD {
    value : IntPtr

    __value {
        set {
            if (value is PDX_BOBNEXTFIELD) {
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
     * @param {Pointer<DDBOBNEXTFIELDINFO>} param1 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddbobnextfieldinfo">DDBOBNEXTFIELDINFO</a> structure that contains the bob information for the surface.
     * @param {Pointer<Void>} param2 Reserved for system use.
     * @returns {Integer} <i>DxBobNextField</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     * 
     * <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">DXERR_GENERIC</a>
     * 
     * <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">DXERR_OUTOFCAPS</a>
     * 
     * <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">DXERR_UNSUPPORTED</a>
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDBOBNEXTFIELDINFO.Ptr, param1, param2Marshal, param2, UInt32)
        return result
    }

    /**
     * A PDX_BOBNEXTFIELD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_BOBNEXTFIELD {
        /**
         * Creates a PDX_BOBNEXTFIELD pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDBOBNEXTFIELDINFO, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDBOBNEXTFIELDINFO.Ptr, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
