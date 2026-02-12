#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdUnLock callback function releases the lock held on the specified surface.
 * @remarks
 * The driver does not need to verify that the memory was previously locked down by <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a>, because DirectDraw does parameter validation before calling this routine. 
 * 
 * <i>DdUnLock</i> can be called with a disabled <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>. A PDEV is disabled or enabled by calling the display driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvassertmode">DrvAssertMode</a> function. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/managing-pdevs">Managing PDEVs</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_surfcb_unlock
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_SURFCB_UNLOCK extends IUnknown {

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
     * @param {Pointer<DD_UNLOCKDATA>} param0 
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
