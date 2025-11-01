#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IXpsSignatureRequestCollection>} requests 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getrequests
     */
    GetRequests(requests) {
        result := ComCall(3, this, "ptr*", requests, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getpartname
     */
    GetPartName(partName) {
        result := ComCall(4, this, "ptr*", partName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} fixedDocumentIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getdocumentindex
     */
    GetDocumentIndex(fixedDocumentIndex) {
        result := ComCall(5, this, "uint*", fixedDocumentIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} fixedDocumentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getdocumentname
     */
    GetDocumentName(fixedDocumentName) {
        result := ComCall(6, this, "ptr*", fixedDocumentName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} requestId 
     * @param {Pointer<IXpsSignatureRequest>} signatureRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-createrequest
     */
    CreateRequest(requestId, signatureRequest) {
        requestId := requestId is String ? StrPtr(requestId) : requestId

        result := ComCall(7, this, "ptr", requestId, "ptr*", signatureRequest, "HRESULT")
        return result
    }
}
