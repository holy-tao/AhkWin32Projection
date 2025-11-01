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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Name", "Base", "Relationships", "GetRelationship", "MetaData", "NamedEntities", "GetNamedEntity", "DefaultPhrase"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-name
     */
    Name(ppszName) {
        result := ComCall(3, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEntity>} pBaseEntity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-base
     */
    Base(pBaseEntity) {
        result := ComCall(4, this, "ptr*", pBaseEntity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pRelationships 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-relationships
     */
    Relationships(riid, pRelationships) {
        result := ComCall(5, this, "ptr", riid, "ptr*", pRelationships, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszRelationName 
     * @param {Pointer<IRelationship>} pRelationship 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-getrelationship
     */
    GetRelationship(pszRelationName, pRelationship) {
        pszRelationName := pszRelationName is String ? StrPtr(pszRelationName) : pszRelationName

        result := ComCall(6, this, "ptr", pszRelationName, "ptr*", pRelationship, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pMetaData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-metadata
     */
    MetaData(riid, pMetaData) {
        result := ComCall(7, this, "ptr", riid, "ptr*", pMetaData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pNamedEntities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-namedentities
     */
    NamedEntities(riid, pNamedEntities) {
        result := ComCall(8, this, "ptr", riid, "ptr*", pNamedEntities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszValue 
     * @param {Pointer<INamedEntity>} ppNamedEntity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-getnamedentity
     */
    GetNamedEntity(pszValue, ppNamedEntity) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(9, this, "ptr", pszValue, "ptr*", ppNamedEntity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPhrase 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-defaultphrase
     */
    DefaultPhrase(ppszPhrase) {
        result := ComCall(10, this, "ptr", ppszPhrase, "HRESULT")
        return result
    }
}
