#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_CREATEMOCOMPDATA.ahk" { DD_CREATEMOCOMPDATA }

/**
 * The DdMoCompCreate callback function notifies the driver that a software decoder will start using motion compensation with the specified GUID.
 * @remarks
 * <i>DdMoCompCreate</i> can be optionally implemented in DirectDraw drivers. It is not required for motion compensation support.
 * 
 * <i>DdMoCompCreate</i> also reports the width, height, and format of the output frame. The driver can fail this call if it cannot support motion compensation with these dimensions.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_create
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_CREATE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_CREATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_CREATEMOCOMPDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_createmocompdata">DD_CREATEMOCOMPDATA</a> structure that contains the information required to begin using motion compensation.
     * @returns {Integer} <i>DdMoCompCreate</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_CREATEMOCOMPDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_CREATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_CREATE {
        /**
         * Creates a PDD_MOCOMPCB_CREATE pointer that invokes the given AHK function when called.
         * @param {Func(DD_CREATEMOCOMPDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_CREATEMOCOMPDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
