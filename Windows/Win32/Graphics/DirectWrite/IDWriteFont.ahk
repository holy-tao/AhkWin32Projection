#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFamily.ahk
#Include .\IDWriteLocalizedStrings.ahk
#Include .\IDWriteFontFace.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a physical font in a font collection. This interface is used to create font faces from physical fonts, or to retrieve information such as font face metrics or face names from existing font faces.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefont
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFont extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontFamily", "GetWeight", "GetStretch", "GetStyle", "IsSymbolFont", "GetFaceNames", "GetInformationalStrings", "GetSimulations", "GetMetrics", "HasCharacter", "CreateFontFace"]

    /**
     * 
     * @returns {IDWriteFontFamily} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getfontfamily
     */
    GetFontFamily() {
        result := ComCall(3, this, "ptr*", &fontFamily := 0, "HRESULT")
        return IDWriteFontFamily(fontFamily)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getweight
     */
    GetWeight() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getstretch
     */
    GetStretch() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getstyle
     */
    GetStyle() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-issymbolfont
     */
    IsSymbolFont() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @returns {IDWriteLocalizedStrings} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getfacenames
     */
    GetFaceNames() {
        result := ComCall(8, this, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * 
     * @param {Integer} informationalStringID 
     * @param {Pointer<IDWriteLocalizedStrings>} informationalStrings 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getinformationalstrings
     */
    GetInformationalStrings(informationalStringID, informationalStrings, exists) {
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", informationalStringID, "ptr*", informationalStrings, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getsimulations
     */
    GetSimulations() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_METRICS>} fontMetrics 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(11, this, "ptr", fontMetrics)
    }

    /**
     * 
     * @param {Integer} unicodeValue 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-hascharacter
     */
    HasCharacter(unicodeValue) {
        result := ComCall(12, this, "uint", unicodeValue, "int*", &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @returns {IDWriteFontFace} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-createfontface
     */
    CreateFontFace() {
        result := ComCall(13, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace(fontFace)
    }
}
