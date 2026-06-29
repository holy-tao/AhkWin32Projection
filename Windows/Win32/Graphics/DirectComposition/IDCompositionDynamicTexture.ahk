#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionTexture.ahk" { IDCompositionTexture }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionDynamicTexture extends IUnknown {
    /**
     * The interface identifier for IDCompositionDynamicTexture
     * @type {Guid}
     */
    static IID := Guid("{a1de1d3f-6405-447f-8e95-1383a34b0277}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionDynamicTexture interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTexture  : IntPtr
        SetTexture1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionDynamicTexture.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDCompositionTexture} pTexture 
     * @param {Pointer<RECT>} pRects 
     * @param {Pointer} rectCount 
     * @returns {HRESULT} 
     */
    SetTexture(pTexture, pRects, rectCount) {
        result := ComCall(3, this, "ptr", pTexture, RECT.Ptr, pRects, "ptr", rectCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionTexture} pTexture 
     * @returns {HRESULT} 
     */
    SetTexture1(pTexture) {
        result := ComCall(4, this, "ptr", pTexture, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionDynamicTexture.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTexture := CallbackCreate(GetMethod(implObj, "SetTexture"), flags, 4)
        this.vtbl.SetTexture1 := CallbackCreate(GetMethod(implObj, "SetTexture1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTexture)
        CallbackFree(this.vtbl.SetTexture1)
    }
}
