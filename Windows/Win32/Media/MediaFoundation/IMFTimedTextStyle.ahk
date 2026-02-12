#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFARGB.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the style for timed text.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nn-mfmediaengine-imftimedtextstyle
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
     * Gets the name of the timed-text style.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the name of the style.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * Determines whether the timed-text style is external.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the timed-text style is external. If <b>TRUE</b>, the timed-text style is external; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-isexternal
     */
    IsExternal() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Gets the font family of the timed-text style.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontfamily
     */
    GetFontFamily() {
        result := ComCall(5, this, "ptr*", &fontFamily_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontFamily_
    }

    /**
     * Gets the font size of the timed-text style.
     * @param {Pointer<Float>} fontSize Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the font size  of the timed-text style.
     * @param {Pointer<Integer>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text style is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontsize
     */
    GetFontSize(fontSize, unitType) {
        fontSizeMarshal := fontSize is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, fontSizeMarshal, fontSize, unitTypeMarshal, unitType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the color of the timed-text style.
     * @returns {MFARGB} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getcolor
     */
    GetColor() {
        color_ := MFARGB()
        result := ComCall(7, this, "ptr", color_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return color_
    }

    /**
     * Gets the background color of the timed-text style.
     * @returns {MFARGB} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that describes the background color.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getbackgroundcolor
     */
    GetBackgroundColor() {
        bgColor := MFARGB()
        result := ComCall(8, this, "ptr", bgColor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bgColor
    }

    /**
     * Determines whether the style of timed text always shows the background.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a value that specifies whether the style  of timed text always shows the background. The variable specifies <b>TRUE</b> if the background is always shown; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getshowbackgroundalways
     */
    GetShowBackgroundAlways() {
        result := ComCall(9, this, "int*", &showBackgroundAlways := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return showBackgroundAlways
    }

    /**
     * Gets the font style of the timed-text style.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontstyle
     */
    GetFontStyle() {
        result := ComCall(10, this, "int*", &fontStyle_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontStyle_
    }

    /**
     * Determines whether the style of timed text is bold.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a value that specifies whether the style  of timed text is bold. The variable specifies <b>TRUE</b> if the style is bold; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getbold
     */
    GetBold() {
        result := ComCall(11, this, "int*", &bold := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bold
    }

    /**
     * Determines whether the right to left writing mode of the timed-text style is enabled.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a value that specifies whether the right to left writing mode is enabled. The variable specifies <b>TRUE</b> if the right to left writing mode is enabled; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getrighttoleft
     */
    GetRightToLeft() {
        result := ComCall(12, this, "int*", &rightToLeft := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return rightToLeft
    }

    /**
     * Gets the text alignment of the timed-text style.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_alignment">MF_TIMED_TEXT_ALIGNMENT</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_alignment">MF_TIMED_TEXT_ALIGNMENT</a>-typed value that specifies the text alignment.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextalignment
     */
    GetTextAlignment() {
        result := ComCall(13, this, "int*", &textAlign := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return textAlign
    }

    /**
     * Gets how text is decorated for the timed-text style.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextdecoration
     */
    GetTextDecoration() {
        result := ComCall(14, this, "uint*", &textDecoration_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return textDecoration_
    }

    /**
     * Gets the text outline for the timed-text style.
     * @param {Pointer<MFARGB>} color_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that describes the color.
     * @param {Pointer<Float>} thickness Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the thickness.
     * @param {Pointer<Float>} blurRadius Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the blur radius.
     * @param {Pointer<Integer>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextoutline
     */
    GetTextOutline(color_, thickness, blurRadius, unitType) {
        thicknessMarshal := thickness is VarRef ? "double*" : "ptr"
        blurRadiusMarshal := blurRadius is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "ptr", color_, thicknessMarshal, thickness, blurRadiusMarshal, blurRadius, unitTypeMarshal, unitType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
