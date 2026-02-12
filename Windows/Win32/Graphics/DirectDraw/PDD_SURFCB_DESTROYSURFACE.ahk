#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdDestroySurface callback function destroys a DirectDraw surface.
 * @remarks
 * If DirectDraw did the memory allocation at surface creation time and the driver was not involved in the allocation, DirectDraw does not call the driver's <b>DdDestroySurface</b> function to destroy the surface. 
 * 
 * If the driver is performing the surface memory management itself, <b>DdDestroySurface</b> should free the surface memory and perform any other cleanup, such as freeing private data stored in the <b>dwReserved1</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_global">DD_SURFACE_GLOBAL</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structures.
 * 
 * For a driver-managed surface, if the surface is persistent (that is, the DDSCAPS2_DONOTPERSIST flag in the <b>dwCaps2</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure for the surface is not set), <b>DdDestroySurface</b> can be called with the purpose of evicting the surface from video memory. In this case, the display driver can continue to keep any private data in the <b>dwReserved1</b> members until <b>DdDestroySurface</b> is called to actually destroy the surface.
 * 
 * <b>DdDestroySurface</b> can be called with a disabled <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>. PDEV is disabled or enabled by calling the display driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvassertmode">DrvAssertMode</a> function. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/managing-pdevs">Managing PDEVs</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_surfcb_destroysurface
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_SURFCB_DESTROYSURFACE extends IUnknown {

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
     * @param {Pointer<DD_DESTROYSURFACEDATA>} param0 
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
