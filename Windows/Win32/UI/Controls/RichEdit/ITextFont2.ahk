#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextFont.ahk

/**
 * In the Text Object Model (TOM), applications access text-range attributes by using a pair of dual interfaces, ITextFont and ITextPara.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextfont2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextFont2 extends ITextFont{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextFont2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e3-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 62

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAutoLigatures", "SetAutoLigatures", "GetAutospaceAlpha", "SetAutospaceAlpha", "GetAutospaceNumeric", "SetAutospaceNumeric", "GetAutospaceParens", "SetAutospaceParens", "GetCharRep", "SetCharRep", "GetCompressionMode", "SetCompressionMode", "GetCookie", "SetCookie", "GetDoubleStrike", "SetDoubleStrike", "GetDuplicate2", "SetDuplicate2", "GetLinkType", "GetMathZone", "SetMathZone", "GetModWidthPairs", "SetModWidthPairs", "GetModWidthSpace", "SetModWidthSpace", "GetOldNumbers", "SetOldNumbers", "GetOverlapping", "SetOverlapping", "GetPositionSubSuper", "SetPositionSubSuper", "GetScaling", "SetScaling", "GetSpaceExtension", "SetSpaceExtension", "GetUnderlinePositionMode", "SetUnderlinePositionMode", "GetEffects", "GetEffects2", "GetProperty", "GetPropertyInfo", "IsEqual2", "SetEffects", "SetEffects2", "SetProperty"]

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getcount
     */
    GetCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(62, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getautoligatures
     */
    GetAutoLigatures(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(63, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setautoligatures
     */
    SetAutoLigatures(Value) {
        result := ComCall(64, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getautospacealpha
     */
    GetAutospaceAlpha(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(65, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setautospacealpha
     */
    SetAutospaceAlpha(Value) {
        result := ComCall(66, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getautospacenumeric
     */
    GetAutospaceNumeric(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(67, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setautospacenumeric
     */
    SetAutospaceNumeric(Value) {
        result := ComCall(68, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getautospaceparens
     */
    GetAutospaceParens(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(69, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setautospaceparens
     */
    SetAutospaceParens(Value) {
        result := ComCall(70, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getcharrep
     */
    GetCharRep(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(71, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setcharrep
     */
    SetCharRep(Value) {
        result := ComCall(72, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getcompressionmode
     */
    GetCompressionMode(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(73, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setcompressionmode
     */
    SetCompressionMode(Value) {
        result := ComCall(74, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getcookie
     */
    GetCookie(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(75, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setcookie
     */
    SetCookie(Value) {
        result := ComCall(76, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getdoublestrike
     */
    GetDoubleStrike(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setdoublestrike
     */
    SetDoubleStrike(Value) {
        result := ComCall(78, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextFont2>} ppFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getduplicate2
     */
    GetDuplicate2(ppFont) {
        result := ComCall(79, this, "ptr*", ppFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextFont2} pFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setduplicate2
     */
    SetDuplicate2(pFont) {
        result := ComCall(80, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getlinktype
     */
    GetLinkType(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(81, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getmathzone
     */
    GetMathZone(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(82, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setmathzone
     */
    SetMathZone(Value) {
        result := ComCall(83, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getmodwidthpairs
     */
    GetModWidthPairs(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(84, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setmodwidthpairs
     */
    SetModWidthPairs(Value) {
        result := ComCall(85, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getmodwidthspace
     */
    GetModWidthSpace(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(86, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setmodwidthspace
     */
    SetModWidthSpace(Value) {
        result := ComCall(87, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getoldnumbers
     */
    GetOldNumbers(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(88, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setoldnumbers
     */
    SetOldNumbers(Value) {
        result := ComCall(89, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getoverlapping
     */
    GetOverlapping(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(90, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setoverlapping
     */
    SetOverlapping(Value) {
        result := ComCall(91, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getpositionsubsuper
     */
    GetPositionSubSuper(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(92, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setpositionsubsuper
     */
    SetPositionSubSuper(Value) {
        result := ComCall(93, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getscaling
     */
    GetScaling(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(94, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setscaling
     */
    SetScaling(Value) {
        result := ComCall(95, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getspaceextension
     */
    GetSpaceExtension(pValue) {
        pValueMarshal := pValue is VarRef ? "float*" : "ptr"

        result := ComCall(96, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setspaceextension
     */
    SetSpaceExtension(Value) {
        result := ComCall(97, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getunderlinepositionmode
     */
    GetUnderlinePositionMode(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(98, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setunderlinepositionmode
     */
    SetUnderlinePositionMode(Value) {
        result := ComCall(99, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-geteffects
     */
    GetEffects(pValue, pMask) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "int*" : "ptr"

        result := ComCall(100, this, pValueMarshal, pValue, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-geteffects2
     */
    GetEffects2(pValue, pMask) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "int*" : "ptr"

        result := ComCall(101, this, pValueMarshal, pValue, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getproperty
     */
    GetProperty(Type, pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(102, this, "int", Type, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getpropertyinfo
     */
    GetPropertyInfo(Index, pType, pValue) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(103, this, "int", Index, pTypeMarshal, pType, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextFont2} pFont 
     * @param {Pointer<Integer>} pB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-isequal2
     */
    IsEqual2(pFont, pB) {
        pBMarshal := pB is VarRef ? "int*" : "ptr"

        result := ComCall(104, this, "ptr", pFont, pBMarshal, pB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-seteffects
     */
    SetEffects(Value, Mask) {
        result := ComCall(105, this, "int", Value, "int", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-seteffects2
     */
    SetEffects2(Value, Mask) {
        result := ComCall(106, this, "int", Value, "int", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(107, this, "int", Type, "int", Value, "HRESULT")
        return result
    }
}
