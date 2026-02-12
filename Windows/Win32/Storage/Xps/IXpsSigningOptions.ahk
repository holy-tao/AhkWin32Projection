#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include ..\Packaging\Opc\IOpcSignatureCustomObjectSet.ahk
#Include ..\Packaging\Opc\IOpcSignatureReferenceSet.ahk
#Include ..\Packaging\Opc\IOpcCertificateSet.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the individual signing options that are used by new signatures.
 * @remarks
 * To create a new instance of this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions">IXpsSignatureManager::CreateSigningOptions</a>.
 * 
 * When a new instance of this interface is returned by <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions">IXpsSignatureManager::CreateSigningOptions</a>, the SignatureMethod and  DigestMethod  properties are not initialized. These properties  must be initialized before the new interface can be used as a parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign">Sign</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssigningoptions
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSigningOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSigningOptions
     * @type {Guid}
     */
    static IID => Guid("{7718eae4-3215-49be-af5b-594fef7fcfa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSignatureId", "SetSignatureId", "GetSignatureMethod", "SetSignatureMethod", "GetDigestMethod", "SetDigestMethod", "GetSignaturePartName", "SetSignaturePartName", "GetPolicy", "SetPolicy", "GetSigningTimeFormat", "SetSigningTimeFormat", "GetCustomObjects", "GetCustomReferences", "GetCertificateSet", "GetFlags", "SetFlags"]

    /**
     * Gets the value of the Id attribute of the Signature element. (IXpsSigningOptions.GetSignatureId)
     * @remarks
     * This method allocates the memory used by the string that is returned in <i>signatureId</i>.  If <i>signatureId</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * The default value of the signature ID is an empty string.
     * @returns {PWSTR} The value of the <b>Id</b> attribute of the <b>Signature</b> element. If  the <b>Id</b> attribute is not present, the method returns an empty string.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(3, this, "ptr*", &signatureId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return signatureId
    }

    /**
     * Sets the value of the Id attribute of the Signature element. (IXpsSigningOptions.SetSignatureId)
     * @param {PWSTR} signatureId The string value to be set as the <b>Id</b> attribute of the <b>Signature</b> element.  If this parameter is <b>NULL</b>, the <b>Id</b> attribute is cleared.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setsignatureid
     */
    SetSignatureId(signatureId) {
        signatureId := signatureId is String ? StrPtr(signatureId) : signatureId

        result := ComCall(4, this, "ptr", signatureId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the signature method.
     * @remarks
     * A signature method must be set before signing.
     * 
     * When a new instance of this interface is returned by <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions">IXpsSignatureManager::CreateSigningOptions</a>, the SignatureMethod and  DigestMethod properties are not valid; they must be initialized before the new interface can be used as a parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign">Sign</a> method.
     * 
     * This method allocates the memory used by the string that is returned in <i>signatureMethod</i>.  If <i>signatureMethod</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * @returns {PWSTR} The signature method that is expressed as a URI. If no signature method has been set, a <b>NULL</b> pointer is returned.
     * 
     * The following signature methods have been tested in Windows 7:
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getsignaturemethod
     */
    GetSignatureMethod() {
        result := ComCall(5, this, "ptr*", &signatureMethod := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return signatureMethod
    }

    /**
     * Sets the signature method.
     * @remarks
     * The signature method must be set before signing.
     * 
     * When a new instance of this interface is returned by <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions">IXpsSignatureManager::CreateSigningOptions</a>, the SignatureMethod and  DigestMethod properties are not initialized; they must be initialized before the new interface can be used as a parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign">Sign</a> method.
     * 
     * The URI in  <i>signatureMethod</i>  must be the URI of a valid signing algorithm, such as http://www.w3.org/2000/09/xmldsig#rsa-sha1, and it must be
     *     supported by the signing certificate.
     * @param {PWSTR} signatureMethod The signature method expressed as a URI.
     * 
     * This parameter must refer to a valid signature method. The following signature methods have been tested in Windows 7:
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setsignaturemethod
     */
    SetSignatureMethod(signatureMethod) {
        signatureMethod := signatureMethod is String ? StrPtr(signatureMethod) : signatureMethod

        result := ComCall(6, this, "ptr", signatureMethod, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current digest method.
     * @remarks
     * The digest method must be set before signing.
     * 
     * When a new instance of this interface is returned by <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions">IXpsSignatureManager::CreateSigningOptions</a>, the SignatureMethod and  DigestMethod properties are not valid; they must be initialized before the new interface can be used as a parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign">Sign</a> method.
     * 
     * This method allocates the memory used by the string that is returned in <i>digestMethod</i>.  If <i>digestMethod</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * @returns {PWSTR} The current digest method.
     * 
     * The following digest methods have been tested in Windows 7:
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getdigestmethod
     */
    GetDigestMethod() {
        result := ComCall(7, this, "ptr*", &digestMethod := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return digestMethod
    }

    /**
     * Sets the URI of the digest method.
     * @remarks
     * The digest method must be set before signing.
     * 
     * When a new instance of this interface is returned by <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions">IXpsSignatureManager::CreateSigningOptions</a>, the SignatureMethod and  DigestMethod properties are not initialized. They must be initialized before the new interface can be used as a parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign">Sign</a> method.
     * 
     * Sets the string  that identifies the URI of the algorithm that is used to digest the parts, relationships, and signature references. The following is an example of a valid URI:   <a href="http://www.w3.org/2000/09/xmldsig">http://www.w3.org/2000/09/xmldsig#sha1</a>.
     * 
     * The signing certificate, signature method, 
     *     and digest method must be compatible with one another.
     * @param {PWSTR} digestMethod The URI of the digest method.
     * 
     * This parameter must refer to the URI of a valid digest method. The following digest methods have been tested in Windows 7:
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setdigestmethod
     */
    SetDigestMethod(digestMethod) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(8, this, "ptr", digestMethod, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the part name of the document's signature part.
     * @returns {IOpcPartUri} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document's signature part.
     * 
     * If a signature part name has not been set, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(9, this, "ptr*", &signaturePartName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOpcPartUri(signaturePartName)
    }

    /**
     * Sets the part name of the document's signature part.
     * @param {IOpcPartUri} signaturePartName The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document's signature part.
     * 
     * If this parameter is <b>NULL</b>, this method will generate a random, unique part name for the signature part.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setsignaturepartname
     */
    SetSignaturePartName(signaturePartName) {
        result := ComCall(10, this, "ptr", signaturePartName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the XPS_SIGN_POLICY value that specifies the signing policy.
     * @remarks
     * If the  <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_policy">XPS_SIGN_POLICY</a> value is set but does not have a  corresponding part in the package being signed, only the  relationship type will be signed.
     * @returns {Integer} The logical <b>OR</b> of the <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_policy">XPS_SIGN_POLICY</a> value that specifies the signing policy.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getpolicy
     */
    GetPolicy() {
        result := ComCall(11, this, "int*", &policy := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return policy
    }

    /**
     * Sets the XPS_SIGN_POLICY value that represents the signing policy.
     * @remarks
     * If an <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_policy">XPS_SIGN_POLICY</a> value is set and it does not have a  corresponding part in the package being signed, only the  relationship type will be signed.
     * @param {Integer} policy The logical <b>OR</b> of  the <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_policy">XPS_SIGN_POLICY</a> values to be set as the signing policy.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setpolicy
     */
    SetPolicy(policy) {
        result := ComCall(12, this, "int", policy, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the format of the signing time string.
     * @remarks
     * For more information about the format of the date-time string that is passed in <i>timeFormat</i>, see <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a>.
     * 
     * If a signing time format has not been set,  <b>OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS</b> will be used as the default format.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a> value that specifies the format of the signing time string.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getsigningtimeformat
     */
    GetSigningTimeFormat() {
        result := ComCall(13, this, "int*", &timeFormat := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return timeFormat
    }

    /**
     * Sets the format of the signing time string.
     * @remarks
     * For more information about the format of the date-time string that is  passed in <i>timeFormat</i>, see <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a>.
     * 
     * If a signing time format has not been set,   <b>OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS</b>  will be used as the default format.
     * @param {Integer} timeFormat The <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a> value that specifies the format of the signing time string.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setsigningtimeformat
     */
    SetSigningTimeFormat(timeFormat) {
        result := ComCall(14, this, "int", timeFormat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a pointer to an IOpcSignatureCustomObjectSet interface that contains a set of signature custom objects.
     * @remarks
     * The custom object set that this method returns is empty. To add  a custom object to this set, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectset-create">Create</a> method of the  interface that is returned in <i>customObjectSet</i>.
     * 
     * If a custom object must be signed, a reference to  that object  must be added  to the custom object set. For information on adding custom references, refer to  <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getcustomreferences">GetCustomReferences</a>.
     * @returns {IOpcSignatureCustomObjectSet} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobjectset">IOpcSignatureCustomObjectSet</a> interface that contains a set of signature custom objects.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getcustomobjects
     */
    GetCustomObjects() {
        result := ComCall(15, this, "ptr*", &customObjectSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOpcSignatureCustomObjectSet(customObjectSet)
    }

    /**
     * Gets a pointer to an IOpcSignatureReferenceSet interface, which contains a set of signature custom references.
     * @remarks
     * The custom reference set that this method returns is empty. To add  a custom reference to this set, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceset-create">Create</a> method of the  interface that is returned in <i>customReferenceSet</i>.
     * 
     * If a custom object must be signed, a reference to  that object  must be added  to the custom object set. For information on adding custom references, refer to  <b>GetCustomReferences</b>.
     * @returns {IOpcSignatureReferenceSet} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereferenceset">IOpcSignatureReferenceSet</a> interface, which contains a set of signature custom references.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getcustomreferences
     */
    GetCustomReferences() {
        result := ComCall(16, this, "ptr*", &customReferenceSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOpcSignatureReferenceSet(customReferenceSet)
    }

    /**
     * Gets an IOpcCertificateSet interface, which can be used to add additional certificates to the signature.
     * @remarks
     * Calling this  method is optional and provides a way for an application to add  a signing certificate to the signature. The extra certificates in this set will be separate from   the signing certificate.
     * @returns {IOpcCertificateSet} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopccertificateset">IOpcCertificateSet</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getcertificateset
     */
    GetCertificateSet() {
        result := ComCall(17, this, "ptr*", &certificateSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOpcCertificateSet(certificateSet)
    }

    /**
     * Gets the XPS_SIGN_FLAGS value that specifies the signing flags to be used for this signature.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_flags">XPS_SIGN_FLAGS</a> value that specifies the signing flags to be used for this signature.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getflags
     */
    GetFlags() {
        result := ComCall(18, this, "int*", &flags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return flags
    }

    /**
     * Sets the XPS_SIGN_FLAGS value that specifies the signing flags to use for this signature.
     * @param {Integer} flags The <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_flags">XPS_SIGN_FLAGS</a> value that specifies the signing flags to use for this signature.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setflags
     */
    SetFlags(flags) {
        result := ComCall(19, this, "int", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
