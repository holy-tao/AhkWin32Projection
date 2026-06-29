#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DXGI_DEBUG_RLO_FLAGS.ahk" { DXGI_DEBUG_RLO_FLAGS }

/**
 * This interface controls debug settings, and can only be used if the debug layer is turned on.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nn-dxgidebug-idxgidebug
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIDebug extends IUnknown {
    /**
     * The interface identifier for IDXGIDebug
     * @type {Guid}
     */
    static IID := Guid("{119e7452-de9e-40fe-8806-88f90c12b441}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIDebug interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReportLiveObjects : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIDebug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports info about the lifetime of an object or objects.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} apiid The globally unique identifier (GUID) of the object or objects to get info about. Use one of the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> GUIDs.
     * @param {DXGI_DEBUG_RLO_FLAGS} flags A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_debug_rlo_flags">DXGI_DEBUG_RLO_FLAGS</a>-typed value that specifies the amount of info to report.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgidebug-reportliveobjects
     */
    ReportLiveObjects(apiid, flags) {
        result := ComCall(3, this, Guid, apiid, DXGI_DEBUG_RLO_FLAGS, flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDXGIDebug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReportLiveObjects := CallbackCreate(GetMethod(implObj, "ReportLiveObjects"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReportLiveObjects)
    }
}
