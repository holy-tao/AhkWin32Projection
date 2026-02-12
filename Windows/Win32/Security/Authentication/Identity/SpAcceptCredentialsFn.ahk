#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Called by the Local Security Authority (LSA) to pass the security package any credentials stored for the authenticated security principal.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> should save the credentials so that it can service requests for credentials. For additional information, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacquirecredentialshandlefn">SpAcquireCredentialsHandle</a> function.
 * 
 * SSP/APs must implement the <b>SpAcceptCredentials</b> function; unlike other SSP/AP functions the name of the function must be <b>SpAcceptCredentials</b>.
 * 
 * The LSA accesses the <b>SpAcceptCredentials</b> function through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecpkg/nc-ntsecpkg-spacceptcredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SpAcceptCredentialsFn extends IUnknown {

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
     * @param {Integer} LogonType 
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName 
     * @param {Pointer<SECPKG_PRIMARY_CRED>} PrimaryCredentials 
     * @param {Pointer<SECPKG_SUPPLEMENTAL_CRED>} SupplementalCredentials 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(LogonType, AccountName, PrimaryCredentials, SupplementalCredentials) {
        result := ComCall(3, this, "int", LogonType, "ptr", AccountName, "ptr", PrimaryCredentials, "ptr", SupplementalCredentials, "int")
        return result
    }
}
