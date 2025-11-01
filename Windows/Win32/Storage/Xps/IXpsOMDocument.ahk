#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPart.ahk

/**
 * An ordered sequence of fixed pages and document-level resources that make up the document.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMDocument    *newInterface;
  * IOpcPartUri       *partUri;
  * 
  * // Note the implicit requirement that CoInitializeEx 
  * //  has previously been called from this thread.
  * 
  * hr = CoCreateInstance(
  *     __uuidof(XpsOMObjectFactory),
  *     NULL,
  *     CLSCTX_INPROC_SERVER,
  *     _uuidof(IXpsOMObjectFactory),
  *     reinterpret_cast<LPVOID*>(&xpsFactory)
  *     );
  * 
  * if (SUCCEEDED(hr))
  * {
  *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
  *     
  *     if (SUCCEEDED(hr))
  *     {
  *         hr = xpsFactory->CreateDocument (partUri, &newInterface);
  *         
  *         if (SUCCEEDED(hr))
  *         {
  *             // use newInterface
  * 
  *             newInterface->Release();
  *         }
  *         partUri->Release();
  *     }
  *     xpsFactory->Release();
  * }
  * else
  * {
  *     // evaluate HRESULT error returned in hr
  * }
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocument
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMDocument extends IXpsOMPart{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMDocument
     * @type {Guid}
     */
    static IID => Guid("{2c2c94cb-ac5f-4254-8ee9-23948309d9f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetPageReferences", "GetPrintTicketResource", "SetPrintTicketResource", "GetDocumentStructureResource", "SetDocumentStructureResource", "GetSignatureBlockResources", "Clone"]

    /**
     * 
     * @param {Pointer<IXpsOMDocumentSequence>} documentSequence 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getowner
     */
    GetOwner(documentSequence) {
        result := ComCall(5, this, "ptr*", documentSequence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPageReferenceCollection>} pageReferences 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getpagereferences
     */
    GetPageReferences(pageReferences) {
        result := ComCall(6, this, "ptr*", pageReferences, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPrintTicketResource>} printTicketResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getprintticketresource
     */
    GetPrintTicketResource(printTicketResource) {
        result := ComCall(7, this, "ptr*", printTicketResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMPrintTicketResource} printTicketResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-setprintticketresource
     */
    SetPrintTicketResource(printTicketResource) {
        result := ComCall(8, this, "ptr", printTicketResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDocumentStructureResource>} documentStructureResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getdocumentstructureresource
     */
    GetDocumentStructureResource(documentStructureResource) {
        result := ComCall(9, this, "ptr*", documentStructureResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMDocumentStructureResource} documentStructureResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-setdocumentstructureresource
     */
    SetDocumentStructureResource(documentStructureResource) {
        result := ComCall(10, this, "ptr", documentStructureResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMSignatureBlockResourceCollection>} signatureBlockResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getsignatureblockresources
     */
    GetSignatureBlockResources(signatureBlockResources) {
        result := ComCall(11, this, "ptr*", signatureBlockResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDocument>} document 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-clone
     */
    Clone(document) {
        result := ComCall(12, this, "ptr*", document, "HRESULT")
        return result
    }
}
