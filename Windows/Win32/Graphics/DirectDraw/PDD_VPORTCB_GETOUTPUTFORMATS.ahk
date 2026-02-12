#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_getoutputformats
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_GETOUTPUTFORMATS extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<DD_GETVPORTOUTPUTFORMATDATA>} param0 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        result := ComCall(3, this, "ptr", param0, "uint")
        return result
    }
}
