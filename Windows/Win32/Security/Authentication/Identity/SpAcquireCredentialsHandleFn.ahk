#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Called to obtain a handle to a principal's credentials.
 * @remarks
 * The package can use the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) support functions to determine whether the caller should be given access to the requested credentials.
 * 
 * Credentials obtained from <b>SpAcquireCredentialsHandle</b> are freed by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spfreecredentialshandlefn">SpFreeCredentialsHandle</a> function.
 * 
 * SSP/APs must implement the <b>SpAcquireCredentialsHandle</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpAcquireCredentialsHandle</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecpkg/nc-ntsecpkg-spacquirecredentialshandlefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SpAcquireCredentialsHandleFn extends IUnknown {

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
     * @param {Pointer<LSA_UNICODE_STRING>} PrincipalName 
     * @param {Integer} CredentialUseFlags 
     * @param {Pointer<LUID>} LogonId 
     * @param {Pointer<Void>} AuthorizationData 
     * @param {Pointer<Void>} GetKeyFunciton 
     * @param {Pointer<Void>} GetKeyArgument 
     * @param {Pointer<Pointer>} CredentialHandle 
     * @param {Pointer<Integer>} ExpirationTime 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(PrincipalName, CredentialUseFlags, LogonId, AuthorizationData, GetKeyFunciton, GetKeyArgument, CredentialHandle, ExpirationTime) {
        AuthorizationDataMarshal := AuthorizationData is VarRef ? "ptr" : "ptr"
        GetKeyFuncitonMarshal := GetKeyFunciton is VarRef ? "ptr" : "ptr"
        GetKeyArgumentMarshal := GetKeyArgument is VarRef ? "ptr" : "ptr"
        CredentialHandleMarshal := CredentialHandle is VarRef ? "ptr*" : "ptr"
        ExpirationTimeMarshal := ExpirationTime is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, "ptr", PrincipalName, "uint", CredentialUseFlags, "ptr", LogonId, AuthorizationDataMarshal, AuthorizationData, GetKeyFuncitonMarshal, GetKeyFunciton, GetKeyArgumentMarshal, GetKeyArgument, CredentialHandleMarshal, CredentialHandle, ExpirationTimeMarshal, ExpirationTime, "int")
        return result
    }
}
