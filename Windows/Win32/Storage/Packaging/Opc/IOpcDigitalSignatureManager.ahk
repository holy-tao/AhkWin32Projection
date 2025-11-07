#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcPartUri.ahk
#Include .\IOpcDigitalSignatureEnumerator.ahk
#Include .\IOpcSigningOptions.ahk
#Include .\IOpcDigitalSignature.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to Packaging Digital Signature Interfaces for a package that is represented by Packaging API objects.
 * @remarks
 * 
 *  Before the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">Sign</a> method is called to generate a signature, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">IOpcSigningOptions::SetDefaultDigestMethod</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">IOpcSigningOptions::SetSignatureMethod</a> methods must be called.
 * 
 * To create an   <b>IOpcDigitalSignatureManager</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcfactory-createdigitalsignaturemanager">IOpcFactory::CreateDigitalSignatureManager</a> method.
 * 
 * <div class="alert"><b>Important</b>  If the package is modified while the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">Sign</a> method is being executed, the method may fail or generate an inconsistent signature. To avoid corruption of the package, use the APIs to save the package prior to calling <b>Sign</b>. For information about how to save a package, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/saving-a-package">Saving a Package</a>.</div>
 * <div> </div>
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-validate">Validate</a> method checks that the specified signature (signed entities and the signature markup) has not been altered since the signature was generated, but does not validate the identity of the signer. <div class="alert"><b>Important</b>  The caller must validate the identity of the signer.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcdigitalsignaturemanager
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcDigitalSignatureManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcDigitalSignatureManager
     * @type {Guid}
     */
    static IID => Guid("{d5e62a0b-696d-462f-94df-72e33cef2659}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSignatureOriginPartName", "SetSignatureOriginPartName", "GetSignatureEnumerator", "RemoveSignature", "CreateSigningOptions", "Validate", "Sign", "ReplaceSignatureXml"]

    /**
     * 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-getsignatureoriginpartname
     */
    GetSignatureOriginPartName() {
        result := ComCall(3, this, "ptr*", &signatureOriginPartName := 0, "HRESULT")
        return IOpcPartUri(signatureOriginPartName)
    }

    /**
     * 
     * @param {IOpcPartUri} signatureOriginPartName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-setsignatureoriginpartname
     */
    SetSignatureOriginPartName(signatureOriginPartName) {
        result := ComCall(4, this, "ptr", signatureOriginPartName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOpcDigitalSignatureEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-getsignatureenumerator
     */
    GetSignatureEnumerator() {
        result := ComCall(5, this, "ptr*", &signatureEnumerator := 0, "HRESULT")
        return IOpcDigitalSignatureEnumerator(signatureEnumerator)
    }

    /**
     * 
     * @param {IOpcPartUri} signaturePartName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-removesignature
     */
    RemoveSignature(signaturePartName) {
        result := ComCall(6, this, "ptr", signaturePartName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOpcSigningOptions} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-createsigningoptions
     */
    CreateSigningOptions() {
        result := ComCall(7, this, "ptr*", &signingOptions := 0, "HRESULT")
        return IOpcSigningOptions(signingOptions)
    }

    /**
     * 
     * @param {IOpcDigitalSignature} signature 
     * @param {Pointer<CERT_CONTEXT>} certificate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-validate
     */
    Validate(signature, certificate) {
        result := ComCall(8, this, "ptr", signature, "ptr", certificate, "int*", &validationResult := 0, "HRESULT")
        return validationResult
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} certificate 
     * @param {IOpcSigningOptions} signingOptions 
     * @returns {IOpcDigitalSignature} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign
     */
    Sign(certificate, signingOptions) {
        result := ComCall(9, this, "ptr", certificate, "ptr", signingOptions, "ptr*", &digitalSignature := 0, "HRESULT")
        return IOpcDigitalSignature(digitalSignature)
    }

    /**
     * 
     * @param {IOpcPartUri} signaturePartName 
     * @param {Pointer<Integer>} newSignatureXml 
     * @param {Integer} count 
     * @returns {IOpcDigitalSignature} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-replacesignaturexml
     */
    ReplaceSignatureXml(signaturePartName, newSignatureXml, count) {
        newSignatureXmlMarshal := newSignatureXml is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "ptr", signaturePartName, newSignatureXmlMarshal, newSignatureXml, "uint", count, "ptr*", &digitalSignature := 0, "HRESULT")
        return IOpcDigitalSignature(digitalSignature)
    }
}
