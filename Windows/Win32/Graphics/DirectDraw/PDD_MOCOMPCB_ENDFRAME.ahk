#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_ENDMOCOMPFRAMEDATA.ahk" { DD_ENDMOCOMPFRAMEDATA }

/**
 * The DdMoCompEndFrame callback function completes a decoded frame.
 * @remarks
 * DirectDraw drivers that support motion compensation must implement <b>DdMoCompEndFrame</b>.
 * 
 * DirectDraw ensures that begin and end frames will be properly paired.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_endframe
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_ENDFRAME {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_ENDFRAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_ENDMOCOMPFRAMEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_endmocompframedata">DD_ENDMOCOMPFRAMEDATA</a> structure that contains the information needed to complete the decoded frame.
     * @returns {Integer} <b>DdMoCompEndFrame</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_ENDMOCOMPFRAMEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_ENDFRAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_ENDFRAME {
        /**
         * Creates a PDD_MOCOMPCB_ENDFRAME pointer that invokes the given AHK function when called.
         * @param {Func(DD_ENDMOCOMPFRAMEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_ENDMOCOMPFRAMEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
