#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_TIMED_TEXT_UNIT_TYPE.ahk" { MF_TIMED_TEXT_UNIT_TYPE }
#Import ".\MFARGB.ahk" { MFARGB }
#Import ".\MF_TIMED_TEXT_SCROLL_MODE.ahk" { MF_TIMED_TEXT_SCROLL_MODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MF_TIMED_TEXT_WRITING_MODE.ahk" { MF_TIMED_TEXT_WRITING_MODE }
#Import ".\MF_TIMED_TEXT_DISPLAY_ALIGNMENT.ahk" { MF_TIMED_TEXT_DISPLAY_ALIGNMENT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the display region of a timed-text object.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imftimedtextregion
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextRegion extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextRegion
     * @type {Guid}
     */
    static IID := Guid("{c8d22afc-bc47-4bdf-9b04-787e49ce3f58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextRegion interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName             : IntPtr
        GetPosition         : IntPtr
        GetExtent           : IntPtr
        GetBackgroundColor  : IntPtr
        GetWritingMode      : IntPtr
        GetDisplayAlignment : IntPtr
        GetLineHeight       : IntPtr
        GetClipOverflow     : IntPtr
        GetPadding          : IntPtr
        GetWrap             : IntPtr
        GetZIndex           : IntPtr
        GetScrollMode       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextRegion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the name of the region.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the name of the region.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &name := 0, "HRESULT")
        return name
    }

    /**
     * Gets the position of the region.
     * @param {Pointer<Float>} pX Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the X-coordinate of the position.
     * @param {Pointer<Float>} pY Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the Y-coordinate of the position.
     * @param {Pointer<MF_TIMED_TEXT_UNIT_TYPE>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text region is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getposition
     */
    GetPosition(pX, pY, unitType) {
        pXMarshal := pX is VarRef ? "double*" : "ptr"
        pYMarshal := pY is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pXMarshal, pX, pYMarshal, pY, unitTypeMarshal, unitType, "HRESULT")
        return result
    }

    /**
     * Gets the extent of the region.
     * @param {Pointer<Float>} pWidth Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the width of the region.
     * @param {Pointer<Float>} pHeight Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the height of the region.
     * @param {Pointer<MF_TIMED_TEXT_UNIT_TYPE>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text region is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getextent
     */
    GetExtent(pWidth, pHeight, unitType) {
        pWidthMarshal := pWidth is VarRef ? "double*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, unitTypeMarshal, unitType, "HRESULT")
        return result
    }

    /**
     * Gets the background color of the region.
     * @returns {MFARGB} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that describes the background color.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getbackgroundcolor
     */
    GetBackgroundColor() {
        bgColor := MFARGB()
        result := ComCall(6, this, MFARGB.Ptr, bgColor, "HRESULT")
        return bgColor
    }

    /**
     * Gets the writing mode of the region.
     * @returns {MF_TIMED_TEXT_WRITING_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_writing_mode">MF_TIMED_TEXT_WRITING_MODE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_writing_mode">MF_TIMED_TEXT_WRITING_MODE</a>-typed value that specifies the writing mode of the region.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getwritingmode
     */
    GetWritingMode() {
        result := ComCall(7, this, "int*", &writingMode := 0, "HRESULT")
        return writingMode
    }

    /**
     * Gets the display alignment of the region.
     * @returns {MF_TIMED_TEXT_DISPLAY_ALIGNMENT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_display_alignment">MF_TIMED_TEXT_DISPLAY_ALIGNMENT</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_display_alignment">MF_TIMED_TEXT_DISPLAY_ALIGNMENT</a>-typed value that specifies the display alignment of the region.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getdisplayalignment
     */
    GetDisplayAlignment() {
        result := ComCall(8, this, "int*", &displayAlign := 0, "HRESULT")
        return displayAlign
    }

    /**
     * Gets the height of each line of text in the region.
     * @param {Pointer<Float>} pLineHeight Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the height of each line of text in the region.
     * @param {Pointer<MF_TIMED_TEXT_UNIT_TYPE>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text region is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getlineheight
     */
    GetLineHeight(pLineHeight, unitType) {
        pLineHeightMarshal := pLineHeight is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pLineHeightMarshal, pLineHeight, unitTypeMarshal, unitType, "HRESULT")
        return result
    }

    /**
     * Determines whether a clip of text overflowed the region.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a value that specifies whether a clip of text overflowed the region. The variable specifies <b>TRUE</b> if the clip overflowed; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getclipoverflow
     */
    GetClipOverflow() {
        result := ComCall(10, this, BOOL.Ptr, &clipOverflow := 0, "HRESULT")
        return clipOverflow
    }

    /**
     * Gets the padding that surrounds the region.
     * @param {Pointer<Float>} before Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the padding before the start of the region.
     * @param {Pointer<Float>} start Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the start of the region.
     * @param {Pointer<Float>} after Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the padding after the end of the region.
     * @param {Pointer<Float>} end Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the end of the region.
     * @param {Pointer<MF_TIMED_TEXT_UNIT_TYPE>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text region is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getpadding
     */
    GetPadding(before, start, after, end, unitType) {
        beforeMarshal := before is VarRef ? "double*" : "ptr"
        startMarshal := start is VarRef ? "double*" : "ptr"
        afterMarshal := after is VarRef ? "double*" : "ptr"
        endMarshal := end is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, beforeMarshal, before, startMarshal, start, afterMarshal, after, endMarshal, end, unitTypeMarshal, unitType, "HRESULT")
        return result
    }

    /**
     * Determines whether the word wrap feature is enabled in the region.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a value that specifies whether the word wrap feature is enabled in the region. The variable specifies <b>TRUE</b> if word wrap is enabled; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getwrap
     */
    GetWrap() {
        result := ComCall(12, this, BOOL.Ptr, &wrap := 0, "HRESULT")
        return wrap
    }

    /**
     * Gets the Z-index (depth) of the region.
     * @returns {Integer} Type: <b>INT32*</b>
     * 
     * A pointer to a variable that receives the Z-index (depth) of the region.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getzindex
     */
    GetZIndex() {
        result := ComCall(13, this, "int*", &zIndex := 0, "HRESULT")
        return zIndex
    }

    /**
     * Gets the scroll mode of the region.
     * @returns {MF_TIMED_TEXT_SCROLL_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_scroll_mode">MF_TIMED_TEXT_SCROLL_MODE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_scroll_mode">MF_TIMED_TEXT_SCROLL_MODE</a>-typed value that specifies the scroll mode of the region.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getscrollmode
     */
    GetScrollMode() {
        result := ComCall(14, this, "int*", &scrollMode := 0, "HRESULT")
        return scrollMode
    }

    Query(iid) {
        if (IMFTimedTextRegion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetPosition := CallbackCreate(GetMethod(implObj, "GetPosition"), flags, 4)
        this.vtbl.GetExtent := CallbackCreate(GetMethod(implObj, "GetExtent"), flags, 4)
        this.vtbl.GetBackgroundColor := CallbackCreate(GetMethod(implObj, "GetBackgroundColor"), flags, 2)
        this.vtbl.GetWritingMode := CallbackCreate(GetMethod(implObj, "GetWritingMode"), flags, 2)
        this.vtbl.GetDisplayAlignment := CallbackCreate(GetMethod(implObj, "GetDisplayAlignment"), flags, 2)
        this.vtbl.GetLineHeight := CallbackCreate(GetMethod(implObj, "GetLineHeight"), flags, 3)
        this.vtbl.GetClipOverflow := CallbackCreate(GetMethod(implObj, "GetClipOverflow"), flags, 2)
        this.vtbl.GetPadding := CallbackCreate(GetMethod(implObj, "GetPadding"), flags, 6)
        this.vtbl.GetWrap := CallbackCreate(GetMethod(implObj, "GetWrap"), flags, 2)
        this.vtbl.GetZIndex := CallbackCreate(GetMethod(implObj, "GetZIndex"), flags, 2)
        this.vtbl.GetScrollMode := CallbackCreate(GetMethod(implObj, "GetScrollMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetPosition)
        CallbackFree(this.vtbl.GetExtent)
        CallbackFree(this.vtbl.GetBackgroundColor)
        CallbackFree(this.vtbl.GetWritingMode)
        CallbackFree(this.vtbl.GetDisplayAlignment)
        CallbackFree(this.vtbl.GetLineHeight)
        CallbackFree(this.vtbl.GetClipOverflow)
        CallbackFree(this.vtbl.GetPadding)
        CallbackFree(this.vtbl.GetWrap)
        CallbackFree(this.vtbl.GetZIndex)
        CallbackFree(this.vtbl.GetScrollMode)
    }
}
