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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPairKerning", "GetPairKerning", "SetCharacterSpacing", "GetCharacterSpacing"]

    /**
     * Enables or disables pair-kerning on a given text range.
     * @param {BOOL} isPairKerningEnabled Type: <b>BOOL</b>
     * 
     * The flag that indicates whether text is pair-kerned.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * The text range to which the change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextlayout1-setpairkerning
     */
    SetPairKerning(isPairKerningEnabled, textRange) {
        result := ComCall(67, this, "int", isPairKerningEnabled, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets whether or not pair-kerning is enabled at given position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The current text position.
     * @param {Pointer<BOOL>} isPairKerningEnabled Type: <b>BOOL*</b>
     * 
     * The flag that indicates whether text is pair-kerned.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The position range of the current format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextlayout1-getpairkerning
     */
    GetPairKerning(currentPosition, isPairKerningEnabled, textRange) {
        isPairKerningEnabledMarshal := isPairKerningEnabled is VarRef ? "int*" : "ptr"

        result := ComCall(68, this, "uint", currentPosition, isPairKerningEnabledMarshal, isPairKerningEnabled, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets the spacing between characters.
     * @param {Float} leadingSpacing Type: <b>FLOAT</b>
     * 
     * The spacing before each character, in reading order.
     * @param {Float} trailingSpacing Type: <b>FLOAT</b>
     * 
     * The spacing after each character, in reading order.
     * @param {Float} minimumAdvanceWidth Type: <b>FLOAT</b>
     * 
     * The minimum advance of each character, to prevent characters from becoming too thin or zero-width. This
     *     must be zero or greater.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextlayout1-setcharacterspacing
     */
    SetCharacterSpacing(leadingSpacing, trailingSpacing, minimumAdvanceWidth, textRange) {
        result := ComCall(69, this, "float", leadingSpacing, "float", trailingSpacing, "float", minimumAdvanceWidth, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the spacing between characters.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The current text position.
     * @param {Pointer<Float>} leadingSpacing Type: <b>FLOAT*</b>
     * 
     * The spacing before each character, in reading order.
     * @param {Pointer<Float>} trailingSpacing Type: <b>FLOAT*</b>
     * 
     * The spacing after each character, in reading order.
     * @param {Pointer<Float>} minimumAdvanceWidth Type: <b>FLOAT*</b>
     * 
     * The minimum advance of each character, to prevent characters from becoming too thin or zero-width. This must be zero or greater.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The position range of the current format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextlayout1-getcharacterspacing
     */
    GetCharacterSpacing(currentPosition, leadingSpacing, trailingSpacing, minimumAdvanceWidth, textRange) {
        leadingSpacingMarshal := leadingSpacing is VarRef ? "float*" : "ptr"
        trailingSpacingMarshal := trailingSpacing is VarRef ? "float*" : "ptr"
        minimumAdvanceWidthMarshal := minimumAdvanceWidth is VarRef ? "float*" : "ptr"

        result := ComCall(70, this, "uint", currentPosition, leadingSpacingMarshal, leadingSpacing, trailingSpacingMarshal, trailingSpacing, minimumAdvanceWidthMarshal, minimumAdvanceWidth, "ptr", textRange, "HRESULT")
        return result
    }
}
