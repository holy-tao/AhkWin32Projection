#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import ".\PRINT_FEATURE_OPTION.ahk" { PRINT_FEATURE_OPTION }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintCoreHelper extends IUnknown {
    /**
     * The interface identifier for IPrintCoreHelper
     * @type {Guid}
     */
    static IID := Guid("{a89ec53e-3905-49c6-9c1a-c0a88117fdb6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintCoreHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOption                   : IntPtr
        SetOptions                  : IntPtr
        EnumConstrainedOptions      : IntPtr
        WhyConstrained              : IntPtr
        EnumFeatures                : IntPtr
        EnumOptions                 : IntPtr
        GetFontSubstitution         : IntPtr
        SetFontSubstitution         : IntPtr
        CreateInstanceOfMSXMLObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintCoreHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} pDevmode 
     * @param {Integer} cbSize 
     * @param {PSTR} pszFeatureRequested 
     * @returns {PSTR} 
     */
    GetOption(pDevmode, cbSize, pszFeatureRequested) {
        pszFeatureRequested := pszFeatureRequested is String ? StrPtr(pszFeatureRequested) : pszFeatureRequested

        result := ComCall(3, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszFeatureRequested, PSTR.Ptr, &ppszOption := 0, "HRESULT")
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

        result := ComCall(4, this, DEVMODEA.Ptr, pDevmode, "uint", cbSize, BOOL, bResolveConflicts, PRINT_FEATURE_OPTION.Ptr, pFOPairs, "uint", cPairs, pcPairsWrittenMarshal, pcPairsWritten, pdwResultMarshal, pdwResult, "HRESULT")
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

        result := ComCall(5, this, DEVMODEA.Ptr, pDevmode, "uint", cbSize, "ptr", pszFeatureKeyword, pConstrainedOptionListMarshal, pConstrainedOptionList, pdwNumOptionsMarshal, pdwNumOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pDevmode 
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

        result := ComCall(11, this, Guid.Ptr, rclsid, "ptr", pUnkOuter, "uint", dwClsContext, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintCoreHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOption := CallbackCreate(GetMethod(implObj, "GetOption"), flags, 5)
        this.vtbl.SetOptions := CallbackCreate(GetMethod(implObj, "SetOptions"), flags, 8)
        this.vtbl.EnumConstrainedOptions := CallbackCreate(GetMethod(implObj, "EnumConstrainedOptions"), flags, 6)
        this.vtbl.WhyConstrained := CallbackCreate(GetMethod(implObj, "WhyConstrained"), flags, 7)
        this.vtbl.EnumFeatures := CallbackCreate(GetMethod(implObj, "EnumFeatures"), flags, 3)
        this.vtbl.EnumOptions := CallbackCreate(GetMethod(implObj, "EnumOptions"), flags, 4)
        this.vtbl.GetFontSubstitution := CallbackCreate(GetMethod(implObj, "GetFontSubstitution"), flags, 3)
        this.vtbl.SetFontSubstitution := CallbackCreate(GetMethod(implObj, "SetFontSubstitution"), flags, 3)
        this.vtbl.CreateInstanceOfMSXMLObject := CallbackCreate(GetMethod(implObj, "CreateInstanceOfMSXMLObject"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOption)
        CallbackFree(this.vtbl.SetOptions)
        CallbackFree(this.vtbl.EnumConstrainedOptions)
        CallbackFree(this.vtbl.WhyConstrained)
        CallbackFree(this.vtbl.EnumFeatures)
        CallbackFree(this.vtbl.EnumOptions)
        CallbackFree(this.vtbl.GetFontSubstitution)
        CallbackFree(this.vtbl.SetFontSubstitution)
        CallbackFree(this.vtbl.CreateInstanceOfMSXMLObject)
    }
}
