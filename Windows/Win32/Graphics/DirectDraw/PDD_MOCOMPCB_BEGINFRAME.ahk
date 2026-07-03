#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_BEGINMOCOMPFRAMEDATA.ahk" { DD_BEGINMOCOMPFRAMEDATA }

/**
 * The DdMoCompBeginFrame callback function starts decoding a new frame.
 * @remarks
 * DirectDraw drivers that support motion compensation must implement <b>DdMoCompBeginFrame</b>.
 * 
 * DirectDraw ensures that begin and end frames will be properly paired.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_beginframe
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_BEGINFRAME {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_BEGINFRAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_BEGINMOCOMPFRAMEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_beginmocompframedata">DD_BEGINMOCOMPFRAMEDATA</a> structure that contains the information needed to start decoding a new frame.
     * @returns {Integer} <b>DdMoCompBeginFrame</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_BEGINMOCOMPFRAMEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_BEGINFRAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_BEGINFRAME {
        /**
         * Creates a PDD_MOCOMPCB_BEGINFRAME pointer that invokes the given AHK function when called.
         * @param {Func(DD_BEGINMOCOMPFRAMEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_BEGINMOCOMPFRAMEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
