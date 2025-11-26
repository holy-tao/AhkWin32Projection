#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEntity.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a schema repository that can be browsed.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-ischemaprovider
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISchemaProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaProvider
     * @type {Guid}
     */
    static IID => Guid("{8cf89bcb-394c-49b2-ae28-a59dd4ed7f68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Entities", "RootEntity", "GetEntity", "MetaData", "Localize", "SaveBinary", "LookupAuthoredNamedEntity"]

    /**
     * Retrieves an enumeration of IEntity objects with one entry for each entity in the loaded schema.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to an enumeration of entities. The calling application must release it by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ischemaprovider-entities
     */
    Entities(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &pEntities := 0, "HRESULT")
        return pEntities
    }

    /**
     * Retrieves the root entity of the loaded schema.
     * @returns {IEntity} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives a pointer to the root entity. The calling application must release it by invoking its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ischemaprovider-rootentity
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
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ischemaprovider-getentity
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
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ischemaprovider-metadata
     */
    MetaData(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &pMetaData := 0, "HRESULT")
        return pMetaData
    }

    /**
     * Localizes the currently loaded schema for a specified locale.
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * The locale to localize for.
     * @param {ISchemaLocalizerSupport} pSchemaLocalizerSupport Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemalocalizersupport">ISchemaLocalizerSupport</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemalocalizersupport">ISchemaLocalizerSupport</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ischemaprovider-localize
     */
    Localize(lcid, pSchemaLocalizerSupport) {
        result := ComCall(7, this, "uint", lcid, "ptr", pSchemaLocalizerSupport, "HRESULT")
        return result
    }

    /**
     * Saves the loaded schema as a schema binary at a specified path.
     * @param {PWSTR} pszSchemaBinaryPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that contains the fully qualified path at which to save the schema binary.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ischemaprovider-savebinary
     */
    SaveBinary(pszSchemaBinaryPath) {
        pszSchemaBinaryPath := pszSchemaBinaryPath is String ? StrPtr(pszSchemaBinaryPath) : pszSchemaBinaryPath

        result := ComCall(8, this, "ptr", pszSchemaBinaryPath, "HRESULT")
        return result
    }

    /**
     * Finds named entities of a specified type in a tokenized string, and returns the value of the entity and the number of tokens the entity value occupies.
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
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ischemaprovider-lookupauthorednamedentity
     */
    LookupAuthoredNamedEntity(pEntity, pszInputString, pTokenCollection, cTokensBegin, pcTokensLength, ppszValue) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        pcTokensLengthMarshal := pcTokensLength is VarRef ? "uint*" : "ptr"
        ppszValueMarshal := ppszValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pEntity, "ptr", pszInputString, "ptr", pTokenCollection, "uint", cTokensBegin, pcTokensLengthMarshal, pcTokensLength, ppszValueMarshal, ppszValue, "HRESULT")
        return result
    }
}
