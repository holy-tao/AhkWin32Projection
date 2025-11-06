#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintCoreHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintCoreHelper
     * @type {Guid}
     */
    static IID => Guid("{a89ec53e-3905-49c6-9c1a-c0a88117fdb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOption", "SetOptions", "EnumConstrainedOptions", "WhyConstrained", "EnumFeatures", "EnumOptions", "GetFontSubstitution", "SetFontSubstitution", "CreateInstanceOfMSXMLObject"]

    /**
     * 
     * @param {Pointer} pDevmode 
     * @param {Integer} cbSize 
     * @param {PSTR} pszFeatureRequested 
     * @returns {PSTR} 
     */
    GetOption(pDevmode, cbSize, pszFeatureRequested) {
        pszFeatureRequested := pszFeatureRequested is String ? StrPtr(pszFeatureRequested) : pszFeatureRequested

        result := ComCall(3, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszFeatureRequested, "ptr*", &ppszOption := 0, "HRESULT")
        return ppszOption
    }

    /**
     * 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Integer} cbSize 
     * @param {BOOL} bResolveConflicts 
     * @param {Pointer<PRINT_FEATURE_OPTION>} pFOPairs 
     * @param {Integer} cPairs 
     * @param {Pointer<Integer>} pcPairsWritten 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    SetOptions(pDevmode, cbSize, bResolveConflicts, pFOPairs, cPairs, pcPairsWritten, pdwResult) {
        pcPairsWrittenMarshal := pcPairsWritten is VarRef ? "uint*" : "ptr"
        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pDevmode, "uint", cbSize, "int", bResolveConflicts, "ptr", pFOPairs, "uint", cPairs, pcPairsWrittenMarshal, pcPairsWritten, pdwResultMarshal, pdwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Integer} cbSize 
     * @param {PSTR} pszFeatureKeyword 
     * @param {Pointer<Pointer<Pointer<PSTR>>>} pConstrainedOptionList 
     * @param {Pointer<Integer>} pdwNumOptions 
     * @returns {HRESULT} 
     */
    EnumConstrainedOptions(pDevmode, cbSize, pszFeatureKeyword, pConstrainedOptionList, pdwNumOptions) {
        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword

        pConstrainedOptionListMarshal := pConstrainedOptionList is VarRef ? "ptr*" : "ptr"
        pdwNumOptionsMarshal := pdwNumOptions is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszFeatureKeyword, pConstrainedOptionListMarshal, pConstrainedOptionList, pdwNumOptionsMarshal, pdwNumOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pDevmode 
     * @param {Integer} cbSize 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {Pointer<Pointer<PRINT_FEATURE_OPTION>>} ppFOConstraints 
     * @param {Pointer<Integer>} pdwNumOptions 
     * @returns {HRESULT} 
     */
    WhyConstrained(pDevmode, cbSize, pszFeatureKeyword, pszOptionKeyword, ppFOConstraints, pdwNumOptions) {
        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszOptionKeyword := pszOptionKeyword is String ? StrPtr(pszOptionKeyword) : pszOptionKeyword

        ppFOConstraintsMarshal := ppFOConstraints is VarRef ? "ptr*" : "ptr"
        pdwNumOptionsMarshal := pdwNumOptions is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, ppFOConstraintsMarshal, ppFOConstraints, pdwNumOptionsMarshal, pdwNumOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Pointer<PSTR>>>} pFeatureList 
     * @param {Pointer<Integer>} pdwNumFeatures 
     * @returns {HRESULT} 
     */
    EnumFeatures(pFeatureList, pdwNumFeatures) {
        pFeatureListMarshal := pFeatureList is VarRef ? "ptr*" : "ptr"
        pdwNumFeaturesMarshal := pdwNumFeatures is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pFeatureListMarshal, pFeatureList, pdwNumFeaturesMarshal, pdwNumFeatures, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFeatureKeyword 
     * @param {Pointer<Pointer<Pointer<PSTR>>>} pOptionList 
     * @param {Pointer<Integer>} pdwNumOptions 
     * @returns {HRESULT} 
     */
    EnumOptions(pszFeatureKeyword, pOptionList, pdwNumOptions) {
        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword

        pOptionListMarshal := pOptionList is VarRef ? "ptr*" : "ptr"
        pdwNumOptionsMarshal := pdwNumOptions is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pszFeatureKeyword, pOptionListMarshal, pOptionList, pdwNumOptionsMarshal, pdwNumOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTrueTypeFontName 
     * @param {Pointer<PWSTR>} ppszDevFontName 
     * @returns {HRESULT} 
     */
    GetFontSubstitution(pszTrueTypeFontName, ppszDevFontName) {
        pszTrueTypeFontName := pszTrueTypeFontName is String ? StrPtr(pszTrueTypeFontName) : pszTrueTypeFontName

        ppszDevFontNameMarshal := ppszDevFontName is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pszTrueTypeFontName, ppszDevFontNameMarshal, ppszDevFontName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTrueTypeFontName 
     * @param {PWSTR} pszDevFontName 
     * @returns {HRESULT} 
     */
    SetFontSubstitution(pszTrueTypeFontName, pszDevFontName) {
        pszTrueTypeFontName := pszTrueTypeFontName is String ? StrPtr(pszTrueTypeFontName) : pszTrueTypeFontName
        pszDevFontName := pszDevFontName is String ? StrPtr(pszDevFontName) : pszDevFontName

        result := ComCall(10, this, "ptr", pszTrueTypeFontName, "ptr", pszDevFontName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    CreateInstanceOfMSXMLObject(rclsid, pUnkOuter, dwClsContext, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", rclsid, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
