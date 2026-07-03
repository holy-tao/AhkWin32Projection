#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_ADDATTACHEDSURFACEDATA.ahk" { DD_ADDATTACHEDSURFACEDATA }

/**
 * The DdAddAttachedSurface callback function attaches a surface to another surface.
 * @remarks
 * <b>DdAddAttachedSurface</b> can be optionally implemented in DirectDraw drivers.
 * 
 * The driver should update any internal surface state it keeps to reflect the attachment.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_addattachedsurface
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_ADDATTACHEDSURFACE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_ADDATTACHEDSURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_ADDATTACHEDSURFACEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_addattachedsurfacedata">DD_ADDATTACHEDSURFACEDATA</a> structure that contains information required for the driver to perform the attachment.
     * @returns {Integer} <b>DdAddAttachedSurface</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_ADDATTACHEDSURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_ADDATTACHEDSURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_ADDATTACHEDSURFACE {
        /**
         * Creates a PDD_SURFCB_ADDATTACHEDSURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DD_ADDATTACHEDSURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_ADDATTACHEDSURFACEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
