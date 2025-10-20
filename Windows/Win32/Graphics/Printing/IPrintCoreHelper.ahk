#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintCoreHelper extends IUnknown{
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
     * 
     * @param {Pointer} pDevmode 
     * @param {Integer} cbSize 
     * @param {PSTR} pszFeatureRequested 
     * @param {Pointer<PSTR>} ppszOption 
     * @returns {HRESULT} 
     */
    GetOption(pDevmode, cbSize, pszFeatureRequested, ppszOption) {
        result := ComCall(3, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszFeatureRequested, "ptr", ppszOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Integer} cbSize 
     * @param {BOOL} bResolveConflicts 
     * @param {Pointer<PRINT_FEATURE_OPTION>} pFOPairs 
     * @param {Integer} cPairs 
     * @param {Pointer<UInt32>} pcPairsWritten 
     * @param {Pointer<UInt32>} pdwResult 
     * @returns {HRESULT} 
     */
    SetOptions(pDevmode, cbSize, bResolveConflicts, pFOPairs, cPairs, pcPairsWritten, pdwResult) {
        result := ComCall(4, this, "ptr", pDevmode, "uint", cbSize, "int", bResolveConflicts, "ptr", pFOPairs, "uint", cPairs, "uint*", pcPairsWritten, "uint*", pdwResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Integer} cbSize 
     * @param {PSTR} pszFeatureKeyword 
     * @param {Pointer<PSTR>} pConstrainedOptionList 
     * @param {Pointer<UInt32>} pdwNumOptions 
     * @returns {HRESULT} 
     */
    EnumConstrainedOptions(pDevmode, cbSize, pszFeatureKeyword, pConstrainedOptionList, pdwNumOptions) {
        result := ComCall(5, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszFeatureKeyword, "ptr", pConstrainedOptionList, "uint*", pdwNumOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pDevmode 
     * @param {Integer} cbSize 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {Pointer<PRINT_FEATURE_OPTION>} ppFOConstraints 
     * @param {Pointer<UInt32>} pdwNumOptions 
     * @returns {HRESULT} 
     */
    WhyConstrained(pDevmode, cbSize, pszFeatureKeyword, pszOptionKeyword, ppFOConstraints, pdwNumOptions) {
        result := ComCall(6, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, "ptr", ppFOConstraints, "uint*", pdwNumOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pFeatureList 
     * @param {Pointer<UInt32>} pdwNumFeatures 
     * @returns {HRESULT} 
     */
    EnumFeatures(pFeatureList, pdwNumFeatures) {
        result := ComCall(7, this, "ptr", pFeatureList, "uint*", pdwNumFeatures, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszFeatureKeyword 
     * @param {Pointer<PSTR>} pOptionList 
     * @param {Pointer<UInt32>} pdwNumOptions 
     * @returns {HRESULT} 
     */
    EnumOptions(pszFeatureKeyword, pOptionList, pdwNumOptions) {
        result := ComCall(8, this, "ptr", pszFeatureKeyword, "ptr", pOptionList, "uint*", pdwNumOptions, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(9, this, "ptr", pszTrueTypeFontName, "ptr", ppszDevFontName, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(10, this, "ptr", pszTrueTypeFontName, "ptr", pszDevFontName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateInstanceOfMSXMLObject(rclsid, pUnkOuter, dwClsContext, riid, ppv) {
        result := ComCall(11, this, "ptr", rclsid, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
