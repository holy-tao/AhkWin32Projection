#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DxGetPolarity callback function returns the polarity (even or odd) of the current field being written by the video port extensions (VPE) object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetpolarityininfo">DDGETPOLARITYININFO</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetpolarityoutinfo">DDGETPOLARITYOUTINFO</a> structures contain VPE object information.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxmini/nc-dxmini-pdx_getpolarity
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDX_GETPOLARITY extends IUnknown {

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
     * @param {Pointer<DDGETPOLARITYININFO>} param1 
     * @param {Pointer<DDGETPOLARITYOUTINFO>} param2 
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
