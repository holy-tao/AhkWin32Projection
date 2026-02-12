#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DxGetPreviousAutoflip callback function is called when the device is hardware autoflipping and a client of the video miniport driver wants to know which surface received the previous field of video data for capture purposes.
 * @remarks
 * If interleaving, the surface that received the previous field may be the same surface that is receiving the current field. 
 * 
 * <i>DxGetPreviousAutoflip</i> returns the index in the autoflip chain of the correct surface in the <b>dwSurfaceIndex</b> member of the DDGETPREVIOUSAUTOFLIPOUTINFO structure at <i>GetPreviousAutoflipOutInfo</i>.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxmini/nc-dxmini-pdx_getpreviousautoflip
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDX_GETPREVIOUSAUTOFLIP extends IUnknown {

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
     * @param {Pointer<DDGETPREVIOUSAUTOFLIPININFO>} param1 
     * @param {Pointer<DDGETPREVIOUSAUTOFLIPOUTINFO>} param2 
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
