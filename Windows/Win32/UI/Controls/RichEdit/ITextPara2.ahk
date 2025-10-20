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
     * 
     * @param {Pointer<IUnknown>} ppBorders 
     * @returns {HRESULT} 
     */
    GetBorders(ppBorders) {
        result := ComCall(55, this, "ptr", ppBorders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} ppPara 
     * @returns {HRESULT} 
     */
    GetDuplicate2(ppPara) {
        result := ComCall(56, this, "ptr", ppPara, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} pPara 
     * @returns {HRESULT} 
     */
    SetDuplicate2(pPara) {
        result := ComCall(57, this, "ptr", pPara, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetFontAlignment(pValue) {
        result := ComCall(58, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetFontAlignment(Value) {
        result := ComCall(59, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetHangingPunctuation(pValue) {
        result := ComCall(60, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetHangingPunctuation(Value) {
        result := ComCall(61, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetSnapToGrid(pValue) {
        result := ComCall(62, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetSnapToGrid(Value) {
        result := ComCall(63, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetTrimPunctuationAtStart(pValue) {
        result := ComCall(64, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetTrimPunctuationAtStart(Value) {
        result := ComCall(65, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pMask 
     * @returns {HRESULT} 
     */
    GetEffects(pValue, pMask) {
        result := ComCall(66, this, "int*", pValue, "int*", pMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetProperty(Type, pValue) {
        result := ComCall(67, this, "int", Type, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} pPara 
     * @param {Pointer<Int32>} pB 
     * @returns {HRESULT} 
     */
    IsEqual2(pPara, pB) {
        result := ComCall(68, this, "ptr", pPara, "int*", pB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetEffects(Value, Mask) {
        result := ComCall(69, this, "int", Value, "int", Mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetProperty(Type, Value) {
        result := ComCall(70, this, "int", Type, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
