#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITextStrings interface represents a collection of rich-text strings that are useful for manipulating rich text.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextstrings
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextStrings extends IDispatch{
    /**
     * The interface identifier for ITextStrings
     * @type {Guid}
     */
    static IID => Guid("{c241f5e7-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     */
    Item(Index, ppRange) {
        result := ComCall(7, this, "int", Index, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(8, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    Add(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(9, this, "ptr", bstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} pRange 
     * @param {Integer} iString 
     * @returns {HRESULT} 
     */
    Append(pRange, iString) {
        result := ComCall(10, this, "ptr", pRange, "int", iString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @returns {HRESULT} 
     */
    Cat2(iString) {
        result := ComCall(11, this, "int", iString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    CatTop2(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(12, this, "ptr", bstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} pRange 
     * @returns {HRESULT} 
     */
    DeleteRange(pRange) {
        result := ComCall(13, this, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Align 
     * @param {Integer} Char 
     * @param {Integer} Char1 
     * @param {Integer} Char2 
     * @param {Integer} Count 
     * @param {Integer} TeXStyle 
     * @param {Integer} cCol 
     * @param {Pointer<ITextRange2>} pRange 
     * @returns {HRESULT} 
     */
    EncodeFunction(Type, Align, Char, Char1, Char2, Count, TeXStyle, cCol, pRange) {
        result := ComCall(14, this, "int", Type, "int", Align, "int", Char, "int", Char1, "int", Char2, "int", Count, "int", TeXStyle, "int", cCol, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @param {Pointer<Int32>} pcch 
     * @returns {HRESULT} 
     */
    GetCch(iString, pcch) {
        result := ComCall(15, this, "int", iString, "int*", pcch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @returns {HRESULT} 
     */
    InsertNullStr(iString) {
        result := ComCall(16, this, "int", iString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    MoveBoundary(iString, cch) {
        result := ComCall(17, this, "int", iString, "int", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    PrefixTop(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(18, this, "ptr", bstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @param {Integer} cString 
     * @returns {HRESULT} 
     */
    Remove(iString, cString) {
        result := ComCall(19, this, "int", iString, "int", cString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} pRangeD 
     * @param {Pointer<ITextRange2>} pRangeS 
     * @returns {HRESULT} 
     */
    SetFormattedText(pRangeD, pRangeS) {
        result := ComCall(20, this, "ptr", pRangeD, "ptr", pRangeS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @param {Integer} cp 
     * @returns {HRESULT} 
     */
    SetOpCp(iString, cp) {
        result := ComCall(21, this, "int", iString, "int", cp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @param {Pointer<ITextRange2>} pRange 
     * @returns {HRESULT} 
     */
    SuffixTop(bstr, pRange) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(22, this, "ptr", bstr, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Swap() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
