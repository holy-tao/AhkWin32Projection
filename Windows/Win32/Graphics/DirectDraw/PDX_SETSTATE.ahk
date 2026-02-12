#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/dxmini/nc-dxmini-pdx_setstate
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDX_SETSTATE extends IUnknown {

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
     * @param {Pointer<Void>} param0 
     * @param {Pointer<DDSETSTATEININFO>} param1 
     * @param {Pointer<DDSETSTATEOUTINFO>} param2 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, "ptr", param1, "ptr", param2, "uint")
        return result
    }
}
