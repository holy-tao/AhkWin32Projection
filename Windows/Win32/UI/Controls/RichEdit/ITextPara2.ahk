#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<IUnknown>} ppBorders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getborders
     */
    GetBorders(ppBorders) {
        result := ComCall(55, this, "ptr*", ppBorders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} ppPara 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getduplicate2
     */
    GetDuplicate2(ppPara) {
        result := ComCall(56, this, "ptr*", ppPara, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getfontalignment
     */
    GetFontAlignment(pValue) {
        result := ComCall(58, this, "int*", pValue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-gethangingpunctuation
     */
    GetHangingPunctuation(pValue) {
        result := ComCall(60, this, "int*", pValue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getsnaptogrid
     */
    GetSnapToGrid(pValue) {
        result := ComCall(62, this, "int*", pValue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-gettrimpunctuationatstart
     */
    GetTrimPunctuationAtStart(pValue) {
        result := ComCall(64, this, "int*", pValue, "HRESULT")
        return result
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
        result := ComCall(66, this, "int*", pValue, "int*", pMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-getproperty
     */
    GetProperty(Type, pValue) {
        result := ComCall(67, this, "int", Type, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextPara2} pPara 
     * @param {Pointer<Integer>} pB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara2-isequal2
     */
    IsEqual2(pPara, pB) {
        result := ComCall(68, this, "ptr", pPara, "int*", pB, "HRESULT")
        return result
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
