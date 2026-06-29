#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import ".\IPresentationBuffer.ahk" { IPresentationBuffer }
#Import ".\IPresentationContent.ahk" { IPresentationContent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Dxgi\Common\DXGI_ALPHA_MODE.ahk" { DXGI_ALPHA_MODE }
#Import ".\PresentationTransform.ahk" { PresentationTransform }

/**
 * Describes an `IPresentationContent` with a single bound buffer, that can be shared with the system compositor and displayed as content in the global visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationsurface
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct IPresentationSurface extends IPresentationContent {
    /**
     * The interface identifier for IPresentationSurface
     * @type {Guid}
     */
    static IID := Guid("{956710fb-ea40-4eba-a3eb-4375a0eb4edc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPresentationSurface interfaces
    */
    struct Vtbl extends IPresentationContent.Vtbl {
        SetBuffer              : IntPtr
        SetColorSpace          : IntPtr
        SetAlphaMode           : IntPtr
        SetSourceRect          : IntPtr
        SetTransform           : IntPtr
        RestrictToOutput       : IntPtr
        SetDisableReadback     : IntPtr
        SetLetterboxingMargins : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPresentationSurface.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the presentation buffer associated with this presentation surface.
     * @param {IPresentationBuffer} presentationBuffer Type: **[IPresentationBuffer](nn-presentation-ipresentationbuffer.md)**
     * 
     * The presentation buffer associated with this presentation surface.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setbuffer
     */
    SetBuffer(presentationBuffer) {
        result := ComCall(4, this, "ptr", presentationBuffer, "HRESULT")
        return result
    }

    /**
     * Sets the type of color space used by the presentation surface.
     * @param {DXGI_COLOR_SPACE_TYPE} colorSpace Type: **[DXGI_COLOR_SPACE_TYPE](/windows/win32/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type)**
     * 
     * The type of color space used by the presentation surface.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setcolorspace
     */
    SetColorSpace(colorSpace) {
        result := ComCall(5, this, DXGI_COLOR_SPACE_TYPE, colorSpace, "HRESULT")
        return result
    }

    /**
     * Sets the transparency behavior of the presentation surface.
     * @param {DXGI_ALPHA_MODE} alphaMode Type: **[DXGI_ALPHA_MODE](/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode)**
     * 
     * The transparency behavior of the presentation surface.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setalphamode
     */
    SetAlphaMode(alphaMode) {
        result := ComCall(6, this, DXGI_ALPHA_MODE, alphaMode, "HRESULT")
        return result
    }

    /**
     * Sets the area of the source presentation buffer to sample from.
     * @param {Pointer<RECT>} sourceRect Type: **[RECT](/windows/win32/api/windef/ns-windef-rect)**
     * 
     * A rectangle that defines the area of the source presentation buffer to sample from.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setsourcerect
     */
    SetSourceRect(sourceRect) {
        result := ComCall(7, this, RECT.Ptr, sourceRect, "HRESULT")
        return result
    }

    /**
     * Sets the transform applied to the source buffer area to define the on-screen area where the buffer will appear.
     * @param {Pointer<PresentationTransform>} transform Type: **[PresentationTransform](../presentationtypes/ns-presentationtypes-presentationtransform.md)**
     * 
     * A transform applied to the source buffer area to define the on-screen area where the buffer will appear.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-settransform
     */
    SetTransform(transform) {
        result := ComCall(8, this, PresentationTransform.Ptr, transform, "HRESULT")
        return result
    }

    /**
     * Restricts presentation to a specific display adapter output.
     * @param {IUnknown} output Type: **[IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown)**
     * 
     * An object that represents the adapter output. Only an [IDXGIOutput](/windows/win32/api/dxgi/nn-dxgi-idxgioutput) is accepted.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-restricttooutput
     */
    RestrictToOutput(output) {
        result := ComCall(9, this, "ptr", output, "HRESULT")
        return result
    }

    /**
     * Sets a flag to disable or enable buffer read back.
     * @remarks
     * Pass `TRUE` to this function to prevent the compositor from ever rendering the buffer into a form of capture (screen capture, window capture, etc.)
     * @param {Integer} value Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if read back is disabled; otherwise, `FALSE`.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setdisablereadback
     */
    SetDisableReadback(value) {
        result := ComCall(10, this, "char", value, "HRESULT")
        return result
    }

    /**
     * Sets the size, in visual space, taken by each letterbox area.
     * @remarks
     * Margins are not affected by the scale component of the transform, but are affected by every other component. Put another way, the margins are applied with the transform applied, but compensate their own size by any scale present in that transform.
     * @param {Float} leftLetterboxSize Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The size of the left margin of the letterbox area.
     * @param {Float} topLetterboxSize Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The size of the top margin of the letterbox area.
     * @param {Float} rightLetterboxSize Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The size of the right margin of the letterbox area.
     * @param {Float} bottomLetterboxSize Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The size of the bottom margin of the letterbox area.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setletterboxingmargins
     */
    SetLetterboxingMargins(leftLetterboxSize, topLetterboxSize, rightLetterboxSize, bottomLetterboxSize) {
        result := ComCall(11, this, "float", leftLetterboxSize, "float", topLetterboxSize, "float", rightLetterboxSize, "float", bottomLetterboxSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPresentationSurface.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBuffer := CallbackCreate(GetMethod(implObj, "SetBuffer"), flags, 2)
        this.vtbl.SetColorSpace := CallbackCreate(GetMethod(implObj, "SetColorSpace"), flags, 2)
        this.vtbl.SetAlphaMode := CallbackCreate(GetMethod(implObj, "SetAlphaMode"), flags, 2)
        this.vtbl.SetSourceRect := CallbackCreate(GetMethod(implObj, "SetSourceRect"), flags, 2)
        this.vtbl.SetTransform := CallbackCreate(GetMethod(implObj, "SetTransform"), flags, 2)
        this.vtbl.RestrictToOutput := CallbackCreate(GetMethod(implObj, "RestrictToOutput"), flags, 2)
        this.vtbl.SetDisableReadback := CallbackCreate(GetMethod(implObj, "SetDisableReadback"), flags, 2)
        this.vtbl.SetLetterboxingMargins := CallbackCreate(GetMethod(implObj, "SetLetterboxingMargins"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBuffer)
        CallbackFree(this.vtbl.SetColorSpace)
        CallbackFree(this.vtbl.SetAlphaMode)
        CallbackFree(this.vtbl.SetSourceRect)
        CallbackFree(this.vtbl.SetTransform)
        CallbackFree(this.vtbl.RestrictToOutput)
        CallbackFree(this.vtbl.SetDisableReadback)
        CallbackFree(this.vtbl.SetLetterboxingMargins)
    }
}
