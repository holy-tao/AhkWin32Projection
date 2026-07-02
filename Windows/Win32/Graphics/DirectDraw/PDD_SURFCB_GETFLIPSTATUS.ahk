#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETFLIPSTATUSDATA.ahk" { DD_GETFLIPSTATUSDATA }

/**
 * The DdGetFlipStatus callback function determines whether the most recently requested flip on a surface has occurred.
 * @remarks
 * The driver should report its flip status based on the flag set in the <b>dwFlags</b> member of the structure that <b>lpGetFlipStatus</b> points to as follows:
 * 
 * <ul>
 * <li>
 * If the flag is DDGFS_CANFLIP, the driver should determine whether the surface is currently involved in a flip. If a flip or a blit is not in progress and if the hardware is otherwise capable of currently accepting a flip request, the driver should return DD_OK in <b>ddRVal</b>. If a flip is in progress or if the hardware cannot currently accept a flip request, the driver should set <b>ddRVal</b> to DDERR_WASSTILLDRAWING.
 * 
 * </li>
 * <li>
 * If the flag is DDGFS_ISFLIPDONE, the driver should set <b>ddRVal</b> to DDERR_WASSTILLDRAWING if a flip is currently in progress; otherwise it should return DD_OK.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_getflipstatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_GETFLIPSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_GETFLIPSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETFLIPSTATUSDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getflipstatusdata">DD_GETFLIPSTATUSDATA</a> structure that contains the information required to perform the flip status query.
     * @returns {Integer} <b>DdGetFlipStatus</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETFLIPSTATUSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_GETFLIPSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_GETFLIPSTATUS {
        /**
         * Creates a PDD_SURFCB_GETFLIPSTATUS pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETFLIPSTATUSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETFLIPSTATUSDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
