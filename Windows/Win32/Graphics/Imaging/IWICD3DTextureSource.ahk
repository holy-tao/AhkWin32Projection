#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WICRect.ahk" { WICRect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\StructuredStorage\IPropertyBag2.ahk" { IPropertyBag2 }
#Import ".\WICBitmapTransformOptions.ahk" { WICBitmapTransformOptions }

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICD3DTextureSource extends IUnknown {
    /**
     * The interface identifier for IWICD3DTextureSource
     * @type {Guid}
     */
    static IID := Guid("{caf65cc4-8ebe-4718-a21f-8dbf40bb7e25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICD3DTextureSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTexture               : IntPtr
        GetTransformedTexture    : IntPtr
        DoesSupportD3DDeviceType : IntPtr
        GetD3DTextureOptions     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICD3DTextureSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pD3DDevice 
     * @param {IPropertyBag2} pID3DTextureOptions 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetTexture(pD3DDevice, pID3DTextureOptions, riid) {
        result := ComCall(3, this, "ptr", pD3DDevice, "ptr", pID3DTextureOptions, Guid.Ptr, riid, "ptr*", &ppTexture := 0, "HRESULT")
        return ppTexture
    }

    /**
     * 
     * @param {Pointer<WICRect>} prc 
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Pointer<Guid>} pguidDstFormat 
     * @param {WICBitmapTransformOptions} dstTransform 
     * @param {IUnknown} pD3DDevice 
     * @param {IPropertyBag2} pID3DTextureOptions 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetTransformedTexture(prc, uiWidth, uiHeight, pguidDstFormat, dstTransform, pD3DDevice, pID3DTextureOptions, riid) {
        result := ComCall(4, this, WICRect.Ptr, prc, "uint", uiWidth, "uint", uiHeight, Guid.Ptr, pguidDstFormat, WICBitmapTransformOptions, dstTransform, "ptr", pD3DDevice, "ptr", pID3DTextureOptions, Guid.Ptr, riid, "ptr*", &ppTexture := 0, "HRESULT")
        return ppTexture
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {BOOL} 
     */
    DoesSupportD3DDeviceType(riid) {
        result := ComCall(5, this, Guid.Ptr, riid, BOOL.Ptr, &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }

    /**
     * 
     * @returns {IPropertyBag2} 
     */
    GetD3DTextureOptions() {
        result := ComCall(6, this, "ptr*", &ppID3DTextureOptions := 0, "HRESULT")
        return IPropertyBag2(ppID3DTextureOptions)
    }

    Query(iid) {
        if (IWICD3DTextureSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTexture := CallbackCreate(GetMethod(implObj, "GetTexture"), flags, 5)
        this.vtbl.GetTransformedTexture := CallbackCreate(GetMethod(implObj, "GetTransformedTexture"), flags, 10)
        this.vtbl.DoesSupportD3DDeviceType := CallbackCreate(GetMethod(implObj, "DoesSupportD3DDeviceType"), flags, 3)
        this.vtbl.GetD3DTextureOptions := CallbackCreate(GetMethod(implObj, "GetD3DTextureOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTexture)
        CallbackFree(this.vtbl.GetTransformedTexture)
        CallbackFree(this.vtbl.DoesSupportD3DDeviceType)
        CallbackFree(this.vtbl.GetD3DTextureOptions)
    }
}
