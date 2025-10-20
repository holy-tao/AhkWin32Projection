#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for retrieving information about an entity type in the schema.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-ientity
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IEntity extends IUnknown{
    /**
     * The interface identifier for IEntity
     * @type {Guid}
     */
    static IID => Guid("{24264891-e80b-4fd3-b7ce-4ff2fae8931f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    Name(ppszName) {
        result := ComCall(3, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEntity>} pBaseEntity 
     * @returns {HRESULT} 
     */
    Base(pBaseEntity) {
        result := ComCall(4, this, "ptr", pBaseEntity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pRelationships 
     * @returns {HRESULT} 
     */
    Relationships(riid, pRelationships) {
        result := ComCall(5, this, "ptr", riid, "ptr", pRelationships, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszRelationName 
     * @param {Pointer<IRelationship>} pRelationship 
     * @returns {HRESULT} 
     */
    GetRelationship(pszRelationName, pRelationship) {
        pszRelationName := pszRelationName is String ? StrPtr(pszRelationName) : pszRelationName

        result := ComCall(6, this, "ptr", pszRelationName, "ptr", pRelationship, "int")
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
        result := ComCall(7, this, "ptr", riid, "ptr", pMetaData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pNamedEntities 
     * @returns {HRESULT} 
     */
    NamedEntities(riid, pNamedEntities) {
        result := ComCall(8, this, "ptr", riid, "ptr", pNamedEntities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszValue 
     * @param {Pointer<INamedEntity>} ppNamedEntity 
     * @returns {HRESULT} 
     */
    GetNamedEntity(pszValue, ppNamedEntity) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(9, this, "ptr", pszValue, "ptr", ppNamedEntity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPhrase 
     * @returns {HRESULT} 
     */
    DefaultPhrase(ppszPhrase) {
        result := ComCall(10, this, "ptr", ppszPhrase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
