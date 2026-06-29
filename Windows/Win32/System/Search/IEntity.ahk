#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRelationship.ahk" { IRelationship }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\INamedEntity.ahk" { INamedEntity }

/**
 * Provides methods for retrieving information about an entity type in the schema.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-ientity
 * @namespace Windows.Win32.System.Search
 */
export default struct IEntity extends IUnknown {
    /**
     * The interface identifier for IEntity
     * @type {Guid}
     */
    static IID := Guid("{24264891-e80b-4fd3-b7ce-4ff2fae8931f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEntity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Name            : IntPtr
        Base            : IntPtr
        Relationships   : IntPtr
        GetRelationship : IntPtr
        MetaData        : IntPtr
        NamedEntities   : IntPtr
        GetNamedEntity  : IntPtr
        DefaultPhrase   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEntity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the name of this entity.
     * @remarks
     * Each name must be unique.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the name of this entity as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-name
     */
    Name() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Retrieves the parent entity of this entity.
     * @remarks
     * Each entity derives from some other entity, except the entity named Entity, for which this method returns S_FALSE. The derived entity inherits all relationships from the base entity.
     * @returns {IEntity} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives a pointer to the parent <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a> object, or <b>NULL</b> if there is no parent entity.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-base
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
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-relationships
     */
    Relationships(riid) {
        result := ComCall(5, this, Guid.Ptr, riid, "ptr*", &pRelationships := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-getrelationship
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
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-metadata
     */
    MetaData(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &pMetaData := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-namedentities
     */
    NamedEntities(riid) {
        result := ComCall(8, this, Guid.Ptr, riid, "ptr*", &pNamedEntities := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-getnamedentity
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
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ientity-defaultphrase
     */
    DefaultPhrase() {
        result := ComCall(10, this, PWSTR.Ptr, &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }

    Query(iid) {
        if (IEntity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Name := CallbackCreate(GetMethod(implObj, "Name"), flags, 2)
        this.vtbl.Base := CallbackCreate(GetMethod(implObj, "Base"), flags, 2)
        this.vtbl.Relationships := CallbackCreate(GetMethod(implObj, "Relationships"), flags, 3)
        this.vtbl.GetRelationship := CallbackCreate(GetMethod(implObj, "GetRelationship"), flags, 3)
        this.vtbl.MetaData := CallbackCreate(GetMethod(implObj, "MetaData"), flags, 3)
        this.vtbl.NamedEntities := CallbackCreate(GetMethod(implObj, "NamedEntities"), flags, 3)
        this.vtbl.GetNamedEntity := CallbackCreate(GetMethod(implObj, "GetNamedEntity"), flags, 3)
        this.vtbl.DefaultPhrase := CallbackCreate(GetMethod(implObj, "DefaultPhrase"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Name)
        CallbackFree(this.vtbl.Base)
        CallbackFree(this.vtbl.Relationships)
        CallbackFree(this.vtbl.GetRelationship)
        CallbackFree(this.vtbl.MetaData)
        CallbackFree(this.vtbl.NamedEntities)
        CallbackFree(this.vtbl.GetNamedEntity)
        CallbackFree(this.vtbl.DefaultPhrase)
    }
}
