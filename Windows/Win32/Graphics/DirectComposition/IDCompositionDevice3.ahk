#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionTurbulenceEffect.ahk" { IDCompositionTurbulenceEffect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionGaussianBlurEffect.ahk" { IDCompositionGaussianBlurEffect }
#Import ".\IDCompositionDevice2.ahk" { IDCompositionDevice2 }
#Import ".\IDCompositionArithmeticCompositeEffect.ahk" { IDCompositionArithmeticCompositeEffect }
#Import ".\IDCompositionCompositeEffect.ahk" { IDCompositionCompositeEffect }
#Import ".\IDCompositionSaturationEffect.ahk" { IDCompositionSaturationEffect }
#Import ".\IDCompositionTableTransferEffect.ahk" { IDCompositionTableTransferEffect }
#Import ".\IDCompositionAffineTransform2DEffect.ahk" { IDCompositionAffineTransform2DEffect }
#Import ".\IDCompositionLinearTransferEffect.ahk" { IDCompositionLinearTransferEffect }
#Import ".\IDCompositionHueRotationEffect.ahk" { IDCompositionHueRotationEffect }
#Import ".\IDCompositionBrightnessEffect.ahk" { IDCompositionBrightnessEffect }
#Import ".\IDCompositionColorMatrixEffect.ahk" { IDCompositionColorMatrixEffect }
#Import ".\IDCompositionBlendEffect.ahk" { IDCompositionBlendEffect }
#Import ".\IDCompositionShadowEffect.ahk" { IDCompositionShadowEffect }

