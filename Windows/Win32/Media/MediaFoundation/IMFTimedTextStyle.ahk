#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the style for timed text.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtextstyle
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextStyle extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedTextStyle
     * @type {Guid}
     */
    static IID => Guid("{09b2455d-b834-4f01-a347-9052e21c450e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "IsExternal", "GetFontFamily", "GetFontSize", "GetColor", "GetBackgroundColor", "GetShowBackgroundAlways", "GetFontStyle", "GetBold", "GetRightToLeft", "GetTextAlignment", "GetTextDecoration", "GetTextOutline"]

    /**
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getname
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-isexternal
     */
    IsExternal() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} fontFamily 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontfamily
     */
    GetFontFamily(fontFamily) {
        result := ComCall(5, this, "ptr", fontFamily, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} fontSize 
     * @param {Pointer<Integer>} unitType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontsize
     */
    GetFontSize(fontSize, unitType) {
        result := ComCall(6, this, "double*", fontSize, "int*", unitType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getcolor
     */
    GetColor(color) {
        result := ComCall(7, this, "ptr", color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} bgColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getbackgroundcolor
     */
    GetBackgroundColor(bgColor) {
        result := ComCall(8, this, "ptr", bgColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} showBackgroundAlways 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getshowbackgroundalways
     */
    GetShowBackgroundAlways(showBackgroundAlways) {
        result := ComCall(9, this, "ptr", showBackgroundAlways, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} fontStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontstyle
     */
    GetFontStyle(fontStyle) {
        result := ComCall(10, this, "int*", fontStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} bold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getbold
     */
    GetBold(bold) {
        result := ComCall(11, this, "ptr", bold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} rightToLeft 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getrighttoleft
     */
    GetRightToLeft(rightToLeft) {
        result := ComCall(12, this, "ptr", rightToLeft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} textAlign 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextalignment
     */
    GetTextAlignment(textAlign) {
        result := ComCall(13, this, "int*", textAlign, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} textDecoration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextdecoration
     */
    GetTextDecoration(textDecoration) {
        result := ComCall(14, this, "uint*", textDecoration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} color 
     * @param {Pointer<Float>} thickness 
     * @param {Pointer<Float>} blurRadius 
     * @param {Pointer<Integer>} unitType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextoutline
     */
    GetTextOutline(color, thickness, blurRadius, unitType) {
        result := ComCall(15, this, "ptr", color, "double*", thickness, "double*", blurRadius, "int*", unitType, "HRESULT")
        return result
    }
}
