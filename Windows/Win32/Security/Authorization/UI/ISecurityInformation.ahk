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
     * 
     * @param {Pointer<SI_OBJECT_INFO>} pObjectInfo 
     * @returns {HRESULT} 
     */
    GetObjectInformation(pObjectInfo) {
        result := ComCall(3, this, "ptr", pObjectInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RequestedInformation 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor 
     * @param {BOOL} fDefault 
     * @returns {HRESULT} 
     */
    GetSecurity(RequestedInformation, ppSecurityDescriptor, fDefault) {
        result := ComCall(4, this, "uint", RequestedInformation, "ptr", ppSecurityDescriptor, "int", fDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @returns {HRESULT} 
     */
    SetSecurity(SecurityInformation, pSecurityDescriptor) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := ComCall(5, this, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidObjectType 
     * @param {Integer} dwFlags 
     * @param {Pointer<SI_ACCESS>} ppAccess 
     * @param {Pointer<UInt32>} pcAccesses 
     * @param {Pointer<UInt32>} piDefaultAccess 
     * @returns {HRESULT} 
     */
    GetAccessRights(pguidObjectType, dwFlags, ppAccess, pcAccesses, piDefaultAccess) {
        result := ComCall(6, this, "ptr", pguidObjectType, "uint", dwFlags, "ptr", ppAccess, "uint*", pcAccesses, "uint*", piDefaultAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidObjectType 
     * @param {Pointer<Byte>} pAceFlags 
     * @param {Pointer<UInt32>} pMask 
     * @returns {HRESULT} 
     */
    MapGeneric(pguidObjectType, pAceFlags, pMask) {
        result := ComCall(7, this, "ptr", pguidObjectType, "char*", pAceFlags, "uint*", pMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SI_INHERIT_TYPE>} ppInheritTypes 
     * @param {Pointer<UInt32>} pcInheritTypes 
     * @returns {HRESULT} 
     */
    GetInheritTypes(ppInheritTypes, pcInheritTypes) {
        result := ComCall(8, this, "ptr", ppInheritTypes, "uint*", pcInheritTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} uMsg 
     * @param {Integer} uPage 
     * @returns {HRESULT} 
     */
    PropertySheetPageCallback(hwnd, uMsg, uPage) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", uMsg, "int", uPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
