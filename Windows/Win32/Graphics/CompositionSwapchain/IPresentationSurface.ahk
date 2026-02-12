#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentationContent.ahk

/**
 * Describes an `IPresentationContent` with a single bound buffer, that can be shared with the system compositor and displayed as content in the global visual tree.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nn-presentation-ipresentationsurface
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationSurface extends IPresentationContent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPresentationSurface
     * @type {Guid}
     */
    static IID => Guid("{956710fb-ea40-4eba-a3eb-4375a0eb4edc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBuffer", "SetColorSpace", "SetAlphaMode", "SetSourceRect", "SetTransform", "RestrictToOutput", "SetDisableReadback", "SetLetterboxingMargins"]

    /**
     * Sets the presentation buffer associated with this presentation surface.
     * @param {IPresentationBuffer} presentationBuffer Type: **[IPresentationBuffer](nn-presentation-ipresentationbuffer.md)**
     * 
     * The presentation buffer associated with this presentation surface.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentationsurface-setbuffer
     */
    SetBuffer(presentationBuffer) {
        result := ComCall(4, this, "ptr", presentationBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the type of color space used by the presentation surface.
     * @param {Integer} colorSpace Type: **[DXGI_COLOR_SPACE_TYPE](/windows/win32/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type)**
     * 
     * The type of color space used by the presentation surface.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentationsurface-setcolorspace
     */
    SetColorSpace(colorSpace) {
        result := ComCall(5, this, "int", colorSpace, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the transparency behavior of the presentation surface.
     * @param {Integer} alphaMode Type: **[DXGI_ALPHA_MODE](/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode)**
     * 
     * The transparency behavior of the presentation surface.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentationsurface-setalphamode
     */
    SetAlphaMode(alphaMode) {
        result := ComCall(6, this, "int", alphaMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentationsurface-setsourcerect
     */
    SetSourceRect(sourceRect) {
        result := ComCall(7, this, "ptr", sourceRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentationsurface-settransform
     */
    SetTransform(transform) {
        result := ComCall(8, this, "ptr", transform, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentationsurface-restricttooutput
     */
    RestrictToOutput(output) {
        result := ComCall(9, this, "ptr", output, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentationsurface-setdisablereadback
     */
    SetDisableReadback(value) {
        result := ComCall(10, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentationsurface-setletterboxingmargins
     */
    SetLetterboxingMargins(leftLetterboxSize, topLetterboxSize, rightLetterboxSize, bottomLetterboxSize) {
        result := ComCall(11, this, "float", leftLetterboxSize, "float", topLetterboxSize, "float", rightLetterboxSize, "float", bottomLetterboxSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
