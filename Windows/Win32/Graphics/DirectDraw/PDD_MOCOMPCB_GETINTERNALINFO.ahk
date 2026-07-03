#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETINTERNALMOCOMPDATA.ahk" { DD_GETINTERNALMOCOMPDATA }

/**
 * The DdMoCompGetInternalInfo callback function allows the driver to report that it internally allocates display memory to perform motion compensation.
 * @remarks
 * DirectDraw drivers that support motion compensation must implement <b>DdMoCompGetInternalInfo</b>.
 * 
 * This function allows the decoder and DirectShow to make better-informed decisions regarding what GUID to choose.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_getinternalinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_GETINTERNALINFO {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_GETINTERNALINFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETINTERNALMOCOMPDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getinternalmocompdata">DD_GETINTERNALMOCOMPDATA</a> structure that contains the internal memory requirements.
     * @returns {Integer} <b>DdMoCompGetInternalInfo</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETINTERNALMOCOMPDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_GETINTERNALINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_GETINTERNALINFO {
        /**
         * Creates a PDD_MOCOMPCB_GETINTERNALINFO pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETINTERNALMOCOMPDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETINTERNALMOCOMPDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
