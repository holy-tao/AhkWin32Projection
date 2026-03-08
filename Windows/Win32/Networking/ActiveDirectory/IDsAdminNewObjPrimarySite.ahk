#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsAdminNewObjPrimarySite interface is implemented by the system and is used by a primary object creation extension to create a new temporary object in Active Directory Domain Services and then commit the object to persistent memory.
 * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nn-dsadmin-idsadminnewobjprimarysite
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminNewObjPrimarySite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsAdminNewObjPrimarySite
     * @type {Guid}
     */
    static IID => Guid("{be2b487e-f904-11d2-82b9-00c04f68928b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNew", "Commit"]

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
}
