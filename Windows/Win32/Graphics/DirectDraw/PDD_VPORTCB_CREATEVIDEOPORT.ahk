#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdVideoPortCreate callback function notifies the driver that DirectDraw has created a VPE object.
 * @remarks
 * <b>DdVideoPortCreate</b> can be optionally implemented in DirectDraw drivers that support VPE.
 * 
 * <b>DdVideoPortCreate</b> can allocate memory for and initialize any private, VPE object-specific data. The driver can use the <b>dwReserved1</b> and <b>dwReserved2</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure to store this data. This DD_VIDEOPORT_LOCAL structure is at the <b>lpVideoPort</b> member of the DD_CREATEVPORTDATA structure at <i>lpCreateVideoPort</i>. The driver cannot use or change any other members of the DD_VIDEOPORT_LOCAL structure.
 * 
 * If the hardware video port is implemented to use the feature connector, the driver might need to initialize the feature connector for hardware video port use.
 * 
 * <b>DdVideoPortCreate</b> should not turn the hardware video port on. This is accomplished in <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_createvideoport
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_CREATEVIDEOPORT extends IUnknown {

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
     * @param {Pointer<DD_CREATEVPORTDATA>} param0 
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
