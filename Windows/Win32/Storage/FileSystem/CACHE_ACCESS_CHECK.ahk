#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CACHE_ACCESS_CHECK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @param {HANDLE} hClientToken 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {Pointer<PRIVILEGE_SET>} PrivilegeSet 
     * @param {Pointer<Integer>} PrivilegeSetLength 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<BOOL>} AccessStatus 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pSecurityDescriptor, hClientToken, dwDesiredAccess, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor
        hClientToken := hClientToken is Win32Handle ? NumGet(hClientToken, "ptr") : hClientToken

        PrivilegeSetLengthMarshal := PrivilegeSetLength is VarRef ? "uint*" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pSecurityDescriptor, "ptr", hClientToken, "uint", dwDesiredAccess, "ptr", GenericMapping, "ptr", PrivilegeSet, PrivilegeSetLengthMarshal, PrivilegeSetLength, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, "int")
        return result
    }
}
