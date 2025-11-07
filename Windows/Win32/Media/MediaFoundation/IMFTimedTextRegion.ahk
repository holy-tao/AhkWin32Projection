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
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * 
     * @param {Pointer<Float>} pX 
     * @param {Pointer<Float>} pY 
     * @param {Pointer<Integer>} unitType 
     * @returns {HRESULT} 
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
     * 
     * @param {Pointer<Float>} pWidth 
     * @param {Pointer<Float>} pHeight 
     * @param {Pointer<Integer>} unitType 
     * @returns {HRESULT} 
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
     * 
     * @returns {MFARGB} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getbackgroundcolor
     */
    GetBackgroundColor() {
        bgColor := MFARGB()
        result := ComCall(6, this, "ptr", bgColor, "HRESULT")
        return bgColor
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getwritingmode
     */
    GetWritingMode() {
        result := ComCall(7, this, "int*", &writingMode := 0, "HRESULT")
        return writingMode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getdisplayalignment
     */
    GetDisplayAlignment() {
        result := ComCall(8, this, "int*", &displayAlign := 0, "HRESULT")
        return displayAlign
    }

    /**
     * 
     * @param {Pointer<Float>} pLineHeight 
     * @param {Pointer<Integer>} unitType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getlineheight
     */
    GetLineHeight(pLineHeight, unitType) {
        pLineHeightMarshal := pLineHeight is VarRef ? "double*" : "ptr"
        unitTypeMarshal := unitType is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pLineHeightMarshal, pLineHeight, unitTypeMarshal, unitType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getclipoverflow
     */
    GetClipOverflow() {
        result := ComCall(10, this, "int*", &clipOverflow := 0, "HRESULT")
        return clipOverflow
    }

    /**
     * 
     * @param {Pointer<Float>} before 
     * @param {Pointer<Float>} start 
     * @param {Pointer<Float>} after 
     * @param {Pointer<Float>} end 
     * @param {Pointer<Integer>} unitType 
     * @returns {HRESULT} 
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
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getwrap
     */
    GetWrap() {
        result := ComCall(12, this, "int*", &wrap := 0, "HRESULT")
        return wrap
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getzindex
     */
    GetZIndex() {
        result := ComCall(13, this, "int*", &zIndex := 0, "HRESULT")
        return zIndex
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getscrollmode
     */
    GetScrollMode() {
        result := ComCall(14, this, "int*", &scrollMode := 0, "HRESULT")
        return scrollMode
    }
}
