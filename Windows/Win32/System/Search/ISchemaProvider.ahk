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
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-entities
     */
    Entities(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &pEntities := 0, "HRESULT")
        return pEntities
    }

    /**
     * 
     * @returns {IEntity} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-rootentity
     */
    RootEntity() {
        result := ComCall(4, this, "ptr*", &pRootEntity := 0, "HRESULT")
        return IEntity(pRootEntity)
    }

    /**
     * 
     * @param {PWSTR} pszEntityName 
     * @returns {IEntity} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-getentity
     */
    GetEntity(pszEntityName) {
        pszEntityName := pszEntityName is String ? StrPtr(pszEntityName) : pszEntityName

        result := ComCall(5, this, "ptr", pszEntityName, "ptr*", &pEntity := 0, "HRESULT")
        return IEntity(pEntity)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-metadata
     */
    MetaData(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &pMetaData := 0, "HRESULT")
        return pMetaData
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {ISchemaLocalizerSupport} pSchemaLocalizerSupport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-localize
     */
    Localize(lcid, pSchemaLocalizerSupport) {
        result := ComCall(7, this, "uint", lcid, "ptr", pSchemaLocalizerSupport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSchemaBinaryPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-savebinary
     */
    SaveBinary(pszSchemaBinaryPath) {
        pszSchemaBinaryPath := pszSchemaBinaryPath is String ? StrPtr(pszSchemaBinaryPath) : pszSchemaBinaryPath

        result := ComCall(8, this, "ptr", pszSchemaBinaryPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IEntity} pEntity 
     * @param {PWSTR} pszInputString 
     * @param {ITokenCollection} pTokenCollection 
     * @param {Integer} cTokensBegin 
     * @param {Pointer<Integer>} pcTokensLength 
     * @param {Pointer<PWSTR>} ppszValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemaprovider-lookupauthorednamedentity
     */
    LookupAuthoredNamedEntity(pEntity, pszInputString, pTokenCollection, cTokensBegin, pcTokensLength, ppszValue) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        pcTokensLengthMarshal := pcTokensLength is VarRef ? "uint*" : "ptr"
        ppszValueMarshal := ppszValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pEntity, "ptr", pszInputString, "ptr", pTokenCollection, "uint", cTokensBegin, pcTokensLengthMarshal, pcTokensLength, ppszValueMarshal, ppszValue, "HRESULT")
        return result
    }
}
