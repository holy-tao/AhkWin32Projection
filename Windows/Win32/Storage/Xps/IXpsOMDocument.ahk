#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMDocumentSequence.ahk
#Include .\IXpsOMPageReferenceCollection.ahk
#Include .\IXpsOMPrintTicketResource.ahk
#Include .\IXpsOMDocumentStructureResource.ahk
#Include .\IXpsOMSignatureBlockResourceCollection.ahk
#Include .\IXpsOMDocument.ahk
#Include .\IXpsOMPart.ahk

/**
 * An ordered sequence of fixed pages and document-level resources that make up the document.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocument
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
     * Gets a pointer to the IXpsOMDocumentSequence interface that contains the document.
     * @returns {IXpsOMDocumentSequence} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentsequence">IXpsOMDocumentSequence</a> interface that contains the document. If the document does not belong to a document sequence, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &documentSequence := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMDocumentSequence(documentSequence)
    }

    /**
     * Gets the IXpsOMPageReferenceCollection interface of the document, which allows virtualized access to its pages.
     * @remarks
     * To get the pages of a document, first get the list of <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereference">IXpsOMPageReference</a> interfaces by calling <b>GetPageReferences</b>. Then, for each  <b>IXpsOMPageReference</b> interface, load a page by calling <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage">GetPage</a>.
     * 
     * If the document does not have any pages, the page reference collection returned in <i>pageReferences</i> will be empty. To get  the number of page references in the collection, call its <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereferencecollection-getcount">GetCount</a> method.
     * 
     * For an example of how this method can be used in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372917(v=vs.85)">Navigate the XPS OM</a>.
     * @returns {IXpsOMPageReferenceCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereferencecollection">IXpsOMPageReferenceCollection</a> interface that contains a collection of page references for each page of the document. If there are no page references, the <b>IXpsOMPageReferenceCollection</b> returned in <i>pageReferences</i> will be empty and will have no elements.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getpagereferences
     */
    GetPageReferences() {
        result := ComCall(6, this, "ptr*", &pageReferences := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMPageReferenceCollection(pageReferences)
    }

    /**
     * Gets the IXpsOMPrintTicketResource interface of the document-level print ticket.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMPrintTicketResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface of the document-level print ticket that is associated with the document. If no print ticket has been assigned, a <b>NULL</b>  pointer will be returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getprintticketresource
     */
    GetPrintTicketResource() {
        result := ComCall(7, this, "ptr*", &printTicketResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMPrintTicketResource(printTicketResource)
    }

    /**
     * Sets the IXpsOMPrintTicketResource interface for the document-level print ticket.
     * @remarks
     * If the document contains an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface when this method is called, that interface is released before the new <b>IXpsOMPrintTicketResource</b> interface, passed in <i>printTicketResource</i>, is set.
     * @param {IXpsOMPrintTicketResource} printTicketResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface for the document-level print ticket to be assigned to the document.
     *           A <b>NULL</b> pointer releases any previously assigned print ticket resource.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>printTicketResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-setprintticketresource
     */
    SetPrintTicketResource(printTicketResource) {
        result := ComCall(8, this, "ptr", printTicketResource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a pointer to the IXpsOMDocumentStructureResource interface of the resource that contains structural information about the document.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMDocumentStructureResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentstructureresource">IXpsOMDocumentStructureResource</a> interface of the resource. A <b>NULL</b> pointer is returned if an <b>IXpsOMDocumentStructureResource</b> interface is not present or has not been specified.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getdocumentstructureresource
     */
    GetDocumentStructureResource() {
        result := ComCall(9, this, "ptr*", &documentStructureResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMDocumentStructureResource(documentStructureResource)
    }

    /**
     * Sets the IXpsOMDocumentStructureResource interface for the document.
     * @remarks
     * If the document contains an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentstructureresource">IXpsOMDocumentStructureResource</a> interface when this method is called, that interface is released before the new <b>IXpsOMDocumentStructureResource</b> interface, which is passed in <i>documentStructureResource</i>, is set.
     * @param {IXpsOMDocumentStructureResource} documentStructureResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentstructureresource">IXpsOMDocumentStructureResource</a> interface to be assigned to the document.
     *           A <b>NULL</b> pointer releases any previously assigned resource.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>documentStructureResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-setdocumentstructureresource
     */
    SetDocumentStructureResource(documentStructureResource) {
        result := ComCall(10, this, "ptr", documentStructureResource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a pointer to the IXpsOMSignatureBlockResourceCollection interface, which refers to a collection of the document's digital signature block resources.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMSignatureBlockResourceCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresourcecollection">IXpsOMSignatureBlockResourceCollection</a> interface, which refers to a collection of the document's digital signature block resources. If the document does not contain any signature block resources, the <b>IXpsOMSignatureBlockResourceCollection</b> interface will be empty.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-getsignatureblockresources
     */
    GetSignatureBlockResources() {
        result := ComCall(11, this, "ptr*", &signatureBlockResources := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMSignatureBlockResourceCollection(signatureBlockResources)
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMDocument.Clone)
     * @remarks
     * This method does not update any of the resource pointers in the copy.
     * @returns {IXpsOMDocument} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocument-clone
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &document_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMDocument(document_)
    }
}
