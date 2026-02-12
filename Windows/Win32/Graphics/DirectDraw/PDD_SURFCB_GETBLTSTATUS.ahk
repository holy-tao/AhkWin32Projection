#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_surfcb_getbltstatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_SURFCB_GETBLTSTATUS extends IUnknown {

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
     * @param {Pointer<DD_GETBLTSTATUSDATA>} param0 
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
