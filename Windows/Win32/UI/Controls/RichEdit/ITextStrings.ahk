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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item", "GetCount", "Add", "Append", "Cat2", "CatTop2", "DeleteRange", "EncodeFunction", "GetCch", "InsertNullStr", "MoveBoundary", "PrefixTop", "Remove", "SetFormattedText", "SetOpCp", "SuffixTop", "Swap"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-item
     */
    Item(Index, ppRange) {
        result := ComCall(7, this, "int", Index, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-getcount
     */
    GetCount(pCount) {
        result := ComCall(8, this, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-add
     */
    Add(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(9, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextRange2} pRange 
     * @param {Integer} iString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-append
     */
    Append(pRange, iString) {
        result := ComCall(10, this, "ptr", pRange, "int", iString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-cat2
     */
    Cat2(iString) {
        result := ComCall(11, this, "int", iString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-cattop2
     */
    CatTop2(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(12, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextRange2} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-deleterange
     */
    DeleteRange(pRange) {
        result := ComCall(13, this, "ptr", pRange, "HRESULT")
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
     * @param {ITextRange2} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-encodefunction
     */
    EncodeFunction(Type, Align, Char, Char1, Char2, Count, TeXStyle, cCol, pRange) {
        result := ComCall(14, this, "int", Type, "int", Align, "int", Char, "int", Char1, "int", Char2, "int", Count, "int", TeXStyle, "int", cCol, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @param {Pointer<Integer>} pcch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-getcch
     */
    GetCch(iString, pcch) {
        result := ComCall(15, this, "int", iString, "int*", pcch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-insertnullstr
     */
    InsertNullStr(iString) {
        result := ComCall(16, this, "int", iString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-moveboundary
     */
    MoveBoundary(iString, cch) {
        result := ComCall(17, this, "int", iString, "int", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-prefixtop
     */
    PrefixTop(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(18, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @param {Integer} cString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-remove
     */
    Remove(iString, cString) {
        result := ComCall(19, this, "int", iString, "int", cString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextRange2} pRangeD 
     * @param {ITextRange2} pRangeS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-setformattedtext
     */
    SetFormattedText(pRangeD, pRangeS) {
        result := ComCall(20, this, "ptr", pRangeD, "ptr", pRangeS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iString 
     * @param {Integer} cp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-setopcp
     */
    SetOpCp(iString, cp) {
        result := ComCall(21, this, "int", iString, "int", cp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @param {ITextRange2} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-suffixtop
     */
    SuffixTop(bstr, pRange) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(22, this, "ptr", bstr, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstrings-swap
     */
    Swap() {
        result := ComCall(23, this, "HRESULT")
        return result
    }
}
