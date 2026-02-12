#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_getinputformats
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_GETINPUTFORMATS extends IUnknown {

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
     * @param {Pointer<DD_GETVPORTINPUTFORMATDATA>} param0 
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
