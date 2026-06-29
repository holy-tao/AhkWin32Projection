#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_TIMED_TEXT_FONT_STYLE.ahk" { MF_TIMED_TEXT_FONT_STYLE }
#Import ".\MFARGB.ahk" { MFARGB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MF_TIMED_TEXT_ALIGNMENT.ahk" { MF_TIMED_TEXT_ALIGNMENT }
#Import ".\MF_TIMED_TEXT_UNIT_TYPE.ahk" { MF_TIMED_TEXT_UNIT_TYPE }

/**
 * Represents the style for timed text.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imftimedtextstyle
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextStyle extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextStyle
     * @type {Guid}
     */
    static IID := Guid("{09b2455d-b834-4f01-a347-9052e21c450e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextStyle interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName                 : IntPtr
        IsExternal              : IntPtr
        GetFontFamily           : IntPtr
        GetFontSize             : IntPtr
        GetColor                : IntPtr
        GetBackgroundColor      : IntPtr
        GetShowBackgroundAlways : IntPtr
        GetFontStyle            : IntPtr
        GetBold                 : IntPtr
        GetRightToLeft          : IntPtr
        GetTextAlignment        : IntPtr
        GetTextDecoration       : IntPtr
        GetTextOutline          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextStyle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the name of the timed-text style.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the name of the style.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &name := 0, "HRESULT")
        return name
    }

    /**
     * Determines whether the timed-text style is external.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the timed-text style is external. If <b>TRUE</b>, the timed-text style is external; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-isexternal
     */
    IsExternal() {
        result := ComCall(4, this, BOOL)
        return result
    }

    /**
     * Gets the font family of the timed-text style.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the font family of the style.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontfamily
     */
    GetFontFamily() {
        result := ComCall(5, this, PWSTR.Ptr, &_fontFamily := 0, "HRESULT")
        return _fontFamily
    }

    /**
     * Gets the font size of the timed-text style.
     * @param {Pointer<Float>} fontSize Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the font size  of the timed-text style.
     * @param {Pointer<MF_TIMED_TEXT_UNIT_TYPE>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text style is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontsize
     */
    GetFontSize(fontSize, unitType) {
        fontSizeMarshal := fontSize is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, fontSizeMarshal, fontSize, unitTypeMarshal, unitType, "HRESULT")
        return result
    }

    /**
     * Gets the color of the timed-text style.
     * @returns {MFARGB} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that describes the color.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getcolor
     */
    GetColor() {
        _color := MFARGB()
        result := ComCall(7, this, MFARGB.Ptr, _color, "HRESULT")
        return _color
    }

    /**
     * Gets the background color of the timed-text style.
     * @returns {MFARGB} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that describes the background color.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getbackgroundcolor
     */
    GetBackgroundColor() {
        bgColor := MFARGB()
        result := ComCall(8, this, MFARGB.Ptr, bgColor, "HRESULT")
        return bgColor
    }

    /**
     * Determines whether the style of timed text always shows the background.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a value that specifies whether the style  of timed text always shows the background. The variable specifies <b>TRUE</b> if the background is always shown; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getshowbackgroundalways
     */
    GetShowBackgroundAlways() {
        result := ComCall(9, this, BOOL.Ptr, &showBackgroundAlways := 0, "HRESULT")
        return showBackgroundAlways
    }

    /**
     * Gets the font style of the timed-text style.
     * @returns {MF_TIMED_TEXT_FONT_STYLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_font_style">MF_TIMED_TEXT_FONT_STYLE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_font_style">MF_TIMED_TEXT_FONT_STYLE</a>-typed value that specifies the font style.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getfontstyle
     */
    GetFontStyle() {
        result := ComCall(10, this, "int*", &_fontStyle := 0, "HRESULT")
        return _fontStyle
    }

    /**
     * Determines whether the style of timed text is bold.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a value that specifies whether the style  of timed text is bold. The variable specifies <b>TRUE</b> if the style is bold; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getbold
     */
    GetBold() {
        result := ComCall(11, this, BOOL.Ptr, &bold := 0, "HRESULT")
        return bold
    }

    /**
     * Determines whether the right to left writing mode of the timed-text style is enabled.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a value that specifies whether the right to left writing mode is enabled. The variable specifies <b>TRUE</b> if the right to left writing mode is enabled; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-getrighttoleft
     */
    GetRightToLeft() {
        result := ComCall(12, this, BOOL.Ptr, &rightToLeft := 0, "HRESULT")
        return rightToLeft
    }

    /**
     * Gets the text alignment of the timed-text style.
     * @returns {MF_TIMED_TEXT_ALIGNMENT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_alignment">MF_TIMED_TEXT_ALIGNMENT</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_alignment">MF_TIMED_TEXT_ALIGNMENT</a>-typed value that specifies the text alignment.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextalignment
     */
    GetTextAlignment() {
        result := ComCall(13, this, "int*", &textAlign := 0, "HRESULT")
        return textAlign
    }

    /**
     * Gets how text is decorated for the timed-text style.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a variable that receives a combination of <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_decoration">MF_TIMED_TEXT_DECORATION</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies how text is decorated.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextdecoration
     */
    GetTextDecoration() {
        result := ComCall(14, this, "uint*", &_textDecoration := 0, "HRESULT")
        return _textDecoration
    }

    /**
     * Gets the text outline for the timed-text style.
     * @param {Pointer<MFARGB>} _color Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that describes the color.
     * @param {Pointer<Float>} thickness Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the thickness.
     * @param {Pointer<Float>} blurRadius Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the blur radius.
     * @param {Pointer<MF_TIMED_TEXT_UNIT_TYPE>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextstyle-gettextoutline
     */
    GetTextOutline(_color, thickness, blurRadius, unitType) {
        thicknessMarshal := thickness is VarRef ? "double*" : "ptr"
        blurRadiusMarshal := blurRadius is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, MFARGB.Ptr, _color, thicknessMarshal, thickness, blurRadiusMarshal, blurRadius, unitTypeMarshal, unitType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFTimedTextStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.IsExternal := CallbackCreate(GetMethod(implObj, "IsExternal"), flags, 1)
        this.vtbl.GetFontFamily := CallbackCreate(GetMethod(implObj, "GetFontFamily"), flags, 2)
        this.vtbl.GetFontSize := CallbackCreate(GetMethod(implObj, "GetFontSize"), flags, 3)
        this.vtbl.GetColor := CallbackCreate(GetMethod(implObj, "GetColor"), flags, 2)
        this.vtbl.GetBackgroundColor := CallbackCreate(GetMethod(implObj, "GetBackgroundColor"), flags, 2)
        this.vtbl.GetShowBackgroundAlways := CallbackCreate(GetMethod(implObj, "GetShowBackgroundAlways"), flags, 2)
        this.vtbl.GetFontStyle := CallbackCreate(GetMethod(implObj, "GetFontStyle"), flags, 2)
        this.vtbl.GetBold := CallbackCreate(GetMethod(implObj, "GetBold"), flags, 2)
        this.vtbl.GetRightToLeft := CallbackCreate(GetMethod(implObj, "GetRightToLeft"), flags, 2)
        this.vtbl.GetTextAlignment := CallbackCreate(GetMethod(implObj, "GetTextAlignment"), flags, 2)
        this.vtbl.GetTextDecoration := CallbackCreate(GetMethod(implObj, "GetTextDecoration"), flags, 2)
        this.vtbl.GetTextOutline := CallbackCreate(GetMethod(implObj, "GetTextOutline"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.IsExternal)
        CallbackFree(this.vtbl.GetFontFamily)
        CallbackFree(this.vtbl.GetFontSize)
        CallbackFree(this.vtbl.GetColor)
        CallbackFree(this.vtbl.GetBackgroundColor)
        CallbackFree(this.vtbl.GetShowBackgroundAlways)
        CallbackFree(this.vtbl.GetFontStyle)
        CallbackFree(this.vtbl.GetBold)
        CallbackFree(this.vtbl.GetRightToLeft)
        CallbackFree(this.vtbl.GetTextAlignment)
        CallbackFree(this.vtbl.GetTextDecoration)
        CallbackFree(this.vtbl.GetTextOutline)
    }
}
