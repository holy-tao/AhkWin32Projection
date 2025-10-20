#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataEmit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataEmit
     * @type {Guid}
     */
    static IID => Guid("{ba3fee4c-ecb9-4e41-83b7-183fa41cd859}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetModuleProps", "Save", "SaveToStream", "GetSaveSize", "DefineTypeDef", "DefineNestedType", "SetHandler", "DefineMethod", "DefineMethodImpl", "DefineTypeRefByName", "DefineImportType", "DefineMemberRef", "DefineImportMember", "DefineEvent", "SetClassLayout", "DeleteClassLayout", "SetFieldMarshal", "DeleteFieldMarshal", "DefinePermissionSet", "SetRVA", "GetTokenFromSig", "DefineModuleRef", "SetParent", "GetTokenFromTypeSpec", "SaveToMemory", "DefineUserString", "DeleteToken", "SetMethodProps", "SetTypeDefProps", "SetEventProps", "SetPermissionSetProps", "DefinePinvokeMap", "SetPinvokeMap", "DeletePinvokeMap", "DefineCustomAttribute", "SetCustomAttributeValue", "DefineField", "DefineProperty", "DefineParam", "SetFieldProps", "SetPropertyProps", "SetParamProps", "DefineSecurityAttributeSet", "ApplyEditAndContinue", "TranslateSigWithScope", "SetMethodImplFlags", "SetFieldRVA", "Merge", "MergeEnd"]

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     */
    SetModuleProps(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szFile 
     * @param {Integer} dwSaveFlags 
     * @returns {HRESULT} 
     */
    Save(szFile, dwSaveFlags) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := ComCall(4, this, "ptr", szFile, "uint", dwSaveFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pIStream 
     * @param {Integer} dwSaveFlags 
     * @returns {HRESULT} 
     */
    SaveToStream(pIStream, dwSaveFlags) {
        result := ComCall(5, this, "ptr", pIStream, "uint", dwSaveFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fSave 
     * @param {Pointer<Integer>} pdwSaveSize 
     * @returns {HRESULT} 
     */
    GetSaveSize(fSave, pdwSaveSize) {
        result := ComCall(6, this, "int", fSave, "uint*", pdwSaveSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szTypeDef 
     * @param {Integer} dwTypeDefFlags 
     * @param {Integer} tkExtends 
     * @param {Pointer<Integer>} rtkImplements 
     * @param {Pointer<Integer>} ptd 
     * @returns {HRESULT} 
     */
    DefineTypeDef(szTypeDef, dwTypeDefFlags, tkExtends, rtkImplements, ptd) {
        szTypeDef := szTypeDef is String ? StrPtr(szTypeDef) : szTypeDef

        result := ComCall(7, this, "ptr", szTypeDef, "uint", dwTypeDefFlags, "uint", tkExtends, "uint*", rtkImplements, "uint*", ptd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szTypeDef 
     * @param {Integer} dwTypeDefFlags 
     * @param {Integer} tkExtends 
     * @param {Pointer<Integer>} rtkImplements 
     * @param {Integer} tdEncloser 
     * @param {Pointer<Integer>} ptd 
     * @returns {HRESULT} 
     */
    DefineNestedType(szTypeDef, dwTypeDefFlags, tkExtends, rtkImplements, tdEncloser, ptd) {
        szTypeDef := szTypeDef is String ? StrPtr(szTypeDef) : szTypeDef

        result := ComCall(8, this, "ptr", szTypeDef, "uint", dwTypeDefFlags, "uint", tkExtends, "uint*", rtkImplements, "uint", tdEncloser, "uint*", ptd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    SetHandler(pUnk) {
        result := ComCall(9, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Integer} dwMethodFlags 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Integer} ulCodeRVA 
     * @param {Integer} dwImplFlags 
     * @param {Pointer<Integer>} pmd 
     * @returns {HRESULT} 
     */
    DefineMethod(td, szName, dwMethodFlags, pvSigBlob, cbSigBlob, ulCodeRVA, dwImplFlags, pmd) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(10, this, "uint", td, "ptr", szName, "uint", dwMethodFlags, "char*", pvSigBlob, "uint", cbSigBlob, "uint", ulCodeRVA, "uint", dwImplFlags, "uint*", pmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {Integer} tkBody 
     * @param {Integer} tkDecl 
     * @returns {HRESULT} 
     */
    DefineMethodImpl(td, tkBody, tkDecl) {
        result := ComCall(11, this, "uint", td, "uint", tkBody, "uint", tkDecl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tkResolutionScope 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} ptr 
     * @returns {HRESULT} 
     */
    DefineTypeRefByName(tkResolutionScope, szName, ptr) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(12, this, "uint", tkResolutionScope, "ptr", szName, "uint*", ptr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMetaDataAssemblyImport} pAssemImport 
     * @param {Pointer<Void>} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {IMetaDataImport} pImport 
     * @param {Integer} tdImport 
     * @param {IMetaDataAssemblyEmit} pAssemEmit 
     * @param {Pointer<Integer>} ptr 
     * @returns {HRESULT} 
     */
    DefineImportType(pAssemImport, pbHashValue, cbHashValue, pImport, tdImport, pAssemEmit, ptr) {
        result := ComCall(13, this, "ptr", pAssemImport, "ptr", pbHashValue, "uint", cbHashValue, "ptr", pImport, "uint", tdImport, "ptr", pAssemEmit, "uint*", ptr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tkImport 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<Integer>} pmr 
     * @returns {HRESULT} 
     */
    DefineMemberRef(tkImport, szName, pvSigBlob, cbSigBlob, pmr) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(14, this, "uint", tkImport, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMetaDataAssemblyImport} pAssemImport 
     * @param {Pointer<Void>} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {IMetaDataImport} pImport 
     * @param {Integer} mbMember 
     * @param {IMetaDataAssemblyEmit} pAssemEmit 
     * @param {Integer} tkParent 
     * @param {Pointer<Integer>} pmr 
     * @returns {HRESULT} 
     */
    DefineImportMember(pAssemImport, pbHashValue, cbHashValue, pImport, mbMember, pAssemEmit, tkParent, pmr) {
        result := ComCall(15, this, "ptr", pAssemImport, "ptr", pbHashValue, "uint", cbHashValue, "ptr", pImport, "uint", mbMember, "ptr", pAssemEmit, "uint", tkParent, "uint*", pmr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szEvent 
     * @param {Integer} dwEventFlags 
     * @param {Integer} tkEventType 
     * @param {Integer} mdAddOn 
     * @param {Integer} mdRemoveOn 
     * @param {Integer} mdFire 
     * @param {Pointer<Integer>} rmdOtherMethods 
     * @param {Pointer<Integer>} pmdEvent 
     * @returns {HRESULT} 
     */
    DefineEvent(td, szEvent, dwEventFlags, tkEventType, mdAddOn, mdRemoveOn, mdFire, rmdOtherMethods, pmdEvent) {
        szEvent := szEvent is String ? StrPtr(szEvent) : szEvent

        result := ComCall(16, this, "uint", td, "ptr", szEvent, "uint", dwEventFlags, "uint", tkEventType, "uint", mdAddOn, "uint", mdRemoveOn, "uint", mdFire, "uint*", rmdOtherMethods, "uint*", pmdEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {Integer} dwPackSize 
     * @param {Pointer<COR_FIELD_OFFSET>} rFieldOffsets 
     * @param {Integer} ulClassSize 
     * @returns {HRESULT} 
     */
    SetClassLayout(td, dwPackSize, rFieldOffsets, ulClassSize) {
        result := ComCall(17, this, "uint", td, "uint", dwPackSize, "ptr", rFieldOffsets, "uint", ulClassSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @returns {HRESULT} 
     */
    DeleteClassLayout(td) {
        result := ComCall(18, this, "uint", td, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<Integer>} pvNativeType 
     * @param {Integer} cbNativeType 
     * @returns {HRESULT} 
     */
    SetFieldMarshal(tk, pvNativeType, cbNativeType) {
        result := ComCall(19, this, "uint", tk, "char*", pvNativeType, "uint", cbNativeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @returns {HRESULT} 
     */
    DeleteFieldMarshal(tk) {
        result := ComCall(20, this, "uint", tk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Integer} dwAction 
     * @param {Pointer<Void>} pvPermission 
     * @param {Integer} cbPermission 
     * @param {Pointer<Integer>} ppm 
     * @returns {HRESULT} 
     */
    DefinePermissionSet(tk, dwAction, pvPermission, cbPermission, ppm) {
        result := ComCall(21, this, "uint", tk, "uint", dwAction, "ptr", pvPermission, "uint", cbPermission, "uint*", ppm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} md 
     * @param {Integer} ulRVA 
     * @returns {HRESULT} 
     */
    SetRVA(md, ulRVA) {
        result := ComCall(22, this, "uint", md, "uint", ulRVA, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pvSig 
     * @param {Integer} cbSig 
     * @param {Pointer<Integer>} pmsig 
     * @returns {HRESULT} 
     */
    GetTokenFromSig(pvSig, cbSig, pmsig) {
        result := ComCall(23, this, "char*", pvSig, "uint", cbSig, "uint*", pmsig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} pmur 
     * @returns {HRESULT} 
     */
    DefineModuleRef(szName, pmur) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(24, this, "ptr", szName, "uint*", pmur, "HRESULT")
        return result
    }

    /**
     * Changes the parent window of the specified child window.
     * @param {Integer} mr 
     * @param {Integer} tk 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a handle to the previous parent window.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setparent
     */
    SetParent(mr, tk) {
        result := ComCall(25, this, "uint", mr, "uint", tk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pvSig 
     * @param {Integer} cbSig 
     * @param {Pointer<Integer>} ptypespec 
     * @returns {HRESULT} 
     */
    GetTokenFromTypeSpec(pvSig, cbSig, ptypespec) {
        result := ComCall(26, this, "char*", pvSig, "uint", cbSig, "uint*", ptypespec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    SaveToMemory(pbData, cbData) {
        result := ComCall(27, this, "ptr", pbData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szString 
     * @param {Integer} cchString 
     * @param {Pointer<Integer>} pstk 
     * @returns {HRESULT} 
     */
    DefineUserString(szString, cchString, pstk) {
        szString := szString is String ? StrPtr(szString) : szString

        result := ComCall(28, this, "ptr", szString, "uint", cchString, "uint*", pstk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tkObj 
     * @returns {HRESULT} 
     */
    DeleteToken(tkObj) {
        result := ComCall(29, this, "uint", tkObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} md 
     * @param {Integer} dwMethodFlags 
     * @param {Integer} ulCodeRVA 
     * @param {Integer} dwImplFlags 
     * @returns {HRESULT} 
     */
    SetMethodProps(md, dwMethodFlags, ulCodeRVA, dwImplFlags) {
        result := ComCall(30, this, "uint", md, "uint", dwMethodFlags, "uint", ulCodeRVA, "uint", dwImplFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {Integer} dwTypeDefFlags 
     * @param {Integer} tkExtends 
     * @param {Pointer<Integer>} rtkImplements 
     * @returns {HRESULT} 
     */
    SetTypeDefProps(td, dwTypeDefFlags, tkExtends, rtkImplements) {
        result := ComCall(31, this, "uint", td, "uint", dwTypeDefFlags, "uint", tkExtends, "uint*", rtkImplements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ev 
     * @param {Integer} dwEventFlags 
     * @param {Integer} tkEventType 
     * @param {Integer} mdAddOn 
     * @param {Integer} mdRemoveOn 
     * @param {Integer} mdFire 
     * @param {Pointer<Integer>} rmdOtherMethods 
     * @returns {HRESULT} 
     */
    SetEventProps(ev, dwEventFlags, tkEventType, mdAddOn, mdRemoveOn, mdFire, rmdOtherMethods) {
        result := ComCall(32, this, "uint", ev, "uint", dwEventFlags, "uint", tkEventType, "uint", mdAddOn, "uint", mdRemoveOn, "uint", mdFire, "uint*", rmdOtherMethods, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Integer} dwAction 
     * @param {Pointer<Void>} pvPermission 
     * @param {Integer} cbPermission 
     * @param {Pointer<Integer>} ppm 
     * @returns {HRESULT} 
     */
    SetPermissionSetProps(tk, dwAction, pvPermission, cbPermission, ppm) {
        result := ComCall(33, this, "uint", tk, "uint", dwAction, "ptr", pvPermission, "uint", cbPermission, "uint*", ppm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Integer} dwMappingFlags 
     * @param {PWSTR} szImportName 
     * @param {Integer} mrImportDLL 
     * @returns {HRESULT} 
     */
    DefinePinvokeMap(tk, dwMappingFlags, szImportName, mrImportDLL) {
        szImportName := szImportName is String ? StrPtr(szImportName) : szImportName

        result := ComCall(34, this, "uint", tk, "uint", dwMappingFlags, "ptr", szImportName, "uint", mrImportDLL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Integer} dwMappingFlags 
     * @param {PWSTR} szImportName 
     * @param {Integer} mrImportDLL 
     * @returns {HRESULT} 
     */
    SetPinvokeMap(tk, dwMappingFlags, szImportName, mrImportDLL) {
        szImportName := szImportName is String ? StrPtr(szImportName) : szImportName

        result := ComCall(35, this, "uint", tk, "uint", dwMappingFlags, "ptr", szImportName, "uint", mrImportDLL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @returns {HRESULT} 
     */
    DeletePinvokeMap(tk) {
        result := ComCall(36, this, "uint", tk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tkOwner 
     * @param {Integer} tkCtor 
     * @param {Pointer<Void>} pCustomAttribute 
     * @param {Integer} cbCustomAttribute 
     * @param {Pointer<Integer>} pcv 
     * @returns {HRESULT} 
     */
    DefineCustomAttribute(tkOwner, tkCtor, pCustomAttribute, cbCustomAttribute, pcv) {
        result := ComCall(37, this, "uint", tkOwner, "uint", tkCtor, "ptr", pCustomAttribute, "uint", cbCustomAttribute, "uint*", pcv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pcv 
     * @param {Pointer<Void>} pCustomAttribute 
     * @param {Integer} cbCustomAttribute 
     * @returns {HRESULT} 
     */
    SetCustomAttributeValue(pcv, pCustomAttribute, cbCustomAttribute) {
        result := ComCall(38, this, "uint", pcv, "ptr", pCustomAttribute, "uint", cbCustomAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Integer} dwFieldFlags 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Integer} dwCPlusTypeFlag 
     * @param {Pointer<Void>} pValue 
     * @param {Integer} cchValue 
     * @param {Pointer<Integer>} pmd 
     * @returns {HRESULT} 
     */
    DefineField(td, szName, dwFieldFlags, pvSigBlob, cbSigBlob, dwCPlusTypeFlag, pValue, cchValue, pmd) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(39, this, "uint", td, "ptr", szName, "uint", dwFieldFlags, "char*", pvSigBlob, "uint", cbSigBlob, "uint", dwCPlusTypeFlag, "ptr", pValue, "uint", cchValue, "uint*", pmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szProperty 
     * @param {Integer} dwPropFlags 
     * @param {Pointer<Integer>} pvSig 
     * @param {Integer} cbSig 
     * @param {Integer} dwCPlusTypeFlag 
     * @param {Pointer<Void>} pValue 
     * @param {Integer} cchValue 
     * @param {Integer} mdSetter 
     * @param {Integer} mdGetter 
     * @param {Pointer<Integer>} rmdOtherMethods 
     * @param {Pointer<Integer>} pmdProp 
     * @returns {HRESULT} 
     */
    DefineProperty(td, szProperty, dwPropFlags, pvSig, cbSig, dwCPlusTypeFlag, pValue, cchValue, mdSetter, mdGetter, rmdOtherMethods, pmdProp) {
        szProperty := szProperty is String ? StrPtr(szProperty) : szProperty

        result := ComCall(40, this, "uint", td, "ptr", szProperty, "uint", dwPropFlags, "char*", pvSig, "uint", cbSig, "uint", dwCPlusTypeFlag, "ptr", pValue, "uint", cchValue, "uint", mdSetter, "uint", mdGetter, "uint*", rmdOtherMethods, "uint*", pmdProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} md 
     * @param {Integer} ulParamSeq 
     * @param {PWSTR} szName 
     * @param {Integer} dwParamFlags 
     * @param {Integer} dwCPlusTypeFlag 
     * @param {Pointer<Void>} pValue 
     * @param {Integer} cchValue 
     * @param {Pointer<Integer>} ppd 
     * @returns {HRESULT} 
     */
    DefineParam(md, ulParamSeq, szName, dwParamFlags, dwCPlusTypeFlag, pValue, cchValue, ppd) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(41, this, "uint", md, "uint", ulParamSeq, "ptr", szName, "uint", dwParamFlags, "uint", dwCPlusTypeFlag, "ptr", pValue, "uint", cchValue, "uint*", ppd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fd 
     * @param {Integer} dwFieldFlags 
     * @param {Integer} dwCPlusTypeFlag 
     * @param {Pointer<Void>} pValue 
     * @param {Integer} cchValue 
     * @returns {HRESULT} 
     */
    SetFieldProps(fd, dwFieldFlags, dwCPlusTypeFlag, pValue, cchValue) {
        result := ComCall(42, this, "uint", fd, "uint", dwFieldFlags, "uint", dwCPlusTypeFlag, "ptr", pValue, "uint", cchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pr 
     * @param {Integer} dwPropFlags 
     * @param {Integer} dwCPlusTypeFlag 
     * @param {Pointer<Void>} pValue 
     * @param {Integer} cchValue 
     * @param {Integer} mdSetter 
     * @param {Integer} mdGetter 
     * @param {Pointer<Integer>} rmdOtherMethods 
     * @returns {HRESULT} 
     */
    SetPropertyProps(pr, dwPropFlags, dwCPlusTypeFlag, pValue, cchValue, mdSetter, mdGetter, rmdOtherMethods) {
        result := ComCall(43, this, "uint", pr, "uint", dwPropFlags, "uint", dwCPlusTypeFlag, "ptr", pValue, "uint", cchValue, "uint", mdSetter, "uint", mdGetter, "uint*", rmdOtherMethods, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pd 
     * @param {PWSTR} szName 
     * @param {Integer} dwParamFlags 
     * @param {Integer} dwCPlusTypeFlag 
     * @param {Pointer<Void>} pValue 
     * @param {Integer} cchValue 
     * @returns {HRESULT} 
     */
    SetParamProps(pd, szName, dwParamFlags, dwCPlusTypeFlag, pValue, cchValue) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(44, this, "uint", pd, "ptr", szName, "uint", dwParamFlags, "uint", dwCPlusTypeFlag, "ptr", pValue, "uint", cchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tkObj 
     * @param {Pointer<COR_SECATTR>} rSecAttrs 
     * @param {Integer} cSecAttrs 
     * @param {Pointer<Integer>} pulErrorAttr 
     * @returns {HRESULT} 
     */
    DefineSecurityAttributeSet(tkObj, rSecAttrs, cSecAttrs, pulErrorAttr) {
        result := ComCall(45, this, "uint", tkObj, "ptr", rSecAttrs, "uint", cSecAttrs, "uint*", pulErrorAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pImport 
     * @returns {HRESULT} 
     */
    ApplyEditAndContinue(pImport) {
        result := ComCall(46, this, "ptr", pImport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMetaDataAssemblyImport} pAssemImport 
     * @param {Pointer<Void>} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {IMetaDataImport} import 
     * @param {Pointer<Integer>} pbSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {IMetaDataAssemblyEmit} pAssemEmit 
     * @param {IMetaDataEmit} emit 
     * @param {Pointer<Integer>} pvTranslatedSig 
     * @param {Integer} cbTranslatedSigMax 
     * @param {Pointer<Integer>} pcbTranslatedSig 
     * @returns {HRESULT} 
     */
    TranslateSigWithScope(pAssemImport, pbHashValue, cbHashValue, import, pbSigBlob, cbSigBlob, pAssemEmit, emit, pvTranslatedSig, cbTranslatedSigMax, pcbTranslatedSig) {
        result := ComCall(47, this, "ptr", pAssemImport, "ptr", pbHashValue, "uint", cbHashValue, "ptr", import, "char*", pbSigBlob, "uint", cbSigBlob, "ptr", pAssemEmit, "ptr", emit, "char*", pvTranslatedSig, "uint", cbTranslatedSigMax, "uint*", pcbTranslatedSig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} md 
     * @param {Integer} dwImplFlags 
     * @returns {HRESULT} 
     */
    SetMethodImplFlags(md, dwImplFlags) {
        result := ComCall(48, this, "uint", md, "uint", dwImplFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fd 
     * @param {Integer} ulRVA 
     * @returns {HRESULT} 
     */
    SetFieldRVA(fd, ulRVA) {
        result := ComCall(49, this, "uint", fd, "uint", ulRVA, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMetaDataImport} pImport 
     * @param {IMapToken} pHostMapToken 
     * @param {IUnknown} pHandler 
     * @returns {HRESULT} 
     */
    Merge(pImport, pHostMapToken, pHandler) {
        result := ComCall(50, this, "ptr", pImport, "ptr", pHostMapToken, "ptr", pHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MergeEnd() {
        result := ComCall(51, this, "HRESULT")
        return result
    }
}
