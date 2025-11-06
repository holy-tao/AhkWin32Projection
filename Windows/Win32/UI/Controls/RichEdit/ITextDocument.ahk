#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextSelection.ahk
#Include .\ITextStoryRanges.ahk
#Include .\ITextRange.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getname
     */
    GetName() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @returns {ITextSelection} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getselection
     */
    GetSelection() {
        result := ComCall(8, this, "ptr*", &ppSel := 0, "HRESULT")
        return ITextSelection(ppSel)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getstorycount
     */
    GetStoryCount() {
        result := ComCall(9, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {ITextStoryRanges} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getstoryranges
     */
    GetStoryRanges() {
        result := ComCall(10, this, "ptr*", &ppStories := 0, "HRESULT")
        return ITextStoryRanges(ppStories)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getsaved
     */
    GetSaved() {
        result := ComCall(11, this, "int*", &pValue := 0, "HRESULT")
        return pValue
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-getdefaulttabstop
     */
    GetDefaultTabStop() {
        result := ComCall(13, this, "float*", &pValue := 0, "HRESULT")
        return pValue
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-freeze
     */
    Freeze() {
        result := ComCall(18, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-unfreeze
     */
    Unfreeze() {
        result := ComCall(19, this, "int*", &pCount := 0, "HRESULT")
        return pCount
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-undo
     */
    Undo(Count) {
        result := ComCall(22, this, "int", Count, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-redo
     */
    Redo(Count) {
        result := ComCall(23, this, "int", Count, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} cpActive 
     * @param {Integer} cpAnchor 
     * @returns {ITextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-range
     */
    Range(cpActive, cpAnchor) {
        result := ComCall(24, this, "int", cpActive, "int", cpAnchor, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {ITextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument-rangefrompoint
     */
    RangeFromPoint(x, y) {
        result := ComCall(25, this, "int", x, "int", y, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }
}
