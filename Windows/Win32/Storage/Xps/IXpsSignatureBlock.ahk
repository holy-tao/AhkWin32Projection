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
     * 
     * @param {Pointer<IXpsSignatureRequestCollection>} requests 
     * @returns {HRESULT} 
     */
    GetRequests(requests) {
        result := ComCall(3, this, "ptr", requests, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partName 
     * @returns {HRESULT} 
     */
    GetPartName(partName) {
        result := ComCall(4, this, "ptr", partName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} fixedDocumentIndex 
     * @returns {HRESULT} 
     */
    GetDocumentIndex(fixedDocumentIndex) {
        result := ComCall(5, this, "uint*", fixedDocumentIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} fixedDocumentName 
     * @returns {HRESULT} 
     */
    GetDocumentName(fixedDocumentName) {
        result := ComCall(6, this, "ptr", fixedDocumentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} requestId 
     * @param {Pointer<IXpsSignatureRequest>} signatureRequest 
     * @returns {HRESULT} 
     */
    CreateRequest(requestId, signatureRequest) {
        requestId := requestId is String ? StrPtr(requestId) : requestId

        result := ComCall(7, this, "ptr", requestId, "ptr", signatureRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
