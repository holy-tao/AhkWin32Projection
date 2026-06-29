#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 */
export default struct ICompositorInterop2 extends IUnknown {
    /**
     * The interface identifier for ICompositorInterop2
     * @type {Guid}
     */
    static IID := Guid("{d3eef34c-0667-4afc-8d13-867607b0fe91}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICompositorInterop2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CheckCompositionTextureSupport : IntPtr
        CreateCompositionTexture       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICompositorInterop2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} renderingDevice 
     * @returns {BOOL} 
     */
    CheckCompositionTextureSupport(renderingDevice) {
        result := ComCall(3, this, "ptr", renderingDevice, BOOL.Ptr, &supportsCompositionTextures := 0, "HRESULT")
        return supportsCompositionTextures
    }

    /**
     * 
     * @param {IUnknown} d3dTexture 
     * @returns {Pointer} 
     */
    CreateCompositionTexture(d3dTexture) {
        result := ComCall(4, this, "ptr", d3dTexture, "ptr*", &compositionTexture := 0, "HRESULT")
        return compositionTexture
    }

    Query(iid) {
        if (ICompositorInterop2.IID.Equals(iid)) {
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
