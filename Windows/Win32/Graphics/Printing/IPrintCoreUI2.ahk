#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintOemDriverUI.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintCoreUI2 extends IPrintOemDriverUI{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintCoreUI2
     * @type {Guid}
     */
    static IID => Guid("{085ccfca-3adf-4c9e-b491-d851a6edc997}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOptions", "SetOptions", "EnumConstrainedOptions", "WhyConstrained", "GetGlobalAttribute", "GetFeatureAttribute", "GetOptionAttribute", "EnumFeatures", "EnumOptions", "QuerySimulationSupport"]

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {Pointer} pmszFeaturesRequested 
     * @param {Integer} cbIn 
     * @param {Pointer} pmszFeatureOptionBuf 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetOptions(poemuiobj, pmszFeaturesRequested, cbIn, pmszFeatureOptionBuf, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pmszFeaturesRequested, "uint", cbIn, "ptr", pmszFeatureOptionBuf, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {Integer} dwFlags 
     * @param {Pointer} pmszFeatureOptionBuf 
     * @param {Integer} cbIn 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    SetOptions(poemuiobj, dwFlags, pmszFeatureOptionBuf, cbIn, pdwResult) {
        result := ComCall(7, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pmszFeatureOptionBuf, "uint", cbIn, "uint*", pdwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {Pointer} pmszConstrainedOptionList 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    EnumConstrainedOptions(poemuiobj, pszFeatureKeyword, pmszConstrainedOptionList, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword

        result := ComCall(8, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pszFeatureKeyword, "ptr", pmszConstrainedOptionList, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {Pointer} pmszReasonList 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    WhyConstrained(poemuiobj, pszFeatureKeyword, pszOptionKeyword, pmszReasonList, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszOptionKeyword := pszOptionKeyword is String ? StrPtr(pszOptionKeyword) : pszOptionKeyword

        result := ComCall(9, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, "ptr", pmszReasonList, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer} pbData 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetGlobalAttribute(poemuiobj, pszAttribute, pdwDataType, pbData, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        result := ComCall(10, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pszAttribute, "uint*", pdwDataType, "ptr", pbData, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer} pbData 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetFeatureAttribute(poemuiobj, pszFeatureKeyword, pszAttribute, pdwDataType, pbData, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        result := ComCall(11, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pszFeatureKeyword, "ptr", pszAttribute, "uint*", pdwDataType, "ptr", pbData, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer} pbData 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetOptionAttribute(poemuiobj, pszFeatureKeyword, pszOptionKeyword, pszAttribute, pdwDataType, pbData, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszOptionKeyword := pszOptionKeyword is String ? StrPtr(pszOptionKeyword) : pszOptionKeyword
        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        result := ComCall(12, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, "ptr", pszAttribute, "uint*", pdwDataType, "ptr", pbData, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {Pointer} pmszFeatureList 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    EnumFeatures(poemuiobj, pmszFeatureList, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        result := ComCall(13, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pmszFeatureList, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {Pointer} pmszOptionList 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    EnumOptions(poemuiobj, pszFeatureKeyword, pmszOptionList, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword

        result := ComCall(14, this, "ptr", poemuiobj, "uint", dwFlags, "ptr", pszFeatureKeyword, "ptr", pmszOptionList, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hPrinter 
     * @param {Integer} dwLevel 
     * @param {Pointer} pCaps 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    QuerySimulationSupport(hPrinter, dwLevel, pCaps, cbSize, pcbNeeded) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(15, this, "ptr", hPrinter, "uint", dwLevel, "ptr", pCaps, "uint", cbSize, "uint*", pcbNeeded, "HRESULT")
        return result
    }
}
