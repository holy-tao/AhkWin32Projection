#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface controls debug settings, and can only be used if the debug layer is turned on.
 * @remarks
 * 
 * This interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-dxgigetdebuginterface">DXGIGetDebugInterface</a> function.
 *         
 * 
 * For more info about the debug layer, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">Debug Layer</a>.
 *         
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 *       
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nn-dxgidebug-idxgidebug
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDebug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDebug
     * @type {Guid}
     */
    static IID => Guid("{119e7452-de9e-40fe-8806-88f90c12b441}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportLiveObjects"]

    /**
     * Reports info about the lifetime of an object or objects.
     * @param {Guid} apiid The globally unique identifier (GUID) of the object or objects to get info about. Use one of the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> GUIDs.
     * @param {Integer} flags A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_debug_rlo_flags">DXGI_DEBUG_RLO_FLAGS</a>-typed value that specifies the amount of info to report.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgidebug-reportliveobjects
     */
    ReportLiveObjects(apiid, flags) {
        result := ComCall(3, this, "ptr", apiid, "int", flags, "HRESULT")
        return result
    }
}
