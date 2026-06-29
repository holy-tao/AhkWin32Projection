#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionDevice3.ahk" { IDCompositionDevice3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionTexture.ahk" { IDCompositionTexture }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionDevice4 extends IDCompositionDevice3 {
    /**
     * The interface identifier for IDCompositionDevice4
     * @type {Guid}
     */
    static IID := Guid("{85fc5cca-2da6-494c-86b6-4a775c049b8a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionDevice4 interfaces
    */
    struct Vtbl extends IDCompositionDevice3.Vtbl {
        CheckCompositionTextureSupport : IntPtr
        CreateCompositionTexture       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionDevice4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} renderingDevice 
     * @returns {BOOL} 
     */
    CheckCompositionTextureSupport(renderingDevice) {
        result := ComCall(37, this, "ptr", renderingDevice, BOOL.Ptr, &supportsCompositionTextures := 0, "HRESULT")
        return supportsCompositionTextures
    }

    /**
     * 
     * @param {IUnknown} d3dTexture 
     * @returns {IDCompositionTexture} 
     */
    CreateCompositionTexture(d3dTexture) {
        result := ComCall(38, this, "ptr", d3dTexture, "ptr*", &compositionTexture := 0, "HRESULT")
        return IDCompositionTexture(compositionTexture)
    }

    Query(iid) {
        if (IDCompositionDevice4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckCompositionTextureSupport := CallbackCreate(GetMethod(implObj, "CheckCompositionTextureSupport"), flags, 3)
        this.vtbl.CreateCompositionTexture := CallbackCreate(GetMethod(implObj, "CreateCompositionTexture"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckCompositionTextureSupport)
        CallbackFree(this.vtbl.CreateCompositionTexture)
    }
}
