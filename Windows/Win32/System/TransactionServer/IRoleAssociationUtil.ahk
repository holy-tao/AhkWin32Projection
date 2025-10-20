#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 * @version v4.0.30319
 */
class IRoleAssociationUtil extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRoleAssociationUtil
     * @type {Guid}
     */
    static IID => Guid("{6eb22876-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for RoleAssociationUtil
     * @type {Guid}
     */
    static CLSID => Guid("{6eb22887-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssociateRole", "AssociateRoleByName"]

    /**
     * 
     * @param {BSTR} bstrRoleID 
     * @returns {HRESULT} 
     */
    AssociateRole(bstrRoleID) {
        bstrRoleID := bstrRoleID is String ? BSTR.Alloc(bstrRoleID).Value : bstrRoleID

        result := ComCall(7, this, "ptr", bstrRoleID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @returns {HRESULT} 
     */
    AssociateRoleByName(bstrRoleName) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(8, this, "ptr", bstrRoleName, "HRESULT")
        return result
    }
}
