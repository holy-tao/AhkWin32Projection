#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentationContent.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationsurface
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
     * 
     * @param {IPresentationBuffer} presentationBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setbuffer
     */
    SetBuffer(presentationBuffer) {
        result := ComCall(4, this, "ptr", presentationBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} colorSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setcolorspace
     */
    SetColorSpace(colorSpace) {
        result := ComCall(5, this, "int", colorSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} alphaMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setalphamode
     */
    SetAlphaMode(alphaMode) {
        result := ComCall(6, this, "int", alphaMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} sourceRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setsourcerect
     */
    SetSourceRect(sourceRect) {
        result := ComCall(7, this, "ptr", sourceRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PresentationTransform>} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-settransform
     */
    SetTransform(transform) {
        result := ComCall(8, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} output 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-restricttooutput
     */
    RestrictToOutput(output) {
        result := ComCall(9, this, "ptr", output, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setdisablereadback
     */
    SetDisableReadback(value) {
        result := ComCall(10, this, "char", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} leftLetterboxSize 
     * @param {Float} topLetterboxSize 
     * @param {Float} rightLetterboxSize 
     * @param {Float} bottomLetterboxSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationsurface-setletterboxingmargins
     */
    SetLetterboxingMargins(leftLetterboxSize, topLetterboxSize, rightLetterboxSize, bottomLetterboxSize) {
        result := ComCall(11, this, "float", leftLetterboxSize, "float", topLetterboxSize, "float", rightLetterboxSize, "float", bottomLetterboxSize, "HRESULT")
        return result
    }
}
