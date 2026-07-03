#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETVPORTOUTPUTFORMATDATA.ahk" { DD_GETVPORTOUTPUTFORMATDATA }

/**
 * The DdVideoPortGetOutputFormats callback function determines the output formats that the VPE object supports.
 * @remarks
 * DirectDraw drivers that support VPE must implement <b>DdVideoPortGetOutputFormats</b>
 * 
 * DirectDraw calls <b>DdVideoPortGetOutputFormats</b> to obtain the number of output formats supported by the specified VPE object and a description of each format. <b>DdVideoPortGetOutputFormats</b> is called twice for the specified VPE object:
 * 
 * <ul>
 * <li>
 * In the first call, the <b>lpddpfOutputFormats</b> member of the DD_GETVPORTOUTPUTFORMATDATA structure at <i>lpGetOutputFormats</i> is <b>NULL</b>. The driver should write the number of output formats that the VPE object supports in the <b>dwNumFormats</b> member of DD_GETVPORTOUTPUTFORMATDATA. Upon return, DirectDraw will allocate this number of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structures to pass in the second call to <b>DdVideoPortGetOutputFormats</b>.
 * 
 * </li>
 * <li>
 * In the second call, <b>lpddpfOutputFormats</b> points to the array of allocated DDPIXELFORMAT structures. The driver should fill in each structure with a description of each output format that the VPE object can write to the frame buffer. The driver should return only those output formats that it supports based on the input format of the video data. The driver should also return the number of supported output formats in <b>dwNumFormats</b>. Note that the driver is guaranteed that the buffer to which <b>lpddpfOutputFormats</b> points is large enough to hold the format information being requested.
 * 
 * </li>
 * </ul>
 * If the <b>dwFlags</b> member of DD_GETVPORTOUTPUTFORMATDATA is set only to DDVPFORMAT_VIDEO, the driver should return only those output formats that are supported for normal video data. If <b>dwFlags</b> is set only to DDVPFORMAT_VBI, the driver should return only those formats supported for <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data. If <b>dwFlags</b> is set to both flags, the driver should return all formats supported by the <a href="https://docs.microsoft.com/windows-hardware/drivers/">VPE</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_getoutputformats
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETOUTPUTFORMATS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETOUTPUTFORMATS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETVPORTOUTPUTFORMATDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportoutputformatdata">DD_GETVPORTOUTPUTFORMATDATA</a> structure that contains the information required for the driver to return the output formats the VPE object supports.
     * @returns {Integer} <b>DdVideoPortGetOutputFormats</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETVPORTOUTPUTFORMATDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETOUTPUTFORMATS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETOUTPUTFORMATS {
        /**
         * Creates a PDD_VPORTCB_GETOUTPUTFORMATS pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETVPORTOUTPUTFORMATDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETVPORTOUTPUTFORMATDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
