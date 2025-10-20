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
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    GetName(pName) {
        result := ComCall(7, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextSelection>} ppSel 
     * @returns {HRESULT} 
     */
    GetSelection(ppSel) {
        result := ComCall(8, this, "ptr", ppSel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    GetStoryCount(pCount) {
        result := ComCall(9, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextStoryRanges>} ppStories 
     * @returns {HRESULT} 
     */
    GetStoryRanges(ppStories) {
        result := ComCall(10, this, "ptr", ppStories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetSaved(pValue) {
        result := ComCall(11, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetSaved(Value) {
        result := ComCall(12, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetDefaultTabStop(pValue) {
        result := ComCall(13, this, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    SetDefaultTabStop(Value) {
        result := ComCall(14, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    New() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @param {Integer} Flags 
     * @param {Integer} CodePage 
     * @returns {HRESULT} 
     */
    Open(pVar, Flags, CodePage) {
        result := ComCall(16, this, "ptr", pVar, "int", Flags, "int", CodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @param {Integer} Flags 
     * @param {Integer} CodePage 
     * @returns {HRESULT} 
     */
    Save(pVar, Flags, CodePage) {
        result := ComCall(17, this, "ptr", pVar, "int", Flags, "int", CodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    Freeze(pCount) {
        result := ComCall(18, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    Unfreeze(pCount) {
        result := ComCall(19, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginEditCollection() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndEditCollection() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    Undo(Count, pCount) {
        result := ComCall(22, this, "int", Count, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    Redo(Count, pCount) {
        result := ComCall(23, this, "int", Count, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cpActive 
     * @param {Integer} cpAnchor 
     * @param {Pointer<ITextRange>} ppRange 
     * @returns {HRESULT} 
     */
    Range(cpActive, cpAnchor, ppRange) {
        result := ComCall(24, this, "int", cpActive, "int", cpAnchor, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<ITextRange>} ppRange 
     * @returns {HRESULT} 
     */
    RangeFromPoint(x, y, ppRange) {
        result := ComCall(25, this, "int", x, "int", y, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
