#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETVPORTSIGNALDATA.ahk" { DD_GETVPORTSIGNALDATA }

/**
 * The DdVideoPortGetSignalStatus callback function retrieves the status of the video signal currently being presented to the hardware video port.
 * @remarks
 * DirectDraw drivers that support VPE must implement <i>DdVideoPortGetSignalStatus</i>.
 * 
 * The driver should determine whether a valid signal is coming in to the hardware video port and report the result in the <b>dwStatus</b> member of the DD_GETVPORTSIGNALDATA structure at <i>lpGetSignalStatus</i>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_getsignalstatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETSIGNALSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETSIGNALSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETVPORTSIGNALDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportsignaldata">DD_GETVPORTSIGNALDATA</a> structure that contains the information required for the driver to retrieve the status of the video signal.
     * @returns {Integer} <i>DdVideoPortGetSignalStatus</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETVPORTSIGNALDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETSIGNALSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETSIGNALSTATUS {
        /**
         * Creates a PDD_VPORTCB_GETSIGNALSTATUS pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETVPORTSIGNALDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETVPORTSIGNALDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
