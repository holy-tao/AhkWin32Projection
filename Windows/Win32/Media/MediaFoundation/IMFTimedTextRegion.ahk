#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getname
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return result
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
        result := ComCall(4, this, "double*", pX, "double*", pY, "int*", unitType, "HRESULT")
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
        result := ComCall(5, this, "double*", pWidth, "double*", pHeight, "int*", unitType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} bgColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getbackgroundcolor
     */
    GetBackgroundColor(bgColor) {
        result := ComCall(6, this, "ptr", bgColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} writingMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getwritingmode
     */
    GetWritingMode(writingMode) {
        result := ComCall(7, this, "int*", writingMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} displayAlign 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getdisplayalignment
     */
    GetDisplayAlignment(displayAlign) {
        result := ComCall(8, this, "int*", displayAlign, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pLineHeight 
     * @param {Pointer<Integer>} unitType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getlineheight
     */
    GetLineHeight(pLineHeight, unitType) {
        result := ComCall(9, this, "double*", pLineHeight, "int*", unitType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} clipOverflow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getclipoverflow
     */
    GetClipOverflow(clipOverflow) {
        result := ComCall(10, this, "ptr", clipOverflow, "HRESULT")
        return result
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
        result := ComCall(11, this, "double*", before, "double*", start, "double*", after, "double*", end, "int*", unitType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} wrap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getwrap
     */
    GetWrap(wrap) {
        result := ComCall(12, this, "ptr", wrap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} zIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getzindex
     */
    GetZIndex(zIndex) {
        result := ComCall(13, this, "int*", zIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} scrollMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextregion-getscrollmode
     */
    GetScrollMode(scrollMode) {
        result := ComCall(14, this, "int*", scrollMode, "HRESULT")
        return result
    }
}
