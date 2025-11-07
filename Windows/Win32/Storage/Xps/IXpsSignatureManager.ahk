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
 * 
 * To initialize the signature manager for use with an XPS document, instantiate an <b>IXpsSignatureManager</b> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> as shown in the following example.
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturemanager
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
     * 
     * @param {PWSTR} fileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagefile
     */
    LoadPackageFile(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream
     */
    LoadPackageStream(stream) {
        result := ComCall(4, this, "ptr", stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsSigningOptions} signOptions 
     * @param {Pointer<CERT_CONTEXT>} x509Certificate 
     * @returns {IXpsSignature} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign
     */
    Sign(signOptions, x509Certificate) {
        result := ComCall(5, this, "ptr", signOptions, "ptr", x509Certificate, "ptr*", &signature := 0, "HRESULT")
        return IXpsSignature(signature)
    }

    /**
     * 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-getsignatureoriginpartname
     */
    GetSignatureOriginPartName() {
        result := ComCall(6, this, "ptr*", &signatureOriginPartName := 0, "HRESULT")
        return IOpcPartUri(signatureOriginPartName)
    }

    /**
     * 
     * @param {IOpcPartUri} signatureOriginPartName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-setsignatureoriginpartname
     */
    SetSignatureOriginPartName(signatureOriginPartName) {
        result := ComCall(7, this, "ptr", signatureOriginPartName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsSignatureCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-getsignatures
     */
    GetSignatures() {
        result := ComCall(8, this, "ptr*", &signatures := 0, "HRESULT")
        return IXpsSignatureCollection(signatures)
    }

    /**
     * 
     * @param {IOpcPartUri} partName 
     * @param {Integer} fixedDocumentIndex 
     * @returns {IXpsSignatureBlock} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-addsignatureblock
     */
    AddSignatureBlock(partName, fixedDocumentIndex) {
        result := ComCall(9, this, "ptr", partName, "uint", fixedDocumentIndex, "ptr*", &signatureBlock := 0, "HRESULT")
        return IXpsSignatureBlock(signatureBlock)
    }

    /**
     * 
     * @returns {IXpsSignatureBlockCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-getsignatureblocks
     */
    GetSignatureBlocks() {
        result := ComCall(10, this, "ptr*", &signatureBlocks := 0, "HRESULT")
        return IXpsSignatureBlockCollection(signatureBlocks)
    }

    /**
     * 
     * @returns {IXpsSigningOptions} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions
     */
    CreateSigningOptions() {
        result := ComCall(11, this, "ptr*", &signingOptions := 0, "HRESULT")
        return IXpsSigningOptions(signingOptions)
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes 
     * @param {Integer} flagsAndAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-savepackagetofile
     */
    SavePackageToFile(fileName, securityAttributes, flagsAndAttributes) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(12, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-savepackagetostream
     */
    SavePackageToStream(stream) {
        result := ComCall(13, this, "ptr", stream, "HRESULT")
        return result
    }
}
