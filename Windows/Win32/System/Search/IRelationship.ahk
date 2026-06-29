#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEntity.ahk" { IEntity }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for retrieving information about a schema property.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-irelationship
 * @namespace Windows.Win32.System.Search
 */
export default struct IRelationship extends IUnknown {
    /**
     * The interface identifier for IRelationship
     * @type {Guid}
     */
    static IID := Guid("{2769280b-5108-498c-9c7f-a51239b63147}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRelationship interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Name          : IntPtr
        IsReal        : IntPtr
        Destination   : IntPtr
        MetaData      : IntPtr
        DefaultPhrase : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRelationship.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the name of the relationship.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the name of the relationship as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-name
     */
    Name() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Reports whether a relationship is real.
     * @remarks
     * A relationship is not considered real if its source entity derives from an entity
     *         that has a relationship of the same name. The purpose of such a "shadow" relationship
     *         is to store metadata specific to the inherited relationship.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives <b>TRUE</b> for a real relationship; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-isreal
     */
    IsReal() {
        result := ComCall(4, this, BOOL.Ptr, &pIsReal := 0, "HRESULT")
        return pIsReal
    }

    /**
     * Retrieves the destination IEntity object of the relationship. The destination of a relationshipo corresponds to the type of a property.
     * @returns {IEntity} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a> object, or <b>NULL</b> if the relationship is not real. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-irelationship-isreal">IRelationship::IsReal</a>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-destination
     */
    Destination() {
        result := ComCall(5, this, "ptr*", &pDestinationEntity := 0, "HRESULT")
        return IEntity(pDestinationEntity)
    }

    /**
     * Retrieves an enumeration of IMetaData objects for this relationship.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to the enumeration of <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-imetadata">IMetaData</a> objects. There may be multiple pairs with the same key (or the same value).
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-metadata
     */
    MetaData(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, "ptr*", &pMetaData := 0, "HRESULT")
        return pMetaData
    }

    /**
     * Retrieves the default phrase to use for this relationship in restatements.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the default phrase as a Unicode string. The calling application must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-defaultphrase
     */
    DefaultPhrase() {
        result := ComCall(7, this, PWSTR.Ptr, &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }

    Query(iid) {
        if (IRelationship.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Name := CallbackCreate(GetMethod(implObj, "Name"), flags, 2)
        this.vtbl.IsReal := CallbackCreate(GetMethod(implObj, "IsReal"), flags, 2)
        this.vtbl.Destination := CallbackCreate(GetMethod(implObj, "Destination"), flags, 2)
        this.vtbl.MetaData := CallbackCreate(GetMethod(implObj, "MetaData"), flags, 3)
        this.vtbl.DefaultPhrase := CallbackCreate(GetMethod(implObj, "DefaultPhrase"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Name)
        CallbackFree(this.vtbl.IsReal)
        CallbackFree(this.vtbl.Destination)
        CallbackFree(this.vtbl.MetaData)
        CallbackFree(this.vtbl.DefaultPhrase)
    }
}
