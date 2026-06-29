#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct2D\Common\D2D_RECT_U.ahk" { D2D_RECT_U }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Dxgi\Common\DXGI_ALPHA_MODE.ahk" { DXGI_ALPHA_MODE }

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionTexture extends IUnknown {
    /**
     * The interface identifier for IDCompositionTexture
     * @type {Guid}
     */
    static IID := Guid("{929bb1aa-725f-433b-abd7-273075a835f2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionTexture interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSourceRect     : IntPtr
        SetColorSpace     : IntPtr
        SetAlphaMode      : IntPtr
        GetAvailableFence : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionTexture.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_U>} sourceRect 
     * @returns {HRESULT} 
     */
    SetSourceRect(sourceRect) {
        result := ComCall(3, this, D2D_RECT_U.Ptr, sourceRect, "HRESULT")
        return result
    }

    /**
     * The SetColorSpace function defines the input color space for a given device context.
     * @param {DXGI_COLOR_SPACE_TYPE} colorSpace 
     * @returns {HRESULT} If this function succeeds, the return value is a handle to the <i>hColorSpace</i> being replaced.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setcolorspace
     */
    SetColorSpace(colorSpace) {
        result := ComCall(4, this, DXGI_COLOR_SPACE_TYPE, colorSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DXGI_ALPHA_MODE} alphaMode 
     * @returns {HRESULT} 
     */
    SetAlphaMode(alphaMode) {
        result := ComCall(5, this, DXGI_ALPHA_MODE, alphaMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} fenceValue 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} availableFence 
     * @returns {HRESULT} 
     */
    GetAvailableFence(fenceValue, iid, availableFence) {
        fenceValueMarshal := fenceValue is VarRef ? "uint*" : "ptr"
        availableFenceMarshal := availableFence is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, fenceValueMarshal, fenceValue, Guid.Ptr, iid, availableFenceMarshal, availableFence, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionTexture.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSourceRect := CallbackCreate(GetMethod(implObj, "SetSourceRect"), flags, 2)
        this.vtbl.SetColorSpace := CallbackCreate(GetMethod(implObj, "SetColorSpace"), flags, 2)
        this.vtbl.SetAlphaMode := CallbackCreate(GetMethod(implObj, "SetAlphaMode"), flags, 2)
        this.vtbl.GetAvailableFence := CallbackCreate(GetMethod(implObj, "GetAvailableFence"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSourceRect)
        CallbackFree(this.vtbl.SetColorSpace)
        CallbackFree(this.vtbl.SetAlphaMode)
        CallbackFree(this.vtbl.GetAvailableFence)
    }
}
