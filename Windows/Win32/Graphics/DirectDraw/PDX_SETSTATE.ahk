#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSETSTATEININFO.ahk" { DDSETSTATEININFO }
#Import ".\DDSETSTATEOUTINFO.ahk" { DDSETSTATEOUTINFO }

/**
 * The DxSetState callback function is called when a client of the video miniport driver decides it wants to switch from bob mode to weave mode, and vice versa.
 * @remarks
 * The surface data passed contains the new state. If the new state is not supported, the video miniport driver should fail the call. 
 * 
 * If the new state requires the device to revert from hardware autoflipping to software autoflipping, the video miniport driver should set members of the DDSETSTATEOUTINFO structure at <i>SetStateOutInfo</i> as follows:
 * 
 * <ul>
 * <li>
 * The <b>dwSoftwareAutoflip</b> member equal to 1.
 * 
 * </li>
 * <li>
 * The <b>dwSurfaceIndex</b> member equal to the current position in the auto-flip list of the surface receiving hardware video port data.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_setstate
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_SETSTATE {
    value : IntPtr

    __value {
        set {
            if (value is PDX_SETSTATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 Points to the miniport driver's device extension.
     * @param {Pointer<DDSETSTATEININFO>} param1 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsetstateininfo">DDSETSTATEININFO</a> structure that contains the surface and VPE object information.
     * @param {Pointer<DDSETSTATEOUTINFO>} param2 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsetstateoutinfo">DDSETSTATEOUTINFO</a> structure that contains the state information for the hardware video port.
     * @returns {Integer} <i>DxSetState</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDSETSTATEININFO.Ptr, param1, DDSETSTATEOUTINFO.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PDX_SETSTATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_SETSTATE {
        /**
         * Creates a PDX_SETSTATE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDSETSTATEININFO, DDSETSTATEOUTINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDSETSTATEININFO.Ptr, DDSETSTATEOUTINFO.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
