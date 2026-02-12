#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_surfcb_getflipstatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_SURFCB_GETFLIPSTATUS extends IUnknown {

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
     * @param {Pointer<DD_GETFLIPSTATUSDATA>} param0 
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
