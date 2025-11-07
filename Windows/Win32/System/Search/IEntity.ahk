#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEntity.ahk
#Include .\IRelationship.ahk
#Include .\INamedEntity.ahk
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-name
     */
    Name() {
        result := ComCall(3, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @returns {IEntity} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-base
     */
    Base() {
        result := ComCall(4, this, "ptr*", &pBaseEntity := 0, "HRESULT")
        return IEntity(pBaseEntity)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-relationships
     */
    Relationships(riid) {
        result := ComCall(5, this, "ptr", riid, "ptr*", &pRelationships := 0, "HRESULT")
        return pRelationships
    }

    /**
     * 
     * @param {PWSTR} pszRelationName 
     * @returns {IRelationship} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-getrelationship
     */
    GetRelationship(pszRelationName) {
        pszRelationName := pszRelationName is String ? StrPtr(pszRelationName) : pszRelationName

        result := ComCall(6, this, "ptr", pszRelationName, "ptr*", &pRelationship := 0, "HRESULT")
        return IRelationship(pRelationship)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-metadata
     */
    MetaData(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &pMetaData := 0, "HRESULT")
        return pMetaData
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-namedentities
     */
    NamedEntities(riid) {
        result := ComCall(8, this, "ptr", riid, "ptr*", &pNamedEntities := 0, "HRESULT")
        return pNamedEntities
    }

    /**
     * 
     * @param {PWSTR} pszValue 
     * @returns {INamedEntity} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-getnamedentity
     */
    GetNamedEntity(pszValue) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(9, this, "ptr", pszValue, "ptr*", &ppNamedEntity := 0, "HRESULT")
        return INamedEntity(ppNamedEntity)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-defaultphrase
     */
    DefaultPhrase() {
        result := ComCall(10, this, "ptr*", &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }
}
