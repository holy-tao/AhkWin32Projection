#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE extends IUnknown {

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
     * @param {Pointer<LSA_UNICODE_STRING>} ClearPassword 
     * @param {Pointer} OldCredentials 
     * @param {Integer} OldCredentialSize 
     * @param {Integer} UserAccountControl 
     * @param {Pointer<LSA_UNICODE_STRING>} UPN 
     * @param {Pointer<LSA_UNICODE_STRING>} UserName 
     * @param {Pointer<LSA_UNICODE_STRING>} NetbiosDomainName 
     * @param {Pointer<LSA_UNICODE_STRING>} DnsDomainName 
     * @param {Pointer<Pointer<Void>>} NewCredentials 
     * @param {Pointer<Integer>} NewCredentialSize 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ClearPassword, OldCredentials, OldCredentialSize, UserAccountControl, UPN, UserName, NetbiosDomainName, DnsDomainName, NewCredentials, NewCredentialSize) {
        NewCredentialsMarshal := NewCredentials is VarRef ? "ptr*" : "ptr"
        NewCredentialSizeMarshal := NewCredentialSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", ClearPassword, "ptr", OldCredentials, "uint", OldCredentialSize, "uint", UserAccountControl, "ptr", UPN, "ptr", UserName, "ptr", NetbiosDomainName, "ptr", DnsDomainName, NewCredentialsMarshal, NewCredentials, NewCredentialSizeMarshal, NewCredentialSize, "int")
        return result
    }
}
