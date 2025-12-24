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
     * Retrieves the name of this entity.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the name of this entity as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ientity-name
     */
    Name() {
        result := ComCall(3, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Retrieves the parent entity of this entity.
     * @returns {IEntity} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives a pointer to the parent <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a> object, or <b>NULL</b> if there is no parent entity.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ientity-base
     */
    Base() {
        result := ComCall(4, this, "ptr*", &pBaseEntity := 0, "HRESULT")
        return IEntity(pBaseEntity)
    }

    /**
     * Retrieves an enumeration of IRelationship objects, one for each relationship this entity has.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the address of a pointer to the enumeration of the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-irelationship">IRelationship</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ientity-relationships
     */
    Relationships(riid) {
        result := ComCall(5, this, "ptr", riid, "ptr*", &pRelationships := 0, "HRESULT")
        return pRelationships
    }

    /**
     * Retrieves the IRelationship object for this entity as requested by name.
     * @param {PWSTR} pszRelationName Type: <b>LPCWSTR</b>
     * 
     * The name of the relationship to find.
     * @returns {IRelationship} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-irelationship">IRelationship</a>**</b>
     * 
     * Receives the address of a pointer to the requested <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-irelationship">IRelationship</a> object, or <b>NULL</b> if this entity has no relationship with the name specified.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ientity-getrelationship
     */
    GetRelationship(pszRelationName) {
        pszRelationName := pszRelationName is String ? StrPtr(pszRelationName) : pszRelationName

        result := ComCall(6, this, "ptr", pszRelationName, "ptr*", &pRelationship := 0, "HRESULT")
        return IRelationship(pRelationship)
    }

    /**
     * Retrieves an enumeration of IMetaData objects for this entity.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the address of a pointer to an enumeration of <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-imetadata">IMetaData</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ientity-metadata
     */
    MetaData(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &pMetaData := 0, "HRESULT")
        return pMetaData
    }

    /**
     * Retrieves an enumeration of INamedEntity objects, one for each known named entity of this type.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the address of a pointer to an enumeration of <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-inamedentity">INamedEntity</a> objects, one for each known named entity of this type.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ientity-namedentities
     */
    NamedEntities(riid) {
        result := ComCall(8, this, "ptr", riid, "ptr*", &pNamedEntities := 0, "HRESULT")
        return pNamedEntities
    }

    /**
     * Retrieves an INamedEntity object based on an entity name.
     * @param {PWSTR} pszValue Type: <b>LPCWSTR</b>
     * 
     * The name of an entity to be found.
     * @returns {INamedEntity} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-inamedentity">INamedEntity</a>**</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-inamedentity">INamedEntity</a> object that was named in <i>pszValue</i>. <b>NULL</b> if no named entity was found.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ientity-getnamedentity
     */
    GetNamedEntity(pszValue) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(9, this, "ptr", pszValue, "ptr*", &ppNamedEntity := 0, "HRESULT")
        return INamedEntity(ppNamedEntity)
    }

    /**
     * Retrieves a default phrase to use for this entity in restatements.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the default phrase as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ientity-defaultphrase
     */
    DefaultPhrase() {
        result := ComCall(10, this, "ptr*", &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }
}
