#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMILBitmapEffect.ahk" { IMILBitmapEffect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectRenderContext.ahk" { IMILBitmapEffectRenderContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods used to create Windows Presentation Foundation (WPF) Microsoft Win32 bitmap effect objects.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectfactory
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectFactory extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectFactory
     * @type {Guid}
     */
    static IID := Guid("{33a9df34-a403-4ec7-b07e-bc0682370845}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateEffect      : IntPtr
        CreateContext     : IntPtr
        CreateEffectOuter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IMILBitmapEffect object.
     * @param {Pointer<Guid>} pguidEffect Type: <b>const GUID*</b>
     * 
     * A pointer to the GUID of the effect to create.
     * @returns {IMILBitmapEffect} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectprimitive">IMILBitmapEffectPrimitive</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectfactory-createeffect
     */
    CreateEffect(pguidEffect) {
        result := ComCall(3, this, Guid.Ptr, pguidEffect, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffect(ppEffect)
    }

    /**
     * Creates an IMILBitmapEffectRenderContext object.
     * @returns {IMILBitmapEffectRenderContext} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectfactory-createcontext
     */
    CreateContext() {
        result := ComCall(4, this, "ptr*", &ppContext := 0, "HRESULT")
        return IMILBitmapEffectRenderContext(ppContext)
    }

    /**
     * Creates an outer IMILBitmapEffect object.
     * @returns {IMILBitmapEffect} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>**</b>
     * 
     * A pointer that receives a pointer to the new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectfactory-createeffectouter
     */
    CreateEffectOuter() {
        result := ComCall(5, this, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffect(ppEffect)
    }

    Query(iid) {
        if (IMILBitmapEffectFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateEffect := CallbackCreate(GetMethod(implObj, "CreateEffect"), flags, 3)
        this.vtbl.CreateContext := CallbackCreate(GetMethod(implObj, "CreateContext"), flags, 2)
        this.vtbl.CreateEffectOuter := CallbackCreate(GetMethod(implObj, "CreateEffectOuter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateEffect)
        CallbackFree(this.vtbl.CreateContext)
        CallbackFree(this.vtbl.CreateEffectOuter)
    }
}
