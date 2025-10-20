#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextLayout.ahk

/**
 * Represents a block of text after it has been fully analyzed and formatted.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritetextlayout1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextLayout1 extends IDWriteTextLayout{
    /**
     * The interface identifier for IDWriteTextLayout1
     * @type {Guid}
     */
    static IID => Guid("{9064d822-80a7-465c-a986-df65f78b8feb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 67

    /**
     * 
     * @param {BOOL} isPairKerningEnabled 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetPairKerning(isPairKerningEnabled, textRange) {
        result := ComCall(67, this, "int", isPairKerningEnabled, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<BOOL>} isPairKerningEnabled 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetPairKerning(currentPosition, isPairKerningEnabled, textRange) {
        result := ComCall(68, this, "uint", currentPosition, "ptr", isPairKerningEnabled, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} leadingSpacing 
     * @param {Float} trailingSpacing 
     * @param {Float} minimumAdvanceWidth 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetCharacterSpacing(leadingSpacing, trailingSpacing, minimumAdvanceWidth, textRange) {
        result := ComCall(69, this, "float", leadingSpacing, "float", trailingSpacing, "float", minimumAdvanceWidth, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Single>} leadingSpacing 
     * @param {Pointer<Single>} trailingSpacing 
     * @param {Pointer<Single>} minimumAdvanceWidth 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetCharacterSpacing(currentPosition, leadingSpacing, trailingSpacing, minimumAdvanceWidth, textRange) {
        result := ComCall(70, this, "uint", currentPosition, "float*", leadingSpacing, "float*", trailingSpacing, "float*", minimumAdvanceWidth, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
