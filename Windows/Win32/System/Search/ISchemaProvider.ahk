#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEntity.ahk" { IEntity }
#Import ".\ITokenCollection.ahk" { ITokenCollection }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISchemaLocalizerSupport.ahk" { ISchemaLocalizerSupport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a schema repository that can be browsed.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-ischemaprovider
 * @namespace Windows.Win32.System.Search
 */
export default struct ISchemaProvider extends IUnknown {
    /**
     * The interface identifier for ISchemaProvider
     * @type {Guid}
     */
    static IID := Guid("{8cf89bcb-394c-49b2-ae28-a59dd4ed7f68}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Entities                  : IntPtr
        RootEntity                : IntPtr
        GetEntity                 : IntPtr
        MetaData                  : IntPtr
        Localize                  : IntPtr
        SaveBinary                : IntPtr
        LookupAuthoredNamedEntity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an enumeration of IEntity objects with one entry for each entity in the loaded schema.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to an enumeration of entities. The calling application must release it by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-entities
     */
    Entities(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &pEntities := 0, "HRESULT")
        return pEntities
    }

    /**
     * Retrieves the root entity of the loaded schema.
     * @returns {IEntity} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives a pointer to the root entity. The calling application must release it by invoking its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-rootentity
     */
    RootEntity() {
        result := ComCall(4, this, "ptr*", &pRootEntity := 0, "HRESULT")
        return IEntity(pRootEntity)
    }

    /**
     * Retrieves an entity by name from the loaded schema.
     * @param {PWSTR} pszEntityName Type: <b>LPCWSTR</b>
     * 
     * The name of the entity being requested.
     * @returns {IEntity} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives the address of a pointer to the requested entity. The calling application must release the entity by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. If there is no entity with the specified name, this parameter is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-getentity
     */
    GetEntity(pszEntityName) {
        pszEntityName := pszEntityName is String ? StrPtr(pszEntityName) : pszEntityName

        result := ComCall(5, this, "ptr", pszEntityName, "ptr*", &pEntity := 0, "HRESULT")
        return IEntity(pEntity)
    }

    /**
     * Retrieves an enumeration of global IMetaData objects for the loaded schema.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to an enumeration of the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-imetadata">IMetaData</a> objects. The calling application must release it by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-metadata
     */
    MetaData(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, "ptr*", &pMetaData := 0, "HRESULT")
        return pMetaData
    }

    /**
     * Localizes the currently loaded schema for a specified locale.
     * @remarks
     * Before this method is called, the loaded schema should typically be a schema that is not localized, such as the one in %SYSTEMROOT%\System32\StructuredQuerySchema.bin. This method makes the loaded schema suitable for parsing queries in the specified locale, using the object specified in the <i>pSchemaLocalizerSupport</i> parameter. The localized schema can then be saved into a schema binary by calling the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-ischemaprovider-savebinary">ISchemaProvider::SaveBinary</a> method.
     * 
     * Most applications should use <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparsermanager-createloadedparser">CreateLoadedParser</a> to obtain a query parser loaded with a localized schema, instead of using this method explicitly.
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * The locale to localize for.
     * @param {ISchemaLocalizerSupport} pSchemaLocalizerSupport Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemalocalizersupport">ISchemaLocalizerSupport</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemalocalizersupport">ISchemaLocalizerSupport</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-localize
     */
    Localize(lcid, pSchemaLocalizerSupport) {
        result := ComCall(7, this, "uint", lcid, "ptr", pSchemaLocalizerSupport, "HRESULT")
        return result
    }

    /**
     * Saves the loaded schema as a schema binary at a specified path.
     * @remarks
     * Any existing file at the location specified by <i>pszSchemaBinaryPath</i> is overwritten.
     * @param {PWSTR} pszSchemaBinaryPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that contains the fully qualified path at which to save the schema binary.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-savebinary
     */
    SaveBinary(pszSchemaBinaryPath) {
        pszSchemaBinaryPath := pszSchemaBinaryPath is String ? StrPtr(pszSchemaBinaryPath) : pszSchemaBinaryPath

        result := ComCall(8, this, "ptr", pszSchemaBinaryPath, "HRESULT")
        return result
    }

    /**
     * Finds named entities of a specified type in a tokenized string, and returns the value of the entity and the number of tokens the entity value occupies.
     * @remarks
     * The method finds only named entities authored with keywords in the schema, not named entities recognized by an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iconditiongenerator">IConditionGenerator</a> object.
     * @param {IEntity} pEntity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a> object identifying the type of named entity to locate.
     * @param {PWSTR} pszInputString Type: <b>LPCWSTR</b>
     * 
     * An input string in which to search for named entity keywords.
     * @param {ITokenCollection} pTokenCollection Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-itokencollection">ITokenCollection</a>*</b>
     * 
     * A pointer to the tokenization of the string in the <i>pszInputString</i> parameter.
     * @param {Integer} cTokensBegin Type: <b>ULONG</b>
     * 
     * The zero-based position of a token in the <i>pTokenCollection</i> from which to start searching.
     * @param {Pointer<Integer>} pcTokensLength Type: <b>ULONG*</b>
     * 
     * Receives a pointer to the number of tokens covered by the named entity keyword that was found.
     * @param {Pointer<PWSTR>} ppszValue Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the value of the named entity that was found, as a Unicode string. The caller must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. An <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-inamedentity">INamedEntity</a> object can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-ientity-getnamedentity">GetNamedEntity</a> method of <i>pEntity</i> and passing the string that was received in this parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the token sequence beginning at position <i>cTokensBegin</i> denotes a named entity of the specified (entity) type. If there is no such token sequence, returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-lookupauthorednamedentity
     */
    LookupAuthoredNamedEntity(pEntity, pszInputString, pTokenCollection, cTokensBegin, pcTokensLength, ppszValue) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        pcTokensLengthMarshal := pcTokensLength is VarRef ? "uint*" : "ptr"
        ppszValueMarshal := ppszValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pEntity, "ptr", pszInputString, "ptr", pTokenCollection, "uint", cTokensBegin, pcTokensLengthMarshal, pcTokensLength, ppszValueMarshal, ppszValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISchemaProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Entities := CallbackCreate(GetMethod(implObj, "Entities"), flags, 3)
        this.vtbl.RootEntity := CallbackCreate(GetMethod(implObj, "RootEntity"), flags, 2)
        this.vtbl.GetEntity := CallbackCreate(GetMethod(implObj, "GetEntity"), flags, 3)
        this.vtbl.MetaData := CallbackCreate(GetMethod(implObj, "MetaData"), flags, 3)
        this.vtbl.Localize := CallbackCreate(GetMethod(implObj, "Localize"), flags, 3)
        this.vtbl.SaveBinary := CallbackCreate(GetMethod(implObj, "SaveBinary"), flags, 2)
        this.vtbl.LookupAuthoredNamedEntity := CallbackCreate(GetMethod(implObj, "LookupAuthoredNamedEntity"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Entities)
        CallbackFree(this.vtbl.RootEntity)
        CallbackFree(this.vtbl.GetEntity)
        CallbackFree(this.vtbl.MetaData)
        CallbackFree(this.vtbl.Localize)
        CallbackFree(this.vtbl.SaveBinary)
        CallbackFree(this.vtbl.LookupAuthoredNamedEntity)
    }
}
