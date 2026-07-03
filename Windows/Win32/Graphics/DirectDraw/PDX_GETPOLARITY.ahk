#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDGETPOLARITYININFO.ahk" { DDGETPOLARITYININFO }
#Import ".\DDGETPOLARITYOUTINFO.ahk" { DDGETPOLARITYOUTINFO }

/**
 * The DxGetPolarity callback function returns the polarity (even or odd) of the current field being written by the video port extensions (VPE) object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetpolarityininfo">DDGETPOLARITYININFO</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetpolarityoutinfo">DDGETPOLARITYOUTINFO</a> structures contain VPE object information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_getpolarity
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_GETPOLARITY {
    value : IntPtr

    __value {
        set {
            if (value is PDX_GETPOLARITY) {
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
     * @param {Pointer<DDGETPOLARITYININFO>} param1 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetpolarityininfo">DDGETPOLARITYININFO</a> structure that contains the VPE object from which to get the polarity information.
     * @param {Pointer<DDGETPOLARITYOUTINFO>} param2 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetpolarityoutinfo">DDGETPOLARITYOUTINFO</a> structure that contains the polarity information for the specified VPE object.
     * @returns {Integer} <i>DxGetPolarity</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDGETPOLARITYININFO.Ptr, param1, DDGETPOLARITYOUTINFO.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PDX_GETPOLARITY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_GETPOLARITY {
        /**
         * Creates a PDX_GETPOLARITY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDGETPOLARITYININFO, DDGETPOLARITYOUTINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDGETPOLARITYININFO.Ptr, DDGETPOLARITYOUTINFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
