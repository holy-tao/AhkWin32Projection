#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETBLTSTATUSDATA.ahk" { DD_GETBLTSTATUSDATA }

/**
 * The DdGetBltStatus callback function queries the blit status of the specified surface.
 * @remarks
 * The blit status that the driver returns is based on the <b>dwFlags</b> member of the structure that <i>lpGetBltStatus</i> points to, as follows:
 * 
 * <ul>
 * <li>
 * If the flag is DDGBS_CANBLT, the driver should determine whether the surface is currently involved in a flip. If a flip is not in progress and if the hardware is otherwise capable of currently accepting a blit request, the driver should return DD_OK in the <b>ddRVal</b> member of the structure that <i>lpGetBltStatus</i> points to. If a flip is in progress or if the hardware cannot currently accept another blit request, the driver should set the <b>ddRVal</b> member to DDERR_WASSTILLDRAWING.
 * 
 * </li>
 * <li>
 * If the flag is DDGBS_ISBLTDONE, the driver should set <b>ddRVal</b> to DDERR_WASSTILLDRAWING if a blit is currently in progress; otherwise it should return DD_OK.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_getbltstatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_GETBLTSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_GETBLTSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETBLTSTATUSDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getbltstatusdata">DD_GETBLTSTATUSDATA</a> structure that contains the information required to perform the blit status query.
     * @returns {Integer} <b>DdGetBltStatus</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETBLTSTATUSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_GETBLTSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_GETBLTSTATUS {
        /**
         * Creates a PDD_SURFCB_GETBLTSTATUS pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETBLTSTATUSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETBLTSTATUSDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
