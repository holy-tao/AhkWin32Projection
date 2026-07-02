#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETMOCOMPFORMATSDATA.ahk" { DD_GETMOCOMPFORMATSDATA }

/**
 * The DdMoCompGetFormats callback function indicates the uncompressed formats to which the hardware can decode the data.
 * @remarks
 * DirectDraw drivers that support motion compensation must implement <b>DdMoCompGetFormats</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_getformats
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_GETFORMATS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_GETFORMATS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETMOCOMPFORMATSDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getmocompformatsdata">DD_GETMOCOMPFORMATSDATA</a> structure that contains the uncompressed format information for the hardware.
     * @returns {Integer} <b>DdMoCompGetFormats</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETMOCOMPFORMATSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_GETFORMATS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_GETFORMATS {
        /**
         * Creates a PDD_MOCOMPCB_GETFORMATS pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETMOCOMPFORMATSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETMOCOMPFORMATSDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
