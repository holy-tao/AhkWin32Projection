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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEffectivePermission"]

    /**
     * 
     * @param {Pointer<Guid>} pguidObjectType 
     * @param {PSID} pUserSid 
     * @param {PWSTR} pszServerName 
     * @param {PSECURITY_DESCRIPTOR} pSD 
     * @param {Pointer<Pointer<OBJECT_TYPE_LIST>>} ppObjectTypeList 
     * @param {Pointer<Integer>} pcObjectTypeListLength 
     * @param {Pointer<Pointer<Integer>>} ppGrantedAccessList 
     * @param {Pointer<Integer>} pcGrantedAccessListLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-ieffectivepermission-geteffectivepermission
     */
    GetEffectivePermission(pguidObjectType, pUserSid, pszServerName, pSD, ppObjectTypeList, pcObjectTypeListLength, ppGrantedAccessList, pcGrantedAccessListLength) {
        pszServerName := pszServerName is String ? StrPtr(pszServerName) : pszServerName
        pSD := pSD is Win32Handle ? NumGet(pSD, "ptr") : pSD

        pcObjectTypeListLengthMarshal := pcObjectTypeListLength is VarRef ? "uint*" : "ptr"
        pcGrantedAccessListLengthMarshal := pcGrantedAccessListLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pguidObjectType, "ptr", pUserSid, "ptr", pszServerName, "ptr", pSD, "ptr*", ppObjectTypeList, pcObjectTypeListLengthMarshal, pcObjectTypeListLength, "ptr*", ppGrantedAccessList, pcGrantedAccessListLengthMarshal, pcGrantedAccessListLength, "HRESULT")
        return result
    }
}
