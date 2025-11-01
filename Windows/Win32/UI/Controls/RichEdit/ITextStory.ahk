#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ITextStory interface methods are used to access shared data from multiple stories, which is stored in the parent ITextServices instance.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextstory
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextStory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStory
     * @type {Guid}
     */
    static IID => Guid("{c241f5f3-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActive", "SetActive", "GetDisplay", "GetIndex", "GetType", "SetType", "GetProperty", "GetRange", "GetText", "SetFormattedText", "SetProperty", "SetText"]

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getactive
     */
    GetActive(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-setactive
     */
    SetActive(Value) {
        result := ComCall(4, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getdisplay
     */
    GetDisplay(ppDisplay) {
        result := ComCall(5, this, "ptr*", ppDisplay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getindex
     */
    GetIndex(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-gettype
     */
    GetType(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-settype
     */
    SetType(Value) {
        result := ComCall(8, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getproperty
     */
    GetProperty(Type, pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", Type, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpActive 
     * @param {Integer} cpAnchor 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getrange
     */
    GetRange(cpActive, cpAnchor, ppRange) {
        result := ComCall(10, this, "int", cpActive, "int", cpAnchor, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-gettext
     */
    GetText(Flags, pbstr) {
        result := ComCall(11, this, "int", Flags, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-setformattedtext
     */
    SetFormattedText(pUnk) {
        result := ComCall(12, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(13, this, "int", Type, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-settext
     */
    SetText(Flags, bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(14, this, "int", Flags, "ptr", bstr, "HRESULT")
        return result
    }
}
