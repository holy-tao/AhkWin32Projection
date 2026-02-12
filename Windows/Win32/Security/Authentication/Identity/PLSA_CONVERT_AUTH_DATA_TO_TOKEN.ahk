#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_CONVERT_AUTH_DATA_TO_TOKEN extends IUnknown {

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
     * @param {Pointer<Void>} UserAuthData 
     * @param {Integer} UserAuthDataSize 
     * @param {Integer} ImpersonationLevel 
     * @param {Pointer<TOKEN_SOURCE>} TokenSource 
     * @param {Integer} LogonType 
     * @param {Pointer<LSA_UNICODE_STRING>} AuthorityName 
     * @param {Pointer<HANDLE>} Token 
     * @param {Pointer<LUID>} LogonId 
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName 
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
    Invoke(UserAuthData, UserAuthDataSize, ImpersonationLevel, TokenSource, LogonType, AuthorityName, Token, LogonId, AccountName, SubStatus) {
        UserAuthDataMarshal := UserAuthData is VarRef ? "ptr" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, UserAuthDataMarshal, UserAuthData, "uint", UserAuthDataSize, "int", ImpersonationLevel, "ptr", TokenSource, "int", LogonType, "ptr", AuthorityName, "ptr", Token, "ptr", LogonId, "ptr", AccountName, SubStatusMarshal, SubStatus, "int")
        return result
    }
}
