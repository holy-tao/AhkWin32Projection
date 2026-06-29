#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPropertyDescription.ahk" { IPropertyDescription }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods to get the &quot;sort by&quot; columns properties for an item. This interface is used by UI objects that want to retrieve the primary or secondary sort columns for a given property.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertydescriptionaliasinfo
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyDescriptionAliasInfo extends IPropertyDescription {
    /**
     * The interface identifier for IPropertyDescriptionAliasInfo
     * @type {Guid}
     */
    static IID := Guid("{f67104fc-2af9-46fd-b32d-243c1404f3d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyDescriptionAliasInfo interfaces
    */
    struct Vtbl extends IPropertyDescription.Vtbl {
        GetSortByAlias             : IntPtr
        GetAdditionalSortByAliases : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyDescriptionAliasInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the address of a pointer to the IPropertyDescription interface containing the primary sort column.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the identifier of the requested <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface for the calling object.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionaliasinfo-getsortbyalias
     */
    GetSortByAlias(riid) {
        result := ComCall(24, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the address of a pointer to the IPropertyDescriptionList interface, which contains additional sort column values.
     * @remarks
     * The following is an example usage for this method. When sorting by System.Author: System.DateModified, System.DateCreated, and System.ItemNameDisplay may be used as secondary sort columns.  This ensures a unique sort order (for System.Author) and is used to provide a more consistent user experience.
     * 
     * 
     *  Calling applications include any UI that wants the secondary sort columns for a given property.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the identifier of the requested <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionaliasinfo-getadditionalsortbyaliases
     */
    GetAdditionalSortByAliases(riid) {
        result := ComCall(25, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IPropertyDescriptionAliasInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSortByAlias := CallbackCreate(GetMethod(implObj, "GetSortByAlias"), flags, 3)
        this.vtbl.GetAdditionalSortByAliases := CallbackCreate(GetMethod(implObj, "GetAdditionalSortByAliases"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSortByAlias)
        CallbackFree(this.vtbl.GetAdditionalSortByAliases)
    }
}
