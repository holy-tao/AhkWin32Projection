#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETVPORTINPUTFORMATDATA.ahk" { DD_GETVPORTINPUTFORMATDATA }

/**
 * The DdVideoPortGetInputFormats callback function determines the input formats that the DirectDraw VPE object can accept.
 * @remarks
 * <b>DdVideoPortGetInputFormats</b> must be implemented in DirectDraw drivers that support VPE.
 * 
 * DirectDraw calls <b>DdVideoPortGetInputFormats</b> to obtain the number of input formats supported by the specified VPE object and a description of each format. <b>DdVideoPortGetInputFormats</b> is called twice for the specified VPE object:
 * 
 * <ul>
 * <li>
 * In the first call, the <b>lpddpfFormat</b> member of the DD_GETVPORTINPUTFORMATDATA structure at <i>lpGetInputFormats</i> is <b>NULL</b>. The driver should write the number of input formats that the VPE object supports in the <b>dwNumFormats</b> member of DD_GETVPORTINPUTFORMATDATA. Upon return, DirectDraw will allocate this number of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structures to pass in the second call to <b>DdVideoPortGetInputFormats</b>.
 * 
 * </li>
 * <li>
 * In the second call, <b>lpddpfFormat</b> points to the array of allocated DDPIXELFORMAT structures. The driver should fill in each structure to describe each input format that the VPE object supports. The driver should also return the number of supported input formats in <b>dwNumFormats</b>. Note that the driver is guaranteed that the buffer to which <b>lpddpfFormat</b> points is large enough to hold the format information being requested.
 * 
 * </li>
 * </ul>
 * If the <b>dwFlags</b> member of the DD_GETVPORTINPUTFORMATDATA structure is set only to DDVPFORMAT_VIDEO, the driver should return only those formats that are supported for the normal video data. If <b>dwFlags</b> is set only to DDVPFORMAT_VBI, the driver should return only those formats supported for the <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data. If <b>dwFlags</b> is set to both flags, the driver should return all formats supported by the VPE object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_getinputformats
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETINPUTFORMATS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETINPUTFORMATS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETVPORTINPUTFORMATDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportinputformatdata">DD_GETVPORTINPUTFORMATDATA</a> structure that contains the information required for the driver to return the input formats the VPE object can accept.
     * @returns {Integer} <b>DdVideoPortGetInputFormats</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETVPORTINPUTFORMATDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETINPUTFORMATS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETINPUTFORMATS {
        /**
         * Creates a PDD_VPORTCB_GETINPUTFORMATS pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETVPORTINPUTFORMATDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETVPORTINPUTFORMATDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
