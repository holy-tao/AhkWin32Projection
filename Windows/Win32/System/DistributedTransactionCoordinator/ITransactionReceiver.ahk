#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransaction.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionReceiver extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionReceiver
     * @type {Guid}
     */
    static IID => Guid("{59313e03-b36c-11cf-a539-00aa006887c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnmarshalPropagationToken", "GetReturnTokenSize", "MarshalReturnToken", "Reset"]

    /**
     * 
     * @param {Integer} cbToken 
     * @param {Pointer<Integer>} rgbToken 
     * @returns {ITransaction} 
     */
    UnmarshalPropagationToken(cbToken, rgbToken) {
        rgbTokenMarshal := rgbToken is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbToken, rgbTokenMarshal, rgbToken, "ptr*", &ppTransaction := 0, "HRESULT")
        return ITransaction(ppTransaction)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReturnTokenSize() {
        result := ComCall(4, this, "uint*", &pcbReturnToken := 0, "HRESULT")
        return pcbReturnToken
    }

    /**
     * 
     * @param {Integer} cbReturnToken 
     * @param {Pointer<Integer>} rgbReturnToken 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    MarshalReturnToken(cbReturnToken, rgbReturnToken, pcbUsed) {
        rgbReturnTokenMarshal := rgbReturnToken is VarRef ? "char*" : "ptr"
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", cbReturnToken, rgbReturnTokenMarshal, rgbReturnToken, pcbUsedMarshal, pcbUsed, "HRESULT")
        return result
    }

    /**
     * Resets the time-out period or other mechanism that TPM manufacturers implement to protect against dictionary attacks on TPM authorization values.
     * @remarks
     * This method calls the TPM\_ResetLockValue command on the TPM. The exact behavior of this method varies among TPM manufacturers. Documentation from the computer or TPM manufacturer may provide additional information on the implementation of the anti-dictionary attack mechanism.
     * 
     * In general, manufacturers can detect dictionary attacks by keeping track of failed authentications. If the number or frequency of failures become high enough, the TPM will lock out further commands for a certain time. Generally, the initial time-out period will be short, to allow a legitimate user a chance to correct the situation. If failures continue, the duration of each subsequent time-out period may increase rapidly.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned. The following table lists some of the common return values.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                            | Description                                                                                                                                                                                                                                                               |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                            | The method was successful.<br/>                                                                                                                                                                                                                                     |
     * | <dl> <dt>**TPM\_E\_AUTHFAIL**</dt> <dt>2150105089 (0x80280001)</dt> </dl> | The provided owner authorization value is incorrect. Additional attempts at resetting the lock will fail with this same error. Please wait until the time-out period or other manufacturer-specific mechanism has expired before retrying locked TPM commands.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/resetauthlockout-win32-tpm
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
