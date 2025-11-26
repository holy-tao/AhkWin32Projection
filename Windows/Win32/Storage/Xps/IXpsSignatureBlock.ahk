#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsSignatureRequestCollection.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include .\IXpsSignatureRequest.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a block of signature requests that are stored in a SignatureDefinitions part.
 * @remarks
 * 
 * This interface cannot exist independently from the signature manager from which it was instantiated.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignatureBlock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSignatureBlock
     * @type {Guid}
     */
    static IID => Guid("{151fac09-0b97-4ac6-a323-5e4297d4322b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRequests", "GetPartName", "GetDocumentIndex", "GetDocumentName", "CreateRequest"]

    /**
     * Gets a pointer to the IXpsSignatureRequestCollection interface that contains a collection of signature requests.
     * @returns {IXpsSignatureRequestCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturerequestcollection">IXpsSignatureRequestCollection</a> interface that contains a collection of signature requests.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getrequests
     */
    GetRequests() {
        result := ComCall(3, this, "ptr*", &requests := 0, "HRESULT")
        return IXpsSignatureRequestCollection(requests)
    }

    /**
     * Gets a pointer to the IOpcPartUri interface that contains the URI of the SignatureDefinitions part.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the URI of the SignatureDefinitions part.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getpartname
     */
    GetPartName() {
        result := ComCall(4, this, "ptr*", &partName := 0, "HRESULT")
        return IOpcPartUri(partName)
    }

    /**
     * Gets the index of the FixedDocument part that references the SignatureDefinitions part that corresponds to this signature block.
     * @returns {Integer} The zero-based index of the FixedDocument part that references the SignatureDefinitions part that corresponds to this SignatureBlock.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getdocumentindex
     */
    GetDocumentIndex() {
        result := ComCall(5, this, "uint*", &fixedDocumentIndex := 0, "HRESULT")
        return fixedDocumentIndex
    }

    /**
     * Gets a pointer to the IOpcPartUri interface that contains the URI of the document part.
     * @returns {IOpcPartUri} A pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the URI of the document part.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getdocumentname
     */
    GetDocumentName() {
        result := ComCall(6, this, "ptr*", &fixedDocumentName := 0, "HRESULT")
        return IOpcPartUri(fixedDocumentName)
    }

    /**
     * Creates a new IXpsSignatureRequest interface and adds it to the signature block.
     * @param {PWSTR} requestId A string that uniquely identifies the new signature request within the signature block. For the method to generate an ID string, set this parameter to <b>NULL</b>.
     * @returns {IXpsSignatureRequest} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturerequest">IXpsSignatureRequest</a> interface. If access to the new request interface is not  required, this parameter can be set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-createrequest
     */
    CreateRequest(requestId) {
        requestId := requestId is String ? StrPtr(requestId) : requestId

        result := ComCall(7, this, "ptr", requestId, "ptr*", &signatureRequest := 0, "HRESULT")
        return IXpsSignatureRequest(signatureRequest)
    }
}
