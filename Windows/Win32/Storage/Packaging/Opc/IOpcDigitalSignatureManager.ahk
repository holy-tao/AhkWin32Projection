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
 * Before the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">Sign</a> method is called to generate a signature, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">IOpcSigningOptions::SetDefaultDigestMethod</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">IOpcSigningOptions::SetSignatureMethod</a> methods must be called.
 * 
 * To create an   <b>IOpcDigitalSignatureManager</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcfactory-createdigitalsignaturemanager">IOpcFactory::CreateDigitalSignatureManager</a> method.
 * 
 * <div class="alert"><b>Important</b>  If the package is modified while the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">Sign</a> method is being executed, the method may fail or generate an inconsistent signature. To avoid corruption of the package, use the APIs to save the package prior to calling <b>Sign</b>. For information about how to save a package, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/saving-a-package">Saving a Package</a>.</div>
 * <div> </div>
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-validate">Validate</a> method checks that the specified signature (signed entities and the signature markup) has not been altered since the signature was generated, but does not validate the identity of the signer. <div class="alert"><b>Important</b>  The caller must validate the identity of the signer.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcdigitalsignaturemanager
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
     * Gets an IOpcPartUri interface pointer that represents the part name of the Digital Signature Origin part.
     * @remarks
     * When using the APIs to generate a signature, set the Digital Signature Origin part name  by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-setsignatureoriginpartname">SetSignatureOriginPartName</a> method.
     * @returns {IOpcPartUri} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface pointer, or <b>NULL</b> if the Digital Signature Origin part does not exist.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-getsignatureoriginpartname
     */
    GetSignatureOriginPartName() {
        result := ComCall(3, this, "ptr*", &signatureOriginPartName := 0, "HRESULT")
        return IOpcPartUri(signatureOriginPartName)
    }

    /**
     * Sets the part name of the Digital Signature Origin part to the name represented by a specified IOpcPartUri interface pointer.
     * @remarks
     * If the Digital Signature Origin part exists or if the part name that is in the <i>signatureOriginPartName</i> parameter is being used for another part, this method will fail.
     * @param {IOpcPartUri} signatureOriginPartName A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface pointer that represents the desired part name for the Digital Signature Origin part.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OPC_E_DS_SIGNATURE_ORIGIN_EXISTS</b></dt>
     * <dt>0x80510054</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Digital Signature Origin part already exists in the package and cannot be renamed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OPC_E_DUPLICATE_PART</b></dt>
     * <dt>0x8051000B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A part with the specified part name already exists in the current package.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-setsignatureoriginpartname
     */
    SetSignatureOriginPartName(signatureOriginPartName) {
        result := ComCall(4, this, "ptr", signatureOriginPartName, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of IOpcDigitalSignature interface pointers, which represent package signatures.
     * @returns {IOpcDigitalSignatureEnumerator} A pointer to  an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcdigitalsignature">IOpcDigitalSignature</a> interface pointers, which represent package signatures.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-getsignatureenumerator
     */
    GetSignatureEnumerator() {
        result := ComCall(5, this, "ptr*", &signatureEnumerator := 0, "HRESULT")
        return IOpcDigitalSignatureEnumerator(signatureEnumerator)
    }

    /**
     * Removes from the package a specified signature part that stores signature markup.
     * @remarks
     * If the specified signature part does not exist, this method will fail.
     * 
     * If a part is removed from a package, it will not be saved when the package is saved.
     * 
     * If a removed part is the source of one or more relationships, those relationships will not be saved when the package is saved.
     * @param {IOpcPartUri} signaturePartName An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface pointer that represents the part name of the signature part to be removed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>signaturePartName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OPC_E_NO_SUCH_PART</b></dt>
     * <dt>0x80510018</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified part does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-removesignature
     */
    RemoveSignature(signaturePartName) {
        result := ComCall(6, this, "ptr", signaturePartName, "HRESULT")
        return result
    }

    /**
     * Creates an IOpcSigningOptions interface pointer.
     * @remarks
     * This method creates an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsigningoptions">IOpcSigningOptions</a> interface pointer that is required to set the properties of a signature to be generated
     * 
     * To generate a signature, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method with the <i>signingOptions</i> parameter value set to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsigningoptions">IOpcSigningOptions</a> interface pointer that is retrieved by the <b>CreateSigningOptions</b> method.
     * @returns {IOpcSigningOptions} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsigningoptions">IOpcSigningOptions</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-createsigningoptions
     */
    CreateSigningOptions() {
        result := ComCall(7, this, "ptr*", &signingOptions := 0, "HRESULT")
        return IOpcSigningOptions(signingOptions)
    }

    /**
     * Validates a specified package signature using a specified certificate.
     * @remarks
     * This method does not perform security checks on an X.509 Public Key Infrastructure Certificate; the caller must perform the checks for revocation, expiration, certificate chain, and all other necessary checks.
     * 
     * This method checks that the specified signature (signed entities and the signature markup) has not been altered since the signature was generated, but does not validate the identity of the signer. 
     * 
     * <div class="alert"><b>Important</b>  The caller must validate the identity of the signer.</div>
     * <div> </div>
     * If there are errors in a package signature, some of these errors may not be exposed until this method is called.
     * @param {IOpcDigitalSignature} signature An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcdigitalsignature">IOpcDigitalSignature</a> interface pointer that represents  the signature to be validated.
     * @param {Pointer<CERT_CONTEXT>} certificate A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains a certificate that is used to validate the signature.
     * @returns {Integer} A value that describes the result of the validation check.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-validate
     */
    Validate(signature, certificate) {
        result := ComCall(8, this, "ptr", signature, "ptr", certificate, "int*", &validationResult := 0, "HRESULT")
        return validationResult
    }

    /**
     * Signs the package by generating a signature by using the specified certificate and IOpcSigningOptions interface pointer.
     * @remarks
     * This method uses Packaging objects to make changes to a package. The resultant changes are not saved until the package itself is  saved.
     * 
     *  Before this  method is called to generate a signature, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">IOpcSigningOptions::SetDefaultDigestMethod</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">IOpcSigningOptions::SetSignatureMethod</a> methods.
     * 
     * To create an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsigningoptions">IOpcSigningOptions</a> interface pointer, which is required by this method, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-createsigningoptions">CreateSigningOptions</a> method. 
     * 
     * <div class="alert"><b>Important</b>  If the package is modified while this method is being executed, <b>Sign</b> may fail or generate an inconsistent signature. To avoid corruption of the package, use the APIs to save the package prior to calling <b>Sign</b>. For information about how to save a package, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/saving-a-package">Saving a Package</a>.</div>
     * <div> </div>
     * This method may create the following parts and relationships:<ul>
     * <li>The Digital Signature Origin part</li>
     * <li>The package relationship of the digital signature origin relationship type</li>
     * <li>One signature part that contains signature markup</li>
     * <li>One or more part that contains a certificate</li>
     * <li>One relationship that targets a signature part and that has the Digital Signature Origin part as its source</li>
     * <li>One or more relationship that targets a signature part that contains a certificate and that has another signature part as its source</li>
     * </ul>
     * 
     * 
     * If <b>Sign</b> fails, any of the above parts and relationships may be represented, in the package, by Packaging objects. If the method returns the <b>OPC_E_DS_SIGNATURE_METHOD_NOT_SET</b> or <b>OPC_E_DS_DEFAULT_DIGEST_METHOD_NOT_SET</b> error code, the package has not been altered.
     * 
     * If <b>Sign</b> is successful, digest values are calculated for signed entities, and the generated signature is serialized as signature markup. Possible signed entities include the <b>Signature</b> element, references, parts, relationships,  and package-specific and application-specific <b>Object</b> elements.
     * 
     * Errors that are introduced into a package signature when the caller is using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsigningoptions">IOpcSigningOptions</a> interface to set signature information may not be exposed until <b>Sign</b> is called.
     * @param {Pointer<CERT_CONTEXT>} certificate A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate.
     * @param {IOpcSigningOptions} signingOptions An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsigningoptions">IOpcSigningOptions</a> interface pointer that is used to generate the signature.
     * @returns {IOpcDigitalSignature} A new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcdigitalsignature">IOpcDigitalSignature</a> interface pointer that represents the signature.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign
     */
    Sign(certificate, signingOptions) {
        result := ComCall(9, this, "ptr", certificate, "ptr", signingOptions, "ptr*", &digitalSignature := 0, "HRESULT")
        return IOpcDigitalSignature(digitalSignature)
    }

    /**
     * Replaces the existing signature markup that is stored in a specified signature part.
     * @remarks
     * This method does not validate the signature that is derived from the  new signature markup that is in the <i>newSignatureXml</i> parameter.
     *       
     *         
     * 
     * The caller must confirm that the new signature markup, which replaces the existing signature markup in the specified signature part, will not break the signature.
     *       
     * 
     * This method changes the existing signature markup; certificates and relationships that have the specified signature part as their source are preserved.
     * @param {IOpcPartUri} signaturePartName An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface pointer that represents the part name of the signature part that stores the existing signature markup.
     * @param {Pointer<Integer>} newSignatureXml A buffer that contains the signature markup that will replace the existing markup.
     * @param {Integer} count The size of the <i>newSignatureXml</i> buffer.
     * @returns {IOpcDigitalSignature} A pointer to a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcdigitalsignature">IOpcDigitalSignature</a> interface that represents the signature derived from the signature markup that is passed in <i>newSignatureXml</i>.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignaturemanager-replacesignaturexml
     */
    ReplaceSignatureXml(signaturePartName, newSignatureXml, count) {
        newSignatureXmlMarshal := newSignatureXml is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "ptr", signaturePartName, newSignatureXmlMarshal, newSignatureXml, "uint", count, "ptr*", &digitalSignature := 0, "HRESULT")
        return IOpcDigitalSignature(digitalSignature)
    }
}
