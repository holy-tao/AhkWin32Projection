#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enables the access control editor to communicate with the caller of the CreateSecurityPage and EditSecurity functions.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-isecurityinformation
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class ISecurityInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityInformation
     * @type {Guid}
     */
    static IID => Guid("{965fc360-16ff-11d0-91cb-00aa00bbb723}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectInformation", "GetSecurity", "SetSecurity", "GetAccessRights", "MapGeneric", "GetInheritTypes", "PropertySheetPageCallback"]

    /**
     * 
     * @param {Pointer<SI_OBJECT_INFO>} pObjectInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation-getobjectinformation
     */
    GetObjectInformation(pObjectInfo) {
        result := ComCall(3, this, "ptr", pObjectInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RequestedInformation 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor 
     * @param {BOOL} fDefault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation-getsecurity
     */
    GetSecurity(RequestedInformation, ppSecurityDescriptor, fDefault) {
        result := ComCall(4, this, "uint", RequestedInformation, "ptr", ppSecurityDescriptor, "int", fDefault, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation-setsecurity
     */
    SetSecurity(SecurityInformation, pSecurityDescriptor) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := ComCall(5, this, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidObjectType 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<SI_ACCESS>>} ppAccess 
     * @param {Pointer<Integer>} pcAccesses 
     * @param {Pointer<Integer>} piDefaultAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation-getaccessrights
     */
    GetAccessRights(pguidObjectType, dwFlags, ppAccess, pcAccesses, piDefaultAccess) {
        ppAccessMarshal := ppAccess is VarRef ? "ptr*" : "ptr"
        pcAccessesMarshal := pcAccesses is VarRef ? "uint*" : "ptr"
        piDefaultAccessMarshal := piDefaultAccess is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pguidObjectType, "uint", dwFlags, ppAccessMarshal, ppAccess, pcAccessesMarshal, pcAccesses, piDefaultAccessMarshal, piDefaultAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidObjectType 
     * @param {Pointer<Integer>} pAceFlags 
     * @param {Pointer<Integer>} pMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation-mapgeneric
     */
    MapGeneric(pguidObjectType, pAceFlags, pMask) {
        pAceFlagsMarshal := pAceFlags is VarRef ? "char*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pguidObjectType, pAceFlagsMarshal, pAceFlags, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SI_INHERIT_TYPE>>} ppInheritTypes 
     * @param {Pointer<Integer>} pcInheritTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation-getinherittypes
     */
    GetInheritTypes(ppInheritTypes, pcInheritTypes) {
        ppInheritTypesMarshal := ppInheritTypes is VarRef ? "ptr*" : "ptr"
        pcInheritTypesMarshal := pcInheritTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, ppInheritTypesMarshal, ppInheritTypes, pcInheritTypesMarshal, pcInheritTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} uMsg 
     * @param {Integer} uPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation-propertysheetpagecallback
     */
    PropertySheetPageCallback(hwnd, uMsg, uPage) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", uMsg, "int", uPage, "HRESULT")
        return result
    }
}
