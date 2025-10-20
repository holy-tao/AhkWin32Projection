#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a means to determine effective permission for a security principal on an object.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-ieffectivepermission
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class IEffectivePermission extends IUnknown{
    /**
     * The interface identifier for IEffectivePermission
     * @type {Guid}
     */
    static IID => Guid("{3853dc76-9f35-407c-88a1-d19344365fbc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguidObjectType 
     * @param {PSID} pUserSid 
     * @param {PWSTR} pszServerName 
     * @param {PSECURITY_DESCRIPTOR} pSD 
     * @param {Pointer<OBJECT_TYPE_LIST>} ppObjectTypeList 
     * @param {Pointer<UInt32>} pcObjectTypeListLength 
     * @param {Pointer<UInt32>} ppGrantedAccessList 
     * @param {Pointer<UInt32>} pcGrantedAccessListLength 
     * @returns {HRESULT} 
     */
    GetEffectivePermission(pguidObjectType, pUserSid, pszServerName, pSD, ppObjectTypeList, pcObjectTypeListLength, ppGrantedAccessList, pcGrantedAccessListLength) {
        pszServerName := pszServerName is String ? StrPtr(pszServerName) : pszServerName
        pSD := pSD is Win32Handle ? NumGet(pSD, "ptr") : pSD

        result := ComCall(3, this, "ptr", pguidObjectType, "ptr", pUserSid, "ptr", pszServerName, "ptr", pSD, "ptr", ppObjectTypeList, "uint*", pcObjectTypeListLength, "uint*", ppGrantedAccessList, "uint*", pcGrantedAccessListLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
