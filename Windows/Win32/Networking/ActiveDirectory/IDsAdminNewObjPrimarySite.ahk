#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsAdminNewObjPrimarySite interface is implemented by the system and is used by a primary object creation extension to create a new temporary object in Active Directory Domain Services and then commit the object to persistent memory.
 * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nn-dsadmin-idsadminnewobjprimarysite
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
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjprimarysite-createnew
     */
    CreateNew(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjprimarysite-commit
     */
    Commit() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
