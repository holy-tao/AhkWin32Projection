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
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pX 
     * @param {Pointer<Double>} pY 
     * @param {Pointer<Int32>} unitType 
     * @returns {HRESULT} 
     */
    GetPosition(pX, pY, unitType) {
        result := ComCall(4, this, "double*", pX, "double*", pY, "int*", unitType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pWidth 
     * @param {Pointer<Double>} pHeight 
     * @param {Pointer<Int32>} unitType 
     * @returns {HRESULT} 
     */
    GetExtent(pWidth, pHeight, unitType) {
        result := ComCall(5, this, "double*", pWidth, "double*", pHeight, "int*", unitType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} bgColor 
     * @returns {HRESULT} 
     */
    GetBackgroundColor(bgColor) {
        result := ComCall(6, this, "ptr", bgColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} writingMode 
     * @returns {HRESULT} 
     */
    GetWritingMode(writingMode) {
        result := ComCall(7, this, "int*", writingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} displayAlign 
     * @returns {HRESULT} 
     */
    GetDisplayAlignment(displayAlign) {
        result := ComCall(8, this, "int*", displayAlign, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pLineHeight 
     * @param {Pointer<Int32>} unitType 
     * @returns {HRESULT} 
     */
    GetLineHeight(pLineHeight, unitType) {
        result := ComCall(9, this, "double*", pLineHeight, "int*", unitType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} clipOverflow 
     * @returns {HRESULT} 
     */
    GetClipOverflow(clipOverflow) {
        result := ComCall(10, this, "ptr", clipOverflow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} before 
     * @param {Pointer<Double>} start 
     * @param {Pointer<Double>} after 
     * @param {Pointer<Double>} end 
     * @param {Pointer<Int32>} unitType 
     * @returns {HRESULT} 
     */
    GetPadding(before, start, after, end, unitType) {
        result := ComCall(11, this, "double*", before, "double*", start, "double*", after, "double*", end, "int*", unitType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} wrap 
     * @returns {HRESULT} 
     */
    GetWrap(wrap) {
        result := ComCall(12, this, "ptr", wrap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} zIndex 
     * @returns {HRESULT} 
     */
    GetZIndex(zIndex) {
        result := ComCall(13, this, "int*", zIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} scrollMode 
     * @returns {HRESULT} 
     */
    GetScrollMode(scrollMode) {
        result := ComCall(14, this, "int*", scrollMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
