#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Reads a domain credential from the Credential Manager.
 * @remarks
 * A pointer to the <b>CrediReadDomainCredentials</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-lsa_secpkg_function_table">LSA_SECPKG_FUNCTION_TABLE</a> structure received by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitializefn">SpInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecpkg/nc-ntsecpkg-credreaddomaincredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class CredReadDomainCredentialsFn extends IUnknown {

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
     * @param {Integer} CredFlags 
     * @param {Pointer<CREDENTIAL_TARGET_INFORMATIONW>} TargetInfo 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} Count 
     * @param {Pointer<Pointer<Pointer<ENCRYPTED_CREDENTIALW>>>} Credential 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(LogonId, CredFlags, TargetInfo, Flags, Count, Credential) {
        CountMarshal := Count is VarRef ? "uint*" : "ptr"
        CredentialMarshal := Credential is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", LogonId, "uint", CredFlags, "ptr", TargetInfo, "uint", Flags, CountMarshal, Count, CredentialMarshal, Credential, "int")
        return result
    }
}