/**
 * Serves as a factory for all other Microsoft DirectComposition objects and provides methods to control transactional composition. (IDCompositionDevice3)
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiondevice3
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionDevice3 extends IDCompositionDevice2 {
    /**
     * The interface identifier for IDCompositionDevice3
     * @type {Guid}
     */
    static IID := Guid("{0987cb06-f916-48bf-8d35-ce7641781bd9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionDevice3 interfaces
    */
    struct Vtbl extends IDCompositionDevice2.Vtbl {
        CreateGaussianBlurEffect        : IntPtr
        CreateBrightnessEffect          : IntPtr
        CreateColorMatrixEffect         : IntPtr
        CreateShadowEffect              : IntPtr
        CreateHueRotationEffect         : IntPtr
        CreateSaturationEffect          : IntPtr
        CreateTurbulenceEffect          : IntPtr
        CreateLinearTransferEffect      : IntPtr
        CreateTableTransferEffect       : IntPtr
        CreateCompositeEffect           : IntPtr
        CreateBlendEffect               : IntPtr
        CreateArithmeticCompositeEffect : IntPtr
        CreateAffineTransform2DEffect   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionDevice3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of IDCompositionGaussianBlurEffect.
     * @returns {IDCompositionGaussianBlurEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiongaussianblureffect">IDCompositionGaussianBlurEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiongaussianblureffect">IDCompositionGaussianBlurEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-creategaussianblureffect
     */
    CreateGaussianBlurEffect() {
        result := ComCall(24, this, "ptr*", &gaussianBlurEffect := 0, "HRESULT")
        return IDCompositionGaussianBlurEffect(gaussianBlurEffect)
    }

    /**
     * Creates an instance of IDCompositionBrightnessEffect.
     * @returns {IDCompositionBrightnessEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionbrightnesseffect">IDCompositionBrightnessEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionbrightnesseffect">IDCompositionBrightnessEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createbrightnesseffect
     */
    CreateBrightnessEffect() {
        result := ComCall(25, this, "ptr*", &brightnessEffect := 0, "HRESULT")
        return IDCompositionBrightnessEffect(brightnessEffect)
    }

    /**
     * Creates an instance of IDCompositionColorMatrixEffect.
     * @returns {IDCompositionColorMatrixEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncolormatrixeffect">IDCompositionColorMatrixEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncolormatrixeffect">IDCompositionColorMatrixEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createcolormatrixeffect
     */
    CreateColorMatrixEffect() {
        result := ComCall(26, this, "ptr*", &_colorMatrixEffect := 0, "HRESULT")
        return IDCompositionColorMatrixEffect(_colorMatrixEffect)
    }

    /**
     * Creates an instance of IDCompositionShadowEffect.
     * @returns {IDCompositionShadowEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionshadoweffect">IDCompositionShadowEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionshadoweffect">IDCompositionShadowEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createshadoweffect
     */
    CreateShadowEffect() {
        result := ComCall(27, this, "ptr*", &shadowEffect := 0, "HRESULT")
        return IDCompositionShadowEffect(shadowEffect)
    }

    /**
     * Creates an instance of IDCompositionHueRotationEffect.
     * @returns {IDCompositionHueRotationEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionhuerotationeffect">IDCompositionHueRotationEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionhuerotationeffect">IDCompositionHueRotationEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createhuerotationeffect
     */
    CreateHueRotationEffect() {
        result := ComCall(28, this, "ptr*", &hueRotationEffect := 0, "HRESULT")
        return IDCompositionHueRotationEffect(hueRotationEffect)
    }

    /**
     * Creates an instance of IDCompositionSaturationEffect.
     * @returns {IDCompositionSaturationEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsaturationeffect">IDCompositionSaturationEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsaturationeffect">IDCompositionSaturationEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createsaturationeffect
     */
    CreateSaturationEffect() {
        result := ComCall(29, this, "ptr*", &saturationEffect := 0, "HRESULT")
        return IDCompositionSaturationEffect(saturationEffect)
    }

    /**
     * Creates an instance of IDCompositionTurbulenceEffect.
     * @returns {IDCompositionTurbulenceEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionturbulenceeffect">IDCompositionTurbulenceEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionturbulenceeffect">IDCompositionTurbulenceEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createturbulenceeffect
     */
    CreateTurbulenceEffect() {
        result := ComCall(30, this, "ptr*", &turbulenceEffect := 0, "HRESULT")
        return IDCompositionTurbulenceEffect(turbulenceEffect)
    }

    /**
     * Creates an instance of IDCompositionLinearTransferEffect.
     * @returns {IDCompositionLinearTransferEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionlineartransfereffect">IDCompositionLinearTransferEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionlineartransfereffect">IDCompositionLinearTransferEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createlineartransfereffect
     */
    CreateLinearTransferEffect() {
        result := ComCall(31, this, "ptr*", &linearTransferEffect := 0, "HRESULT")
        return IDCompositionLinearTransferEffect(linearTransferEffect)
    }

    /**
     * Creates an instance of IDCompositionTableTransferEffect.
     * @returns {IDCompositionTableTransferEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontabletransfereffect">IDCompositionTableTransferEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontabletransfereffect">IDCompositionTableTransferEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createtabletransfereffect
     */
    CreateTableTransferEffect() {
        result := ComCall(32, this, "ptr*", &tableTransferEffect := 0, "HRESULT")
        return IDCompositionTableTransferEffect(tableTransferEffect)
    }

    /**
     * Creates an instance of IDCompositionCompositeEffect.
     * @returns {IDCompositionCompositeEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncompositeeffect">IDCompositionCompositeEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncompositeeffect">IDCompositionCompositeEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createcompositeeffect
     */
    CreateCompositeEffect() {
        result := ComCall(33, this, "ptr*", &compositeEffect := 0, "HRESULT")
        return IDCompositionCompositeEffect(compositeEffect)
    }

    /**
     * Creates an instance of IDCompositionBlendEffect.
     * @returns {IDCompositionBlendEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionblendeffect">IDCompositionBlendEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionblendeffect">IDCompositionBlendEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createblendeffect
     */
    CreateBlendEffect() {
        result := ComCall(34, this, "ptr*", &blendEffect := 0, "HRESULT")
        return IDCompositionBlendEffect(blendEffect)
    }

    /**
     * Creates an instance of IDCompositionArithmeticCompositeEffect.
     * @returns {IDCompositionArithmeticCompositeEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionarithmeticcompositeeffect">IDCompositionArithmeticCompositeEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionarithmeticcompositeeffect">IDCompositionArithmeticCompositeEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createarithmeticcompositeeffect
     */
    CreateArithmeticCompositeEffect() {
        result := ComCall(35, this, "ptr*", &arithmeticCompositeEffect := 0, "HRESULT")
        return IDCompositionArithmeticCompositeEffect(arithmeticCompositeEffect)
    }

    /**
     * Creates an instance of IDCompositionAffineTransform2DEffect.
     * @returns {IDCompositionAffineTransform2DEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionaffinetransform2deffect">IDCompositionAffineTransform2DEffect</a>**</b>
     * 
     * Recieves the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionaffinetransform2deffect">IDCompositionAffineTransform2DEffect</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createaffinetransform2deffect
     */
    CreateAffineTransform2DEffect() {
        result := ComCall(36, this, "ptr*", &affineTransform2dEffect := 0, "HRESULT")
        return IDCompositionAffineTransform2DEffect(affineTransform2dEffect)
    }

    Query(iid) {
        if (IDCompositionDevice3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateGaussianBlurEffect := CallbackCreate(GetMethod(implObj, "CreateGaussianBlurEffect"), flags, 2)
        this.vtbl.CreateBrightnessEffect := CallbackCreate(GetMethod(implObj, "CreateBrightnessEffect"), flags, 2)
        this.vtbl.CreateColorMatrixEffect := CallbackCreate(GetMethod(implObj, "CreateColorMatrixEffect"), flags, 2)
        this.vtbl.CreateShadowEffect := CallbackCreate(GetMethod(implObj, "CreateShadowEffect"), flags, 2)
        this.vtbl.CreateHueRotationEffect := CallbackCreate(GetMethod(implObj, "CreateHueRotationEffect"), flags, 2)
        this.vtbl.CreateSaturationEffect := CallbackCreate(GetMethod(implObj, "CreateSaturationEffect"), flags, 2)
        this.vtbl.CreateTurbulenceEffect := CallbackCreate(GetMethod(implObj, "CreateTurbulenceEffect"), flags, 2)
        this.vtbl.CreateLinearTransferEffect := CallbackCreate(GetMethod(implObj, "CreateLinearTransferEffect"), flags, 2)
        this.vtbl.CreateTableTransferEffect := CallbackCreate(GetMethod(implObj, "CreateTableTransferEffect"), flags, 2)
        this.vtbl.CreateCompositeEffect := CallbackCreate(GetMethod(implObj, "CreateCompositeEffect"), flags, 2)
        this.vtbl.CreateBlendEffect := CallbackCreate(GetMethod(implObj, "CreateBlendEffect"), flags, 2)
        this.vtbl.CreateArithmeticCompositeEffect := CallbackCreate(GetMethod(implObj, "CreateArithmeticCompositeEffect"), flags, 2)
        this.vtbl.CreateAffineTransform2DEffect := CallbackCreate(GetMethod(implObj, "CreateAffineTransform2DEffect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateGaussianBlurEffect)
        CallbackFree(this.vtbl.CreateBrightnessEffect)
        CallbackFree(this.vtbl.CreateColorMatrixEffect)
        CallbackFree(this.vtbl.CreateShadowEffect)
        CallbackFree(this.vtbl.CreateHueRotationEffect)
        CallbackFree(this.vtbl.CreateSaturationEffect)
        CallbackFree(this.vtbl.CreateTurbulenceEffect)
        CallbackFree(this.vtbl.CreateLinearTransferEffect)
        CallbackFree(this.vtbl.CreateTableTransferEffect)
        CallbackFree(this.vtbl.CreateCompositeEffect)
        CallbackFree(this.vtbl.CreateBlendEffect)
        CallbackFree(this.vtbl.CreateArithmeticCompositeEffect)
        CallbackFree(this.vtbl.CreateAffineTransform2DEffect)
    }
}
