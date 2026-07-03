#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETVPORTCONNECTDATA.ahk" { DD_GETVPORTCONNECTDATA }

/**
 * The DdVideoPortGetConnectInfo callback function returns the connections supported by the specified VPE object.
 * @remarks
 * <i>DdVideoPortGetConnectInfo</i> must be implemented in DirectDraw drivers that support VPE.
 * 
 * DirectDraw calls <i>DdVideoPortGetConnectInfo</i> to obtain the number of connections supported by the specified VPE object and the characteristics of each connection. <i>DdVideoPortGetConnectInfo</i> is called twice for the specified VPE object:
 * 
 * <ul>
 * <li>
 * In the first call, the <b>lpConnect</b> member of the DD_GETVPORTCONNECTDATA structure at <i>lpGetConnect</i> is <b>NULL</b>. The driver should write the number of connections that the VPE object supports in the <b>dwNumEntries</b> member of DD_GETVPORTCONNECTDATA. Upon return, DirectDraw will allocate this number of DDVIDEOPORTCONNECT structures to pass in the second call to <i>DdVideoPortGetConnectInfo</i>.
 * 
 * </li>
 * <li>
 * In the second call, <b>lpConnect</b> points to the array of allocated <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddvideoportconnect">DDVIDEOPORTCONNECT</a> structures. The driver should fill in each structure to describe each connection that the VPE object supports. The driver should also return the number of supported connections in <b>dwNumEntries</b>. Note that the driver is guaranteed that the buffer to which <b>lpConnect</b> points is large enough to hold the connection information being requested.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_getvportconnect
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETVPORTCONNECT {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETVPORTCONNECT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETVPORTCONNECTDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportconnectdata">DD_GETVPORTCONNECTDATA</a> structure that contains the information required for the driver to return the VPE object connection data.
     * @returns {Integer} <i>DdVideoPortGetConnectInfo</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETVPORTCONNECTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETVPORTCONNECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETVPORTCONNECT {
        /**
         * Creates a PDD_VPORTCB_GETVPORTCONNECT pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETVPORTCONNECTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETVPORTCONNECTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
