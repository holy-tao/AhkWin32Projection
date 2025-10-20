#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentationContent.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationSurface extends IPresentationContent{
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
     * 
     * @param {Pointer<IPresentationBuffer>} presentationBuffer 
     * @returns {HRESULT} 
     */
    SetBuffer(presentationBuffer) {
        result := ComCall(4, this, "ptr", presentationBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The SetColorSpace function defines the input color space for a given device context.
     * @param {Integer} colorSpace 
     * @returns {HRESULT} If this function succeeds, the return value is a handle to the <i>hColorSpace</i> being replaced.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setcolorspace
     */
    SetColorSpace(colorSpace) {
        result := ComCall(5, this, "int", colorSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} alphaMode 
     * @returns {HRESULT} 
     */
    SetAlphaMode(alphaMode) {
        result := ComCall(6, this, "int", alphaMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} sourceRect 
     * @returns {HRESULT} 
     */
    SetSourceRect(sourceRect) {
        result := ComCall(7, this, "ptr", sourceRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PresentationTransform>} transform 
     * @returns {HRESULT} 
     */
    SetTransform(transform) {
        result := ComCall(8, this, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} output 
     * @returns {HRESULT} 
     */
    RestrictToOutput(output) {
        result := ComCall(9, this, "ptr", output, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetDisableReadback(value) {
        result := ComCall(10, this, "char", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} leftLetterboxSize 
     * @param {Float} topLetterboxSize 
     * @param {Float} rightLetterboxSize 
     * @param {Float} bottomLetterboxSize 
     * @returns {HRESULT} 
     */
    SetLetterboxingMargins(leftLetterboxSize, topLetterboxSize, rightLetterboxSize, bottomLetterboxSize) {
        result := ComCall(11, this, "float", leftLetterboxSize, "float", topLetterboxSize, "float", rightLetterboxSize, "float", bottomLetterboxSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
