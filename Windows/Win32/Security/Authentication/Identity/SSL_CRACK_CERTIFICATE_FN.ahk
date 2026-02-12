#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SSL_CRACK_CERTIFICATE_FN extends IUnknown {

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
     * @param {Pointer<Integer>} pbCertificate 
     * @param {Integer} cbCertificate 
     * @param {BOOL} VerifySignature 
     * @param {Pointer<Pointer<X509Certificate>>} ppCertificate 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pbCertificate, cbCertificate, VerifySignature, ppCertificate) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"
        ppCertificateMarshal := ppCertificate is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "int", VerifySignature, ppCertificateMarshal, ppCertificate, "int")
        return result
    }
}
