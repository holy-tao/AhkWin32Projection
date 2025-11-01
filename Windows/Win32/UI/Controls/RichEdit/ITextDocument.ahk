#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITextDocument interface is the Text Object Model (TOM) top-level interface, which retrieves the active selection and range objects for any story in the document�whether active or not.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextdocument
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextDocument extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDocument
     * @type {Guid}
     */
    static IID => Guid("{8cc497c0-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetSelection", "GetStoryCount", "GetStoryRanges", "GetSaved", "SetSaved", "GetDefaultTabStop", "SetDefaultTabStop", "New", "Open", "Save", "Freeze", "Unfreeze", "BeginEditCollection", "EndEditCollection", "Undo", "Redo", "Range", "RangeFromPoint"]

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getname
     */
    GetName(pName) {
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextSelection>} ppSel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getselection
     */
    GetSelection(ppSel) {
        result := ComCall(8, this, "ptr*", ppSel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getstorycount
     */
    GetStoryCount(pCount) {
        result := ComCall(9, this, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextStoryRanges>} ppStories 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getstoryranges
     */
    GetStoryRanges(ppStories) {
        result := ComCall(10, this, "ptr*", ppStories, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getsaved
     */
    GetSaved(pValue) {
        result := ComCall(11, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-setsaved
     */
    SetSaved(Value) {
        result := ComCall(12, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getdefaulttabstop
     */
    GetDefaultTabStop(pValue) {
        result := ComCall(13, this, "float*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-setdefaulttabstop
     */
    SetDefaultTabStop(Value) {
        result := ComCall(14, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-new
     */
    New() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @param {Integer} Flags 
     * @param {Integer} CodePage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-open
     */
    Open(pVar, Flags, CodePage) {
        result := ComCall(16, this, "ptr", pVar, "int", Flags, "int", CodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @param {Integer} Flags 
     * @param {Integer} CodePage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-save
     */
    Save(pVar, Flags, CodePage) {
        result := ComCall(17, this, "ptr", pVar, "int", Flags, "int", CodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-freeze
     */
    Freeze(pCount) {
        result := ComCall(18, this, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-unfreeze
     */
    Unfreeze(pCount) {
        result := ComCall(19, this, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-begineditcollection
     */
    BeginEditCollection() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-endeditcollection
     */
    EndEditCollection() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-undo
     */
    Undo(Count, pCount) {
        result := ComCall(22, this, "int", Count, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-redo
     */
    Redo(Count, pCount) {
        result := ComCall(23, this, "int", Count, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpActive 
     * @param {Integer} cpAnchor 
     * @param {Pointer<ITextRange>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-range
     */
    Range(cpActive, cpAnchor, ppRange) {
        result := ComCall(24, this, "int", cpActive, "int", cpAnchor, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<ITextRange>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-rangefrompoint
     */
    RangeFromPoint(x, y, ppRange) {
        result := ComCall(25, this, "int", x, "int", y, "ptr*", ppRange, "HRESULT")
        return result
    }
}
