#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VIEW_OBJECT_COMPOSITION_MODE.ahk" { VIEW_OBJECT_COMPOSITION_MODE }
#Import ".\ISurfacePresenter.ahk" { ISurfacePresenter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VIEW_OBJECT_ALPHA_MODE.ahk" { VIEW_OBJECT_ALPHA_MODE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IViewObjectPresentSite extends IUnknown {
    /**
     * The interface identifier for IViewObjectPresentSite
     * @type {Guid}
     */
    static IID := Guid("{305106e1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewObjectPresentSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateSurfacePresenter : IntPtr
        IsHardwareComposition  : IntPtr
        SetCompositionMode     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewObjectPresentSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} backBufferCount 
     * @param {DXGI_FORMAT} format 
     * @param {VIEW_OBJECT_ALPHA_MODE} _mode 
     * @returns {ISurfacePresenter} 
     */
    CreateSurfacePresenter(pDevice, width, height, backBufferCount, format, _mode) {
        result := ComCall(3, this, "ptr", pDevice, "uint", width, "uint", height, "uint", backBufferCount, DXGI_FORMAT, format, VIEW_OBJECT_ALPHA_MODE, _mode, "ptr*", &ppQueue := 0, "HRESULT")
        return ISurfacePresenter(ppQueue)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsHardwareComposition() {
        result := ComCall(4, this, BOOL.Ptr, &pIsHardwareComposition := 0, "HRESULT")
        return pIsHardwareComposition
    }

    /**
     * 
     * @param {VIEW_OBJECT_COMPOSITION_MODE} _mode 
     * @returns {HRESULT} 
     */
    SetCompositionMode(_mode) {
        result := ComCall(5, this, VIEW_OBJECT_COMPOSITION_MODE, _mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IViewObjectPresentSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSurfacePresenter := CallbackCreate(GetMethod(implObj, "CreateSurfacePresenter"), flags, 8)
        this.vtbl.IsHardwareComposition := CallbackCreate(GetMethod(implObj, "IsHardwareComposition"), flags, 2)
        this.vtbl.SetCompositionMode := CallbackCreate(GetMethod(implObj, "SetCompositionMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSurfacePresenter)
        CallbackFree(this.vtbl.IsHardwareComposition)
        CallbackFree(this.vtbl.SetCompositionMode)
    }
}
