#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_CREATE_TOKEN extends IUnknown {

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
     * @param {Pointer<LUID>} LogonId 
     * @param {Pointer<TOKEN_SOURCE>} TokenSource 
     * @param {Integer} LogonType 
     * @param {Integer} ImpersonationLevel 
     * @param {Integer} TokenInformationType 
     * @param {Pointer<Void>} TokenInformation 
     * @param {Pointer<TOKEN_GROUPS>} TokenGroups 
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName 
     * @param {Pointer<LSA_UNICODE_STRING>} AuthorityName 
     * @param {Pointer<LSA_UNICODE_STRING>} Workstation 
     * @param {Pointer<LSA_UNICODE_STRING>} ProfilePath 
     * @param {Pointer<HANDLE>} Token 
     * @param {Pointer<Integer>} SubStatus 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(LogonId, TokenSource, LogonType, ImpersonationLevel, TokenInformationType, TokenInformation, TokenGroups, AccountName, AuthorityName, Workstation, ProfilePath, Token, SubStatus) {
        TokenInformationMarshal := TokenInformation is VarRef ? "ptr" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", LogonId, "ptr", TokenSource, "int", LogonType, "int", ImpersonationLevel, "int", TokenInformationType, TokenInformationMarshal, TokenInformation, "ptr", TokenGroups, "ptr", AccountName, "ptr", AuthorityName, "ptr", Workstation, "ptr", ProfilePath, "ptr", Token, SubStatusMarshal, SubStatus, "int")
        return result
    }
}
