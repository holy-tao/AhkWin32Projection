#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ITextPara2.ahk
#Include .\ITextPara.ahk

/**
 * Text Object Model (TOM) rich text-range attributes are accessed through a pair of dual interfaces, ITextFont and ITextPara.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextpara2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextPara2 extends ITextPara{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextPara2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e4-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 55

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBorders", "GetDuplicate2", "SetDuplicate2", "GetFontAlignment", "SetFontAlignment", "GetHangingPunctuation", "SetHangingPunctuation", "GetSnapToGrid", "SetSnapToGrid", "GetTrimPunctuationAtStart", "SetTrimPunctuationAtStart", "GetEffects", "GetProperty", "IsEqual2", "SetEffects", "SetProperty"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getborders
     */
    GetBorders() {
        result := ComCall(55, this, "ptr*", &ppBorders := 0, "HRESULT")
        return IUnknown(ppBorders)
    }

    /**
     * 
     * @returns {ITextPara2} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getduplicate2
     */
    GetDuplicate2() {
        result := ComCall(56, this, "ptr*", &ppPara := 0, "HRESULT")
        return ITextPara2(ppPara)
    }

    /**
     * 
     * @param {ITextPara2} pPara 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-setduplicate2
     */
    SetDuplicate2(pPara) {
        result := ComCall(57, this, "ptr", pPara, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getfontalignment
     */
    GetFontAlignment() {
        result := ComCall(58, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-setfontalignment
     */
    SetFontAlignment(Value) {
        result := ComCall(59, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-gethangingpunctuation
     */
    GetHangingPunctuation() {
        result := ComCall(60, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-sethangingpunctuation
     */
    SetHangingPunctuation(Value) {
        result := ComCall(61, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getsnaptogrid
     */
    GetSnapToGrid() {
        result := ComCall(62, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-setsnaptogrid
     */
    SetSnapToGrid(Value) {
        result := ComCall(63, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-gettrimpunctuationatstart
     */
    GetTrimPunctuationAtStart() {
        result := ComCall(64, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-settrimpunctuationatstart
     */
    SetTrimPunctuationAtStart(Value) {
        result := ComCall(65, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-geteffects
     */
    GetEffects(pValue, pMask) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "int*" : "ptr"

        result := ComCall(66, this, pValueMarshal, pValue, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getproperty
     */
    GetProperty(Type) {
        result := ComCall(67, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {ITextPara2} pPara 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-isequal2
     */
    IsEqual2(pPara) {
        result := ComCall(68, this, "ptr", pPara, "int*", &pB := 0, "HRESULT")
        return pB
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-seteffects
     */
    SetEffects(Value, Mask) {
        result := ComCall(69, this, "int", Value, "int", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(70, this, "int", Type, "int", Value, "HRESULT")
        return result
    }
}
