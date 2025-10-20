#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a physical font in a font collection. This interface is used to create font faces from physical fonts, or to retrieve information such as font face metrics or face names from existing font faces.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefont
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFont extends IUnknown{
    /**
     * The interface identifier for IDWriteFont
     * @type {Guid}
     */
    static IID => Guid("{acd16696-8c14-4f5d-877e-fe3fc1d32737}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDWriteFontFamily>} fontFamily 
     * @returns {HRESULT} 
     */
    GetFontFamily(fontFamily) {
        result := ComCall(3, this, "ptr", fontFamily, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetWeight() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStretch() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStyle() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSymbolFont() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteLocalizedStrings>} names 
     * @returns {HRESULT} 
     */
    GetFaceNames(names) {
        result := ComCall(8, this, "ptr", names, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} informationalStringID 
     * @param {Pointer<IDWriteLocalizedStrings>} informationalStrings 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     */
    GetInformationalStrings(informationalStringID, informationalStrings, exists) {
        result := ComCall(9, this, "int", informationalStringID, "ptr", informationalStrings, "ptr", exists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSimulations() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_METRICS>} fontMetrics 
     * @returns {String} Nothing - always returns an empty string
     */
    GetMetrics(fontMetrics) {
        ComCall(11, this, "ptr", fontMetrics)
        return result
    }

    /**
     * 
     * @param {Integer} unicodeValue 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     */
    HasCharacter(unicodeValue, exists) {
        result := ComCall(12, this, "uint", unicodeValue, "ptr", exists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @returns {HRESULT} 
     */
    CreateFontFace(fontFace) {
        result := ComCall(13, this, "ptr", fontFace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
