#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function that filters the certificates that appear in the digital signature wizard that are displayed by the CryptUIWizDigitalSign function.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptuiapi/nc-cryptuiapi-pfncfilterproc
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class PFNCFILTERPROC extends IUnknown {

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
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @param {Pointer<BOOL>} pfInitialSelectedCert 
     * @param {Pointer<Void>} pvCallbackData 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pCertContext, pfInitialSelectedCert, pvCallbackData) {
        pfInitialSelectedCertMarshal := pfInitialSelectedCert is VarRef ? "int*" : "ptr"
        pvCallbackDataMarshal := pvCallbackData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pCertContext, pfInitialSelectedCertMarshal, pfInitialSelectedCert, pvCallbackDataMarshal, pvCallbackData, "int")
        return result
    }
}
