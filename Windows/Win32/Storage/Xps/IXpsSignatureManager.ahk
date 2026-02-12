#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsSignature.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include .\IXpsSignatureCollection.ahk
#Include .\IXpsSignatureBlock.ahk
#Include .\IXpsSignatureBlockCollection.ahk
#Include .\IXpsSigningOptions.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages the digital signatures and digital signature requests of an XPS document.
 * @remarks
 * To initialize the signature manager for use with an XPS document, instantiate an <b>IXpsSignatureManager</b> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> as shown in the following example.
 * 
 * ```cpp
 * 
 * IXpsSignatureManager    *newInterface;
 * 
 * // Note the implicit requirement that CoInitializeEx
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsSignatureManager),
 *     NULL, 
 *     CLSCTX_INPROC_SERVER,
 *     __uuidof(IXpsSignatureManager),
 *     reinterpret_cast<LPVOID*>(&newInterface));
 * 
 * // make sure that you got a pointer
 * // to the interface
 * if (SUCCEEDED(hr)) {
 *     // Load document into signature manager from file.
 *     //  xpsDocument is initialized with the file name
 *     //  of the document to load outside of this example.
 *     hr = newInterface->LoadPackageFile (xpsDocument);
 * 
 *     // Use newInterface
 * 
 *     // Release interface pointers when finished with them
 *     newInterface->Release();
 * }
 * 
 * ```
 * 
 * 
 * The interface instantiated by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> can be used by only one XPS document, which must be loaded by calling <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagefile">LoadPackageFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream">LoadPackageStream</a> before
 * calling any other method.
 * 
 * After the <b>IXpsSignatureManager</b> interface has been instantiated and an XPS document has been loaded, the signature manager is ready for use.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturemanager
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignatureManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSignatureManager
     * @type {Guid}
     */
    static IID => Guid("{d3e8d338-fdc4-4afc-80b5-d532a1782ee1}")

    /**
     * The class identifier for XpsSignatureManager
     * @type {Guid}
     */
    static CLSID => Guid("{b0c43320-2315-44a2-b70a-0943a140a8ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadPackageFile", "LoadPackageStream", "Sign", "GetSignatureOriginPartName", "SetSignatureOriginPartName", "GetSignatures", "AddSignatureBlock", "GetSignatureBlocks", "CreateSigningOptions", "SavePackageToFile", "SavePackageToStream"]

    /**
     * Loads an existing XPS package from a file into the digital signature manager.
     * @remarks
     * After the interface has been instantiated, the XPS package must be loaded by calling this method or <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream">LoadPackageStream</a> before
     * calling any other method in this interface.
     * 
     * After an XPS package has been loaded into an instance of <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturemanager">IXpsSignatureManager</a>, calling <b>LoadPackageFile</b> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream">LoadPackageStream</a> in the same instance will return an error.
     * 
     * After <b>LoadPackageFile</b> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream">LoadPackageStream</a> has been called, the same object cannot be reused for another XPS package file or stream. To load another XPS package, a new instance of   <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturemanager">IXpsSignatureManager</a> must be instantiated.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream">LoadPackageStream</a> does not validate all content of the XPS package; it does not, for example, detect invalid markup in a FixedPage part.
     * @param {PWSTR} fileName The file name of the XPS package to be loaded.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
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
     * <i>fileName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_PACKAGE_ALREADY_OPENED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An XPS package has already  been opened in the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagefile
     */
    LoadPackageFile(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads an XPS package from a stream into the digital signature manager.
     * @remarks
     * After the interface has been instantiated, the XPS package must be loaded by calling this method or <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagefile">LoadPackageFile</a> before
     * calling any other method  in this interface.
     * 
     * After an XPS package has been loaded into an instance of <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturemanager">IXpsSignatureManager</a>, calling <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagefile">LoadPackageFile</a> or <b>LoadPackageStream</b> in the same instance will return an error.
     * 
     * After <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagefile">LoadPackageFile</a> or <b>LoadPackageStream</b> has been called, the same object cannot be reused for another XPS package file or stream. To load another XPS package, a new instance of the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturemanager">IXpsSignatureManager</a> must be instantiated.
     * 
     * <b>LoadPackageStream</b> does not validate all content of the XPS package; it does not, for example, detect invalid markup in a FixedPage part.
     * 
     * The implementation of the  <b>IStream</b> interface that is passed in <i>stream</i> must support random read access. The implementation must also contain only an XPS package and be positioned at the beginning of the stream before it can be used by this method.
     * @param {IStream} stream The stream that contains the XPS package to be loaded.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
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
     * <i>stream</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_PACKAGE_ALREADY_OPENED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An XPS package has already  been opened in the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream
     */
    LoadPackageStream(stream) {
        result := ComCall(4, this, "ptr", stream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Signs the contents of an XPS package as specified by the signing options and returns the resulting digital signature.
     * @remarks
     * Adding a new signature does not overwrite the original file or stream that was read by calling the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagefile">LoadPackageFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream">LoadPackageStream</a> method. 
     *     The signature will be added to the in-memory copy of the XPS package until the package is  saved (by calling the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-savepackagetofile">SavePackageToFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-savepackagetostream">SavePackageToStream</a> method).
     * 
     * If the new signature includes parts that contain markup compatibility elements, the default is for this method to fail with an error  of <b>XPS_E_MARKUP_COMPATIBILITY_ELEMENTS</b>. 
     *      To override this behavior, call <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_flags">IXpsSigningOptions::SetFlags</a>; this will set the <b>XPS_SIGN_FLAGS_IGNORE_MARKUP_COMPATIBILITY</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssigningoptions">IXpsSigningOptions</a> interface referenced by the <i>signOptions</i> parameter.
     * 
     * If this method returns an <b>HRESULT</b> value that is not in the list of its return values, the signature manager should be released and recreated.
     * 
     * This method will succeed  even if the new signature breaks existing signatures.
     * @param {IXpsSigningOptions} signOptions A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssigningoptions">IXpsSigningOptions</a> interface that contains the  signing options.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The SignatureMethod and the DigestMethod properties of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssigningoptions">IXpsSigningOptions</a> interface must be initialized before the pointer to that interface can be used in the <i>signOptions</i> parameter.
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<CERT_CONTEXT>} x509Certificate_ A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the X.509 certificate to be used for signing.
     * @returns {IXpsSignature} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignature">IXpsSignature</a> interface that contains the new digital signature.
     * 
     * If successful, this method creates the signature part, adds it to the package, and in <i>signature</i> returns a pointer to the interface of that signature part.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign
     */
    Sign(signOptions, x509Certificate_) {
        result := ComCall(5, this, "ptr", signOptions, "ptr", x509Certificate_, "ptr*", &signature := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsSignature(signature)
    }

    /**
     * Gets the part name of the signature origin part.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the signature origin part. If the document does not have any signatures, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-getsignatureoriginpartname
     */
    GetSignatureOriginPartName() {
        result := ComCall(6, this, "ptr*", &signatureOriginPartName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOpcPartUri(signatureOriginPartName)
    }

    /**
     * Sets the part name of the signature origin part.
     * @remarks
     * The part name cannot be set if any signatures exist.
     * @param {IOpcPartUri} signatureOriginPartName A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the signature origin part.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code shown in the table that follows or an <b>HRESULT</b> error code that is returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-setsignatureoriginpartname">IOpcDigitalSignatureManager::SetSignatureOriginPartName</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
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
     * <dt><b>XPS_E_PACKAGE_NOT_OPENED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An XPS package was not loaded into the digital signature manager before calling this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-setsignatureoriginpartname
     */
    SetSignatureOriginPartName(signatureOriginPartName) {
        result := ComCall(7, this, "ptr", signatureOriginPartName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a pointer to an IXpsSignatureCollection interface that contains a collection of XPS digital signatures.
     * @remarks
     * The signature collection that is returned in <i>signatures</i> might include digital signatures that do not comply with the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * @returns {IXpsSignatureCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturecollection">IXpsSignatureCollection</a> interface that contains a collection of XPS digital signatures.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-getsignatures
     */
    GetSignatures() {
        result := ComCall(8, this, "ptr*", &signatures := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsSignatureCollection(signatures)
    }

    /**
     * Creates a new IXpsSignatureBlock interface and adds it to the signature block collection.
     * @remarks
     * A signature block represents a SignatureDefinitions part in an XPS package. According to section 10.2.2 in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>,  zero or more SignatureDefinitions parts can be attached to each FixedDocument.
     *      This method creates a new SignatureDefinitions part with the specified name,   links it from the specified FixedDocument part by a relationship, 
     *     creates a new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> interface, and adds this new  interface to the internal signature block collection.
     * 
     * To retrieve a signature block, call   the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-getsignatureblocks">GetSignatureBlocks</a> method.
     * @param {IOpcPartUri} partName A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the URI of the new part. For the method to generate a part name, this parameter can be set to <b>NULL</b>.
     * @param {Integer} fixedDocumentIndex The index value of the FixedDocument part with which the new signature block is to be associated.
     * @returns {IXpsSignatureBlock} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> interface. If access to the new interface is not required, this parameter can be set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-addsignatureblock
     */
    AddSignatureBlock(partName, fixedDocumentIndex) {
        result := ComCall(9, this, "ptr", partName, "uint", fixedDocumentIndex, "ptr*", &signatureBlock := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsSignatureBlock(signatureBlock)
    }

    /**
     * Gets a pointer to an IXpsSignatureBlockCollection interface that contains a collection of signature blocks.
     * @returns {IXpsSignatureBlockCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblockcollection">IXpsSignatureBlockCollection</a> interface that contains a collection of signature blocks.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-getsignatureblocks
     */
    GetSignatureBlocks() {
        result := ComCall(10, this, "ptr*", &signatureBlocks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsSignatureBlockCollection(signatureBlocks)
    }

    /**
     * Creates a new IXpsSigningOptions interface.
     * @remarks
     * The new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssigningoptions">IXpsSigningOptions</a> interface can be used to set the signing options for the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign">Sign</a> method; however, the SignatureMethod and the DigestMethod  properties must be initialized before the new interface  can be used as a parameter of the <b>Sign</b> method.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssigningoptions">IXpsSigningOptions</a> interface created by this method can be used in more than one call to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign">Sign</a> method.
     * @returns {IXpsSigningOptions} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssigningoptions">IXpsSigningOptions</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions
     */
    CreateSigningOptions() {
        result := ComCall(11, this, "ptr*", &signingOptions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsSigningOptions(signingOptions)
    }

    /**
     * Saves the XPS package to a file.
     * @remarks
     * If this method returns an <b>HRESULT</b> value that is not in the list of return values for this method, the signature manager should be released and recreated.
     * @param {PWSTR} fileName The name of the file where the XPS package is to be created and saved.
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure,  which contains two separate but related data members:
     * 
     * <ul>
     * <li><b>lpSecurityDescriptor</b>, an optional security descriptor.</li>
     * <li><b>bInheritHandle</b>,  a Boolean value that determines whether the returned handle can be inherited by child processes.</li>
     * </ul>
     * If the <b>lpSecurityDescriptor</b> member of the structure is <b>NULL</b>, the file or device that is associated with the returned handle is assigned a default security descriptor.
     * 
     * For more information about this parameter, see <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * @param {Integer} flagsAndAttributes The file or device attributes and flags that will be used in file creation. For more information about this parameter, see the description of the <i>dwFlagsAndAttributes</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
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
     * <i>fileName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_PACKAGE_NOT_OPENED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An XPS package has not yet been opened in the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-savepackagetofile
     */
    SavePackageToFile(fileName, securityAttributes, flagsAndAttributes) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(12, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves the XPS package by writing it to a stream.
     * @remarks
     * If this method returns an <b>HRESULT</b> value that is not in the list of return values for this method, the signature manager should be released and recreated.
     * @param {IStream} stream The stream to which the XPS package is written.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
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
     * <i>stream</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_PACKAGE_NOT_OPENED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An XPS package has not yet been opened in the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-savepackagetostream
     */
    SavePackageToStream(stream) {
        result := ComCall(13, this, "ptr", stream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
