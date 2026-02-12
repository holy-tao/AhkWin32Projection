#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The D3dDestroyDDLocal function destroys all the Microsoft Direct3D surfaces previously created by the D3dCreateSurfaceEx function that belong to the same given local Microsoft DirectDraw object.
 * @remarks
 * All Direct3D drivers must support <b>D3dDestroyDDLocal</b>.
 * 
 * Direct3D calls <b>D3dDestroyDDLocal</b> when the application indicates that the Direct3D context is no longer required and it will be destroyed along with all surfaces associated to it. The association comes through the pointer to the local DirectDraw object. The driver must free any memory that the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurfaceex">D3dCreateSurfaceEx</a> callback allocated for each surface, if necessary. 
 * 
 * The driver should not destroy the DirectDraw surfaces associated with these Direct3D surfaces. This is the application's responsibility.
 * 
 * The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that was passed in as the <b>lpDDLcl</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/ns-d3dhal-_d3dhal_contextcreatedata">D3DHAL_CONTEXTCREATEDATA</a> structure when <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/nc-d3dhal-lpd3dhal_contextcreatecb">D3dContextCreate</a> was called is released by the operating system after <b>D3dDestroyDDLocal</b> returns. 
 * 
 * <b>D3dDestroyDDLocal</b> can be called with a disabled <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>. A PDEV is disabled or enabled by calling the display driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvassertmode">DrvAssertMode</a> function. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/managing-pdevs">Managing PDEVs</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_destroyddlocal
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_DESTROYDDLOCAL extends IUnknown {

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
     * @param {Pointer<DD_DESTROYDDLOCALDATA>} param0 
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
