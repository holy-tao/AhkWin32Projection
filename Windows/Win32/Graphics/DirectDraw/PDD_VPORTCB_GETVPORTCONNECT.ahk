#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_getvportconnect
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_GETVPORTCONNECT extends IUnknown {

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
     * @param {Pointer<DD_GETVPORTCONNECTDATA>} param0 
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
