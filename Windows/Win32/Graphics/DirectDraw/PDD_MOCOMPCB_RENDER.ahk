#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_RENDERMOCOMPDATA.ahk" { DD_RENDERMOCOMPDATA }

/**
 * The DdMoCompRender callback function tells the driver what macroblocks to render by specifying the surfaces containing the macroblocks, the offsets in each surface where the macroblocks exist, and the size of the macroblock data to be rendered.
 * @remarks
 * DirectDraw drivers that support motion compensation must implement <b>DdMoCompRender</b>.
 * 
 * <b>DdMoCompRender</b> can be called multiple times between the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_beginframe">DdMoCompBeginFrame</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_endframe">DdMoCompEndFrame</a> sequence.
 * 
 * If a previous render operation is not yet finished, the driver should fail the call by setting the <b>ddRVal</b> member of the DD_RENDERMOCOMPDATA structure at <i>lpRenderData</i> to DDERR_WASSTILLDRAWING and returning DDHAL_DRIVER_HANDLED.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_render
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_RENDER {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_RENDER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_RENDERMOCOMPDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_rendermocompdata">DD_RENDERMOCOMPDATA</a> structure that contains the information needed to render a frame.
     * @returns {Integer} <b>DdMoCompRender</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_RENDERMOCOMPDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_RENDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_RENDER {
        /**
         * Creates a PDD_MOCOMPCB_RENDER pointer that invokes the given AHK function when called.
         * @param {Func(DD_RENDERMOCOMPDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_RENDERMOCOMPDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
