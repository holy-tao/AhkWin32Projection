#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by the Windows Biometric Framework to build a template from the current feature set and locate a matching template in the database.
 * @remarks
 * The Authorization buffer contains the following SHA256_HMAC:
 * 
 * SHA256_HMAC(Key, SHA256(Nonce || 0xffffffe2 || SHA256(AccountSid)))
 * 
 * <ul>
 * <li>
 * Key
 * 
 * Key is the HMAC key passed in by <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_key_fn">EngineAdapterCreateKey</a>, and identified by the <i>KeyIdentifier</i> parameter.
 * 
 * </li>
 * <li>
 * Nonce
 * 
 * Nonce is the Nonce parameter.
 * 
 * </li>
 * <li>
 * 0xffffffe2
 * 
 * A 32-bit unsigned integer in big-endian format.
 * 
 * </li>
 * <li>
 * AccountSid
 * 
 * The account SID of the user referenced by the Identity parameter. The SID bytes can be obtained from the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_secure_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN extends IUnknown {

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
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Pointer<Integer>} Nonce 
     * @param {Pointer} NonceSize 
     * @param {Pointer<Integer>} KeyIdentifier 
     * @param {Pointer} KeyIdentifierSize 
     * @param {Pointer<WINBIO_IDENTITY>} Identity 
     * @param {Pointer<Integer>} SubFactor 
     * @param {Pointer<Integer>} RejectDetail 
     * @param {Pointer<Pointer<Integer>>} Authorization 
     * @param {Pointer<Pointer>} AuthorizationSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Nonce, NonceSize, KeyIdentifier, KeyIdentifierSize, Identity, SubFactor, RejectDetail, Authorization, AuthorizationSize) {
        NonceMarshal := Nonce is VarRef ? "char*" : "ptr"
        KeyIdentifierMarshal := KeyIdentifier is VarRef ? "char*" : "ptr"
        SubFactorMarshal := SubFactor is VarRef ? "char*" : "ptr"
        RejectDetailMarshal := RejectDetail is VarRef ? "uint*" : "ptr"
        AuthorizationMarshal := Authorization is VarRef ? "ptr*" : "ptr"
        AuthorizationSizeMarshal := AuthorizationSize is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, NonceMarshal, Nonce, "ptr", NonceSize, KeyIdentifierMarshal, KeyIdentifier, "ptr", KeyIdentifierSize, "ptr", Identity, SubFactorMarshal, SubFactor, RejectDetailMarshal, RejectDetail, AuthorizationMarshal, Authorization, AuthorizationSizeMarshal, AuthorizationSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
