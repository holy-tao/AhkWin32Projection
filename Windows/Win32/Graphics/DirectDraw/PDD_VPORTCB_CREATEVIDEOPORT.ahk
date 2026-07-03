#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_CREATEVPORTDATA.ahk" { DD_CREATEVPORTDATA }

/**
 * The DdVideoPortCreate callback function notifies the driver that DirectDraw has created a VPE object.
 * @remarks
 * <b>DdVideoPortCreate</b> can be optionally implemented in DirectDraw drivers that support VPE.
 * 
 * <b>DdVideoPortCreate</b> can allocate memory for and initialize any private, VPE object-specific data. The driver can use the <b>dwReserved1</b> and <b>dwReserved2</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure to store this data. This DD_VIDEOPORT_LOCAL structure is at the <b>lpVideoPort</b> member of the DD_CREATEVPORTDATA structure at <i>lpCreateVideoPort</i>. The driver cannot use or change any other members of the DD_VIDEOPORT_LOCAL structure.
 * 
 * If the hardware video port is implemented to use the feature connector, the driver might need to initialize the feature connector for hardware video port use.
 * 
 * <b>DdVideoPortCreate</b> should not turn the hardware video port on. This is accomplished in <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_createvideoport
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_CREATEVIDEOPORT {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_CREATEVIDEOPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_CREATEVPORTDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_createvportdata">DD_CREATEVPORTDATA</a> structure that describes the created VPE object.
     * @returns {Integer} <b>DdVideoPortCreate</b> returns one of the following values:
     */
    Call(param0) {
        result := DllCall(this.value, DD_CREATEVPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_CREATEVIDEOPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_CREATEVIDEOPORT {
        /**
         * Creates a PDD_VPORTCB_CREATEVIDEOPORT pointer that invokes the given AHK function when called.
         * @param {Func(DD_CREATEVPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_CREATEVPORTDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
