#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETMOCOMPCOMPBUFFDATA.ahk" { DD_GETMOCOMPCOMPBUFFDATA }

/**
 * The DDMoCompGetBuffInfo callback function allows the driver to specify how many interim surfaces are required to support the specified GUID, and the size, location, and format of each of these surfaces.
 * @remarks
 * <b>DDMoCompGetBuffInfo</b> can be optionally implemented in DirectDraw drivers. This function is required for motion compensation support.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_getcompbuffinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_GETCOMPBUFFINFO {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_GETCOMPBUFFINFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETMOCOMPCOMPBUFFDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getmocompcompbuffdata">DD_GETMOCOMPCOMPBUFFDATA</a> structure that contains the compressed buffer information.
     * @returns {Integer} <b>DDMoCompGetBuffInfo</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETMOCOMPCOMPBUFFDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_GETCOMPBUFFINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_GETCOMPBUFFINFO {
        /**
         * Creates a PDD_MOCOMPCB_GETCOMPBUFFINFO pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETMOCOMPCOMPBUFFDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETMOCOMPCOMPBUFFDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
