#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFARGB.ahk
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontfamily
     */
    GetFontFamily() {
        result := ComCall(5, this, "ptr*", &fontFamily := 0, "HRESULT")
        return fontFamily
    }

    /**
     * 
     * @param {Pointer<Float>} fontSize 
     * @param {Pointer<Integer>} unitType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontsize
     */
    GetFontSize(fontSize, unitType) {
        fontSizeMarshal := fontSize is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, fontSizeMarshal, fontSize, unitTypeMarshal, unitType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {MFARGB} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getcolor
     */
    GetColor() {
        color := MFARGB()
        result := ComCall(7, this, "ptr", color, "HRESULT")
        return color
    }

    /**
     * 
     * @returns {MFARGB} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getbackgroundcolor
     */
    GetBackgroundColor() {
        bgColor := MFARGB()
        result := ComCall(8, this, "ptr", bgColor, "HRESULT")
        return bgColor
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getshowbackgroundalways
     */
    GetShowBackgroundAlways() {
        result := ComCall(9, this, "int*", &showBackgroundAlways := 0, "HRESULT")
        return showBackgroundAlways
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontstyle
     */
    GetFontStyle() {
        result := ComCall(10, this, "int*", &fontStyle := 0, "HRESULT")
        return fontStyle
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getbold
     */
    GetBold() {
        result := ComCall(11, this, "int*", &bold := 0, "HRESULT")
        return bold
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getrighttoleft
     */
    GetRightToLeft() {
        result := ComCall(12, this, "int*", &rightToLeft := 0, "HRESULT")
        return rightToLeft
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextalignment
     */
    GetTextAlignment() {
        result := ComCall(13, this, "int*", &textAlign := 0, "HRESULT")
        return textAlign
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextdecoration
     */
    GetTextDecoration() {
        result := ComCall(14, this, "uint*", &textDecoration := 0, "HRESULT")
        return textDecoration
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
        thicknessMarshal := thickness is VarRef ? "double*" : "ptr"
        blurRadiusMarshal := blurRadius is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "ptr", color, thicknessMarshal, thickness, blurRadiusMarshal, blurRadius, unitTypeMarshal, unitType, "HRESULT")
        return result
    }
}
