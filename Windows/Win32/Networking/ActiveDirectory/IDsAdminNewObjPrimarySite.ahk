#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDsAdminNewObjPrimarySite interface is implemented by the system and is used by a primary object creation extension to create a new temporary object in Active Directory Domain Services and then commit the object to persistent memory.
 * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nn-dsadmin-idsadminnewobjprimarysite
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDsAdminNewObjPrimarySite extends IUnknown {
    /**
     * The interface identifier for IDsAdminNewObjPrimarySite
     * @type {Guid}
     */
    static IID := Guid("{be2b487e-f904-11d2-82b9-00c04f68928b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDsAdminNewObjPrimarySite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateNew : IntPtr
        Commit    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDsAdminNewObjPrimarySite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDsAdminNewObjPrimarySite::CreateNew method enables a primary object creation extension to create a temporary directory service object in Active Directory Domain Services.
     * @param {PWSTR} pszName Pointer to a <b>WCHAR</b> string that contains the name of the object to be created.
     * @returns {HRESULT} If the  method 
     *       succeeds, <b>S_OK</b> is returned. If the method fails, an OLE-defined error code is returned. This method fails if the calling extension is not a primary object creation extension.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjprimarysite-createnew
     */
    CreateNew(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * The IDsAdminNewObjPrimarySite::Commit method causes a single-page primary object creation extension's IDsAdminNewObjExt::WriteData method to be called and writes the temporary object to persistent memory.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnewobjprimarysite-createnew">IDsAdminNewObjPrimarySite::CreateNew</a> method must be called before <b>IDsAdminNewObjPrimarySite::Commit</b> is called.
     * 
     * When an object creation wizard contains more than one page, the system implements a "Finish" page that displays a summary of the object data to be saved. The system-implemented "Finish" page will perform the  <b>IDsAdminNewObjPrimarySite::Commit</b> operation. If, however, the object creation wizard only contains one page, the  page will have <b>OK</b> and <b>Cancel</b> command buttons instead of the  <b>Back</b>, <b>Next</b> and <b>Cancel</b> buttons normally found in a wizard and no "Finish" page is provided. Because of this, a single-page object creation extension wizard must call <b>Commit</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or an OLE-defined error code otherwise. This method fails if the calling extension is not a primary object creation extension. This method also fails if the object creation wizard contains more than one page.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjprimarysite-commit
     */
    Commit() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDsAdminNewObjPrimarySite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateNew := CallbackCreate(GetMethod(implObj, "CreateNew"), flags, 2)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateNew)
        CallbackFree(this.vtbl.Commit)
    }
}
