#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_AP_LOGON_USER_EX extends IUnknown {

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
     * @param {Pointer<Pointer<Void>>} ClientRequest 
     * @param {Integer} LogonType 
     * @param {Pointer} AuthenticationInformation 
     * @param {Pointer<Void>} ClientAuthenticationBase 
     * @param {Integer} AuthenticationInformationLength 
     * @param {Pointer<Pointer<Void>>} ProfileBuffer 
     * @param {Pointer<Integer>} ProfileBufferLength 
     * @param {Pointer<LUID>} LogonId 
     * @param {Pointer<Integer>} SubStatus 
     * @param {Pointer<Integer>} TokenInformationType 
     * @param {Pointer<Pointer<Void>>} TokenInformation 
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} AccountName 
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} AuthenticatingAuthority 
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} MachineName 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ClientRequest, LogonType, AuthenticationInformation, ClientAuthenticationBase, AuthenticationInformationLength, ProfileBuffer, ProfileBufferLength, LogonId, SubStatus, TokenInformationType, TokenInformation, AccountName, AuthenticatingAuthority, MachineName) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientAuthenticationBaseMarshal := ClientAuthenticationBase is VarRef ? "ptr" : "ptr"
        ProfileBufferMarshal := ProfileBuffer is VarRef ? "ptr*" : "ptr"
        ProfileBufferLengthMarshal := ProfileBufferLength is VarRef ? "uint*" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"
        TokenInformationTypeMarshal := TokenInformationType is VarRef ? "int*" : "ptr"
        TokenInformationMarshal := TokenInformation is VarRef ? "ptr*" : "ptr"
        AccountNameMarshal := AccountName is VarRef ? "ptr*" : "ptr"
        AuthenticatingAuthorityMarshal := AuthenticatingAuthority is VarRef ? "ptr*" : "ptr"
        MachineNameMarshal := MachineName is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ClientRequestMarshal, ClientRequest, "int", LogonType, "ptr", AuthenticationInformation, ClientAuthenticationBaseMarshal, ClientAuthenticationBase, "uint", AuthenticationInformationLength, ProfileBufferMarshal, ProfileBuffer, ProfileBufferLengthMarshal, ProfileBufferLength, "ptr", LogonId, SubStatusMarshal, SubStatus, TokenInformationTypeMarshal, TokenInformationType, TokenInformationMarshal, TokenInformation, AccountNameMarshal, AccountName, AuthenticatingAuthorityMarshal, AuthenticatingAuthority, MachineNameMarshal, MachineName, "int")
        return result
    }
}
