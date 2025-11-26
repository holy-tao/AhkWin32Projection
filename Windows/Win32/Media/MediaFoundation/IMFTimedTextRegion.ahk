#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFARGB.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the display region of a timed-text object.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtextregion
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextRegion extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedTextRegion
     * @type {Guid}
     */
    static IID => Guid("{c8d22afc-bc47-4bdf-9b04-787e49ce3f58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetPosition", "GetExtent", "GetBackgroundColor", "GetWritingMode", "GetDisplayAlignment", "GetLineHeight", "GetClipOverflow", "GetPadding", "GetWrap", "GetZIndex", "GetScrollMode"]

    /**
     * Gets the name of the region.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the name of the region.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
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
     * @param {Pointer<Integer>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text region is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getposition
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
     * @param {Pointer<Integer>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text region is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getextent
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
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getbackgroundcolor
     */
    GetBackgroundColor() {
        bgColor := MFARGB()
        result := ComCall(6, this, "ptr", bgColor, "HRESULT")
        return bgColor
    }

    /**
     * Gets the writing mode of the region.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_writing_mode">MF_TIMED_TEXT_WRITING_MODE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_writing_mode">MF_TIMED_TEXT_WRITING_MODE</a>-typed value that specifies the writing mode of the region.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getwritingmode
     */
    GetWritingMode() {
        result := ComCall(7, this, "int*", &writingMode := 0, "HRESULT")
        return writingMode
    }

    /**
     * Gets the display alignment of the region.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_display_alignment">MF_TIMED_TEXT_DISPLAY_ALIGNMENT</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_display_alignment">MF_TIMED_TEXT_DISPLAY_ALIGNMENT</a>-typed value that specifies the display alignment of the region.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getdisplayalignment
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
     * @param {Pointer<Integer>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text region is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getlineheight
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
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getclipoverflow
     */
    GetClipOverflow() {
        result := ComCall(10, this, "int*", &clipOverflow := 0, "HRESULT")
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
     * @param {Pointer<Integer>} unitType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type">MF_TIMED_TEXT_UNIT_TYPE</a>-typed value that specifies the units in which the timed-text region is measured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getpadding
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
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getwrap
     */
    GetWrap() {
        result := ComCall(12, this, "int*", &wrap := 0, "HRESULT")
        return wrap
    }

    /**
     * Gets the Z-index (depth) of the region.
     * @returns {Integer} Type: <b>INT32*</b>
     * 
     * A pointer to a variable that receives the Z-index (depth) of the region.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getzindex
     */
    GetZIndex() {
        result := ComCall(13, this, "int*", &zIndex := 0, "HRESULT")
        return zIndex
    }

    /**
     * Gets the scroll mode of the region.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_scroll_mode">MF_TIMED_TEXT_SCROLL_MODE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_scroll_mode">MF_TIMED_TEXT_SCROLL_MODE</a>-typed value that specifies the scroll mode of the region.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextregion-getscrollmode
     */
    GetScrollMode() {
        result := ComCall(14, this, "int*", &scrollMode := 0, "HRESULT")
        return scrollMode
    }
}
