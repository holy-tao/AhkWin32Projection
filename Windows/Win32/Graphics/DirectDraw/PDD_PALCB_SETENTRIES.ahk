#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SETENTRIESDATA.ahk" { DD_SETENTRIESDATA }

/**
 * The DdSetEntries callback function updates the palette entries in the specified palette.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_palcb_setentries
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_PALCB_SETENTRIES {
    value : IntPtr

    __value {
        set {
            if (value is PDD_PALCB_SETENTRIES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_SETENTRIESDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_setentriesdata">DD_SETENTRIESDATA</a> structure that contains the information required to set the palette's entries.
     * @returns {Integer} <i>DdSetEntries</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_SETENTRIESDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_PALCB_SETENTRIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_PALCB_SETENTRIES {
        /**
         * Creates a PDD_PALCB_SETENTRIES pointer that invokes the given AHK function when called.
         * @param {Func(DD_SETENTRIESDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_SETENTRIESDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
