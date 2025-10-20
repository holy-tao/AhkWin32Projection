#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a schema repository that can be browsed.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-ischemaprovider
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISchemaProvider extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pEntities 
     * @returns {HRESULT} 
     */
    Entities(riid, pEntities) {
        result := ComCall(3, this, "ptr", riid, "ptr", pEntities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEntity>} pRootEntity 
     * @returns {HRESULT} 
     */
    RootEntity(pRootEntity) {
        result := ComCall(4, this, "ptr", pRootEntity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszEntityName 
     * @param {Pointer<IEntity>} pEntity 
     * @returns {HRESULT} 
     */
    GetEntity(pszEntityName, pEntity) {
        pszEntityName := pszEntityName is String ? StrPtr(pszEntityName) : pszEntityName

        result := ComCall(5, this, "ptr", pszEntityName, "ptr", pEntity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pMetaData 
     * @returns {HRESULT} 
     */
    MetaData(riid, pMetaData) {
        result := ComCall(6, this, "ptr", riid, "ptr", pMetaData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<ISchemaLocalizerSupport>} pSchemaLocalizerSupport 
     * @returns {HRESULT} 
     */
    Localize(lcid, pSchemaLocalizerSupport) {
        result := ComCall(7, this, "uint", lcid, "ptr", pSchemaLocalizerSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSchemaBinaryPath 
     * @returns {HRESULT} 
     */
    SaveBinary(pszSchemaBinaryPath) {
        pszSchemaBinaryPath := pszSchemaBinaryPath is String ? StrPtr(pszSchemaBinaryPath) : pszSchemaBinaryPath

        result := ComCall(8, this, "ptr", pszSchemaBinaryPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEntity>} pEntity 
     * @param {PWSTR} pszInputString 
     * @param {Pointer<ITokenCollection>} pTokenCollection 
     * @param {Integer} cTokensBegin 
     * @param {Pointer<UInt32>} pcTokensLength 
     * @param {Pointer<PWSTR>} ppszValue 
     * @returns {HRESULT} 
     */
    LookupAuthoredNamedEntity(pEntity, pszInputString, pTokenCollection, cTokensBegin, pcTokensLength, ppszValue) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(9, this, "ptr", pEntity, "ptr", pszInputString, "ptr", pTokenCollection, "uint", cTokensBegin, "uint*", pcTokensLength, "ptr", ppszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
