#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\OEMUIOBJ.ahk" { OEMUIOBJ }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintOemDriverUI.ahk" { IPrintOemDriverUI }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintCoreUI2 extends IPrintOemDriverUI {
    /**
     * The interface identifier for IPrintCoreUI2
     * @type {Guid}
     */
    static IID := Guid("{085ccfca-3adf-4c9e-b491-d851a6edc997}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintCoreUI2 interfaces
    */
    struct Vtbl extends IPrintOemDriverUI.Vtbl {
        GetOptions             : IntPtr
        SetOptions             : IntPtr
        EnumConstrainedOptions : IntPtr
        WhyConstrained         : IntPtr
        GetGlobalAttribute     : IntPtr
        GetFeatureAttribute    : IntPtr
        GetOptionAttribute     : IntPtr
        EnumFeatures           : IntPtr
        EnumOptions            : IntPtr
        QuerySimulationSupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintCoreUI2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {Integer} pmszFeaturesRequested 
     * @param {Integer} cbIn 
     * @param {Integer} pmszFeatureOptionBuf 
     * @param {Integer} cbSize 
     * @returns {Integer} 
     */
    GetOptions(poemuiobj, pmszFeaturesRequested, cbIn, pmszFeatureOptionBuf, cbSize) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, IntPtr, pmszFeaturesRequested, UInt32, cbIn, IntPtr, pmszFeatureOptionBuf, UInt32, cbSize, "uint*", &pcbNeeded := 0, "HRESULT")
        return pcbNeeded
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {Integer} dwFlags 
     * @param {Integer} pmszFeatureOptionBuf 
     * @param {Integer} cbIn 
     * @returns {Integer} 
     */
    SetOptions(poemuiobj, dwFlags, pmszFeatureOptionBuf, cbIn) {
        result := ComCall(7, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, IntPtr, pmszFeatureOptionBuf, UInt32, cbIn, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {Integer} pmszConstrainedOptionList 
     * @param {Integer} cbSize 
     * @returns {Integer} 
     */
    EnumConstrainedOptions(poemuiobj, pszFeatureKeyword, pmszConstrainedOptionList, cbSize) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword

        result := ComCall(8, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, "ptr", pszFeatureKeyword, IntPtr, pmszConstrainedOptionList, UInt32, cbSize, "uint*", &pcbNeeded := 0, "HRESULT")
        return pcbNeeded
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {Integer} pmszReasonList 
     * @param {Integer} cbSize 
     * @returns {Integer} 
     */
    WhyConstrained(poemuiobj, pszFeatureKeyword, pszOptionKeyword, pmszReasonList, cbSize) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszOptionKeyword := pszOptionKeyword is String ? StrPtr(pszOptionKeyword) : pszOptionKeyword

        result := ComCall(9, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, IntPtr, pmszReasonList, UInt32, cbSize, "uint*", &pcbNeeded := 0, "HRESULT")
        return pcbNeeded
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Integer} pbData 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetGlobalAttribute(poemuiobj, pszAttribute, pdwDataType, pbData, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        pdwDataTypeMarshal := pdwDataType is VarRef ? "uint*" : "ptr"
        pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, "ptr", pszAttribute, pdwDataTypeMarshal, pdwDataType, IntPtr, pbData, UInt32, cbSize, pcbNeededMarshal, pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Integer} pbData 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetFeatureAttribute(poemuiobj, pszFeatureKeyword, pszAttribute, pdwDataType, pbData, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        pdwDataTypeMarshal := pdwDataType is VarRef ? "uint*" : "ptr"
        pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, "ptr", pszFeatureKeyword, "ptr", pszAttribute, pdwDataTypeMarshal, pdwDataType, IntPtr, pbData, UInt32, cbSize, pcbNeededMarshal, pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Integer} pbData 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetOptionAttribute(poemuiobj, pszFeatureKeyword, pszOptionKeyword, pszAttribute, pdwDataType, pbData, cbSize, pcbNeeded) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszOptionKeyword := pszOptionKeyword is String ? StrPtr(pszOptionKeyword) : pszOptionKeyword
        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        pdwDataTypeMarshal := pdwDataType is VarRef ? "uint*" : "ptr"
        pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, "ptr", pszAttribute, pdwDataTypeMarshal, pdwDataType, IntPtr, pbData, UInt32, cbSize, pcbNeededMarshal, pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {Integer} pmszFeatureList 
     * @param {Integer} cbSize 
     * @returns {Integer} 
     */
    EnumFeatures(poemuiobj, pmszFeatureList, cbSize) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        result := ComCall(13, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, IntPtr, pmszFeatureList, UInt32, cbSize, "uint*", &pcbNeeded := 0, "HRESULT")
        return pcbNeeded
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {PSTR} pszFeatureKeyword 
     * @param {Integer} pmszOptionList 
     * @param {Integer} cbSize 
     * @returns {Integer} 
     */
    EnumOptions(poemuiobj, pszFeatureKeyword, pmszOptionList, cbSize) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword

        result := ComCall(14, this, OEMUIOBJ.Ptr, poemuiobj, UInt32, dwFlags, "ptr", pszFeatureKeyword, IntPtr, pmszOptionList, UInt32, cbSize, "uint*", &pcbNeeded := 0, "HRESULT")
        return pcbNeeded
    }

    /**
     * 
     * @param {HANDLE} hPrinter 
     * @param {Integer} dwLevel 
     * @param {Integer} pCaps 
     * @param {Integer} cbSize 
     * @returns {Integer} 
     */
    QuerySimulationSupport(hPrinter, dwLevel, pCaps, cbSize) {
        result := ComCall(15, this, HANDLE, hPrinter, UInt32, dwLevel, IntPtr, pCaps, UInt32, cbSize, "uint*", &pcbNeeded := 0, "HRESULT")
        return pcbNeeded
    }

    Query(iid) {
        if (IPrintCoreUI2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOptions := CallbackCreate(GetMethod(implObj, "GetOptions"), flags, 8)
        this.vtbl.SetOptions := CallbackCreate(GetMethod(implObj, "SetOptions"), flags, 6)
        this.vtbl.EnumConstrainedOptions := CallbackCreate(GetMethod(implObj, "EnumConstrainedOptions"), flags, 7)
        this.vtbl.WhyConstrained := CallbackCreate(GetMethod(implObj, "WhyConstrained"), flags, 8)
        this.vtbl.GetGlobalAttribute := CallbackCreate(GetMethod(implObj, "GetGlobalAttribute"), flags, 8)
        this.vtbl.GetFeatureAttribute := CallbackCreate(GetMethod(implObj, "GetFeatureAttribute"), flags, 9)
        this.vtbl.GetOptionAttribute := CallbackCreate(GetMethod(implObj, "GetOptionAttribute"), flags, 10)
        this.vtbl.EnumFeatures := CallbackCreate(GetMethod(implObj, "EnumFeatures"), flags, 6)
        this.vtbl.EnumOptions := CallbackCreate(GetMethod(implObj, "EnumOptions"), flags, 7)
        this.vtbl.QuerySimulationSupport := CallbackCreate(GetMethod(implObj, "QuerySimulationSupport"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOptions)
        CallbackFree(this.vtbl.SetOptions)
        CallbackFree(this.vtbl.EnumConstrainedOptions)
        CallbackFree(this.vtbl.WhyConstrained)
        CallbackFree(this.vtbl.GetGlobalAttribute)
        CallbackFree(this.vtbl.GetFeatureAttribute)
        CallbackFree(this.vtbl.GetOptionAttribute)
        CallbackFree(this.vtbl.EnumFeatures)
        CallbackFree(this.vtbl.EnumOptions)
        CallbackFree(this.vtbl.QuerySimulationSupport)
    }
}
