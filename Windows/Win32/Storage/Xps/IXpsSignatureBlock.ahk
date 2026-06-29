#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IXpsSignatureRequestCollection.ahk" { IXpsSignatureRequestCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsSignatureRequest.ahk" { IXpsSignatureRequest }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a block of signature requests that are stored in a SignatureDefinitions part.
 * @remarks
 * This interface cannot exist independently from the signature manager from which it was instantiated.
 * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsSignatureBlock extends IUnknown {
    /**
     * The interface identifier for IXpsSignatureBlock
     * @type {Guid}
     */
    static IID := Guid("{151fac09-0b97-4ac6-a323-5e4297d4322b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsSignatureBlock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRequests      : IntPtr
        GetPartName      : IntPtr
        GetDocumentIndex : IntPtr
        GetDocumentName  : IntPtr
        CreateRequest    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsSignatureBlock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to the IXpsSignatureRequestCollection interface that contains a collection of signature requests.
     * @remarks
     * Signature requests are added to the  collection of signature requests  by parsing the XML markup 
     *     of the corresponding SignatureDefinitions part while <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagefile">LoadPackageFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-loadpackagestream">LoadPackageStream</a> reads the XPS package.
     * @returns {IXpsSignatureRequestCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturerequestcollection">IXpsSignatureRequestCollection</a> interface that contains a collection of signature requests.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getrequests
     */
    GetRequests() {
        result := ComCall(3, this, "ptr*", &requests := 0, "HRESULT")
        return IXpsSignatureRequestCollection(requests)
    }

    /**
     * Gets a pointer to the IOpcPartUri interface that contains the URI of the SignatureDefinitions part.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the URI of the SignatureDefinitions part.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getpartname
     */
    GetPartName() {
        result := ComCall(4, this, "ptr*", &partName := 0, "HRESULT")
        return IOpcPartUri(partName)
    }

    /**
     * Gets the index of the FixedDocument part that references the SignatureDefinitions part that corresponds to this signature block.
     * @returns {Integer} The zero-based index of the FixedDocument part that references the SignatureDefinitions part that corresponds to this SignatureBlock.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getdocumentindex
     */
    GetDocumentIndex() {
        result := ComCall(5, this, "uint*", &fixedDocumentIndex := 0, "HRESULT")
        return fixedDocumentIndex
    }

    /**
     * Gets a pointer to the IOpcPartUri interface that contains the URI of the document part.
     * @returns {IOpcPartUri} A pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the URI of the document part.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-getdocumentname
     */
    GetDocumentName() {
        result := ComCall(6, this, "ptr*", &fixedDocumentName := 0, "HRESULT")
        return IOpcPartUri(fixedDocumentName)
    }

    /**
     * Creates a new IXpsSignatureRequest interface and adds it to the signature block.
     * @remarks
     * The new signature request must have a unique request ID; no two  requests may have the same  ID string. 
     * 
     * Creating a new request marks the signature block as <i>dirty</i> and  generates new content for the SignatureDefinitions part. When the XPS package is serialized, the  new content will overwrite the previous content in the SignatureDefinitions part.
     * @param {PWSTR} requestId A string that uniquely identifies the new signature request within the signature block. For the method to generate an ID string, set this parameter to <b>NULL</b>.
     * @returns {IXpsSignatureRequest} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturerequest">IXpsSignatureRequest</a> interface. If access to the new request interface is not  required, this parameter can be set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblock-createrequest
     */
    CreateRequest(requestId) {
        requestId := requestId is String ? StrPtr(requestId) : requestId

        result := ComCall(7, this, "ptr", requestId, "ptr*", &signatureRequest := 0, "HRESULT")
        return IXpsSignatureRequest(signatureRequest)
    }

    Query(iid) {
        if (IXpsSignatureBlock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRequests := CallbackCreate(GetMethod(implObj, "GetRequests"), flags, 2)
        this.vtbl.GetPartName := CallbackCreate(GetMethod(implObj, "GetPartName"), flags, 2)
        this.vtbl.GetDocumentIndex := CallbackCreate(GetMethod(implObj, "GetDocumentIndex"), flags, 2)
        this.vtbl.GetDocumentName := CallbackCreate(GetMethod(implObj, "GetDocumentName"), flags, 2)
        this.vtbl.CreateRequest := CallbackCreate(GetMethod(implObj, "CreateRequest"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRequests)
        CallbackFree(this.vtbl.GetPartName)
        CallbackFree(this.vtbl.GetDocumentIndex)
        CallbackFree(this.vtbl.GetDocumentName)
        CallbackFree(this.vtbl.CreateRequest)
    }
}
