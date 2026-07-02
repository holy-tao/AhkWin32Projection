#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETMOCOMPGUIDSDATA.ahk" { DD_GETMOCOMPGUIDSDATA }

/**
 * The DdMoCompGetGuids callback function retrieves the number of GUIDs the driver supports.
 * @remarks
 * DirectDraw drivers that support motion compensation must implement <b>DdMoCompGetGuids</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_getguids
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_GETGUIDS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_GETGUIDS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETMOCOMPGUIDSDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getmocompguidsdata">DD_GETMOCOMPGUIDSDATA</a> structure that contains the GUID information.
     * @returns {Integer} <b>DdMoCompGetGuids</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETMOCOMPGUIDSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_GETGUIDS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_GETGUIDS {
        /**
         * Creates a PDD_MOCOMPCB_GETGUIDS pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETMOCOMPGUIDSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETMOCOMPGUIDSDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
