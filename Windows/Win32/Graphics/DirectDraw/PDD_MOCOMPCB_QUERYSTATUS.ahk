#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_QUERYMOCOMPSTATUSDATA.ahk" { DD_QUERYMOCOMPSTATUSDATA }

/**
 * The DdMoCompQueryStatus callback function queries the status of the most recent rendering operation to the specified surface.
 * @remarks
 * DirectDraw drivers that support motion compensation must implement <b>DdMoCompQueryStatus</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_querystatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_QUERYSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_QUERYSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_QUERYMOCOMPSTATUSDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_querymocompstatusdata">DD_QUERYMOCOMPSTATUSDATA</a> structure that contains the information needed to query the status.
     * @returns {Integer} <b>DdMoCompQueryStatus</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_QUERYMOCOMPSTATUSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_QUERYSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_QUERYSTATUS {
        /**
         * Creates a PDD_MOCOMPCB_QUERYSTATUS pointer that invokes the given AHK function when called.
         * @param {Func(DD_QUERYMOCOMPSTATUSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_QUERYMOCOMPSTATUSDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
