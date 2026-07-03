#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_CANCREATEVPORTDATA.ahk" { DD_CANCREATEVPORTDATA }

/**
 * The DdVideoPortCanCreate callback function determines whether the driver can support a DirectDraw VPE object of the specified description.
 * @remarks
 * <i>DdVideoPortCanCreate</i> must be implemented in drivers that support VPE.
 * 
 * The driver should check the members of the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportdesc">DDVIDEOPORTDESC</a> structure to which the <b>lpDDVideoPortDesc</b> member of the DD_CANCREATEVPORTDATA structure at <i>lpCanCreateVideoPort</i> points to determine whether the hardware supports the specified type of VPE object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_cancreatevideoport
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_CANCREATEVIDEOPORT {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_CANCREATEVIDEOPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_CANCREATEVPORTDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_cancreatevportdata">DD_CANCREATEVPORTDATA</a> structure that contains the information necessary for the driver to determine whether the specified DirectDraw VPE object can be supported.
     * @returns {Integer} <i>DdVideoPortCanCreate</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_CANCREATEVPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_CANCREATEVIDEOPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_CANCREATEVIDEOPORT {
        /**
         * Creates a PDD_VPORTCB_CANCREATEVIDEOPORT pointer that invokes the given AHK function when called.
         * @param {Func(DD_CANCREATEVPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_CANCREATEVPORTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
