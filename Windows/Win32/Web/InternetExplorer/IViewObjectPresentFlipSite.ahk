#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\MsHtml\VIEW_OBJECT_ALPHA_MODE.ahk" { VIEW_OBJECT_ALPHA_MODE }
#Import ".\ISurfacePresenterFlip.ahk" { ISurfacePresenterFlip }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IViewObjectPresentFlipSite extends IUnknown {
    /**
     * The interface identifier for IViewObjectPresentFlipSite
     * @type {Guid}
     */
    static IID := Guid("{30510846-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewObjectPresentFlipSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateSurfacePresenterFlip : IntPtr
        GetDeviceLuid              : IntPtr
        EnterFullScreen            : IntPtr
        ExitFullScreen             : IntPtr
        IsFullScreen               : IntPtr
        GetBoundingRect            : IntPtr
        GetMetrics                 : IntPtr
        GetFullScreenSize          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewObjectPresentFlipSite.Vtbl()
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
     * @returns {ISurfacePresenterFlip} 
     */
    CreateSurfacePresenterFlip(pDevice, width, height, backBufferCount, format, _mode) {
        result := ComCall(3, this, "ptr", pDevice, "uint", width, "uint", height, "uint", backBufferCount, DXGI_FORMAT, format, VIEW_OBJECT_ALPHA_MODE, _mode, "ptr*", &ppSPFlip := 0, "HRESULT")
        return ISurfacePresenterFlip(ppSPFlip)
    }

    /**
     * 
     * @returns {LUID} 
     */
    GetDeviceLuid() {
        pLuid := LUID()
        result := ComCall(4, this, LUID.Ptr, pLuid, "HRESULT")
        return pLuid
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnterFullScreen() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExitFullScreen() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsFullScreen() {
        result := ComCall(7, this, BOOL.Ptr, &pfFullScreen := 0, "HRESULT")
        return pfFullScreen
    }

    /**
     * 
     * @returns {RECT} 
     */
    GetBoundingRect() {
        pRect := RECT()
        result := ComCall(8, this, RECT.Ptr, pRect, "HRESULT")
        return pRect
    }

    /**
     * 
     * @param {Pointer<POINT>} pPos 
     * @param {Pointer<SIZE>} pSize 
     * @param {Pointer<Float>} pScaleX 
     * @param {Pointer<Float>} pScaleY 
     * @returns {HRESULT} 
     */
    GetMetrics(pPos, pSize, pScaleX, pScaleY) {
        pScaleXMarshal := pScaleX is VarRef ? "float*" : "ptr"
        pScaleYMarshal := pScaleY is VarRef ? "float*" : "ptr"

        result := ComCall(9, this, POINT.Ptr, pPos, SIZE.Ptr, pSize, pScaleXMarshal, pScaleX, pScaleYMarshal, pScaleY, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    GetFullScreenSize() {
        pSize := SIZE()
        result := ComCall(10, this, SIZE.Ptr, pSize, "HRESULT")
        return pSize
    }

    Query(iid) {
        if (IViewObjectPresentFlipSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSurfacePresenterFlip := CallbackCreate(GetMethod(implObj, "CreateSurfacePresenterFlip"), flags, 8)
        this.vtbl.GetDeviceLuid := CallbackCreate(GetMethod(implObj, "GetDeviceLuid"), flags, 2)
        this.vtbl.EnterFullScreen := CallbackCreate(GetMethod(implObj, "EnterFullScreen"), flags, 1)
        this.vtbl.ExitFullScreen := CallbackCreate(GetMethod(implObj, "ExitFullScreen"), flags, 1)
        this.vtbl.IsFullScreen := CallbackCreate(GetMethod(implObj, "IsFullScreen"), flags, 2)
        this.vtbl.GetBoundingRect := CallbackCreate(GetMethod(implObj, "GetBoundingRect"), flags, 2)
        this.vtbl.GetMetrics := CallbackCreate(GetMethod(implObj, "GetMetrics"), flags, 5)
        this.vtbl.GetFullScreenSize := CallbackCreate(GetMethod(implObj, "GetFullScreenSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSurfacePresenterFlip)
        CallbackFree(this.vtbl.GetDeviceLuid)
        CallbackFree(this.vtbl.EnterFullScreen)
        CallbackFree(this.vtbl.ExitFullScreen)
        CallbackFree(this.vtbl.IsFullScreen)
        CallbackFree(this.vtbl.GetBoundingRect)
        CallbackFree(this.vtbl.GetMetrics)
        CallbackFree(this.vtbl.GetFullScreenSize)
    }
}
