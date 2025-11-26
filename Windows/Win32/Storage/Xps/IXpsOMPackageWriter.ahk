#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Incrementally writes the parts of an XPS document to a package file.
 * @remarks
 * 
 * Progressive writing enables an application to serialize  XPS document content and resources as they become available. It does not require the application to create all elements of the document before serialization.
 * 
 * This interface writes the pages to the package sequentially, in the order that  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-addpage">AddPage</a> is called. The interface does not support page writing in a non-sequential order; thus it should only be used when page content is produced or is available for writing in the order it is to appear in the XPS document.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPackageWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPackageWriter
     * @type {Guid}
     */
    static IID => Guid("{4e2aa182-a443-42c6-b41b-4f8e9de73ff9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartNewDocument", "AddPage", "AddResource", "Close", "IsClosed"]

    /**
     * Opens and initializes a new FixedDocument in the FixedDocumentSequence of the package.
     * @param {IOpcPartUri} documentPartName A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the new document.
     * @param {IXpsOMPrintTicketResource} documentPrintTicket A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the document-level print ticket.  If there is no document-level print ticket for this package, this parameter can be set to <b>NULL</b>. See also Remarks.
     * @param {IXpsOMDocumentStructureResource} documentStructure A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentstructureresource">IXpsOMDocumentStructureResource</a> interface that contains the initial document structure resource, if the resource is available; if it is not available, this parameter can be set to <b>NULL</b>.
     * @param {IXpsOMSignatureBlockResourceCollection} signatureBlockResources A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresourcecollection">IXpsOMSignatureBlockResourceCollection</a> interface that contains a collection of digital signatures to be attached to the document. If there are no digital signatures to be attached, this parameter can be set to <b>NULL</b>.
     * @param {IXpsOMPartUriCollection} restrictedFonts A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomparturicollection">IXpsOMPartUriCollection</a> interface that contains the  fonts that must have restricted font relationships written for them. The font data are not written until <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-addresource">AddResource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-close">Close</a> is called.
     * 
     * If the document does not contain any  restricted fonts, this parameter can be set to <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>XPS_E_UNAVAILABLE_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A severe error occurred and the contents of the XPS OM might be unrecoverable. Some components of the XPS OM might still be usable but only after they have been verified. Because the state of the XPS OM cannot be predicted after this error is returned, all components of the XPS OM should be released and discarded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_UNEXPECTED_RESTRICTED_FONT_RELATIONSHIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The restricted font collection passed in <i>restrictedFonts</i> contains an unrestricted font.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method calls the <a href="/previous-versions/windows/desktop/opc/packaging">Packaging</a> API. For information about the Packaging API return values, see <a href="/previous-versions/windows/desktop/opc/packaging-errors">Packaging Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-startnewdocument
     */
    StartNewDocument(documentPartName, documentPrintTicket, documentStructure, signatureBlockResources, restrictedFonts) {
        result := ComCall(3, this, "ptr", documentPartName, "ptr", documentPrintTicket, "ptr", documentStructure, "ptr", signatureBlockResources, "ptr", restrictedFonts, "HRESULT")
        return result
    }

    /**
     * Writes a new FixedPage part to the currently open FixedDocument part in the package.
     * @param {IXpsOMPage} page The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage">IXpsOMPage</a> interface whose page content is to be written to the currently open FixedDocument of the  package.
     * @param {Pointer<XPS_SIZE>} advisoryPageDimensions The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure that contains page dimensions.
     * 
     * Size is described in XPS units. There are 96 XPS units per inch.  For example, the dimensions of an 8.5" by 11.0" page are 816 by 1,056 XPS units.
     * @param {IXpsOMPartUriCollection} discardableResourceParts The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomparturicollection">IXpsOMPartUriCollection</a> interface that contains a collection of the discardable resource parts.
     * @param {IXpsOMStoryFragmentsResource} storyFragments The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomstoryfragmentsresource">IXpsOMStoryFragmentsResource</a> interface that is to be  used for this page.
     * @param {IXpsOMPrintTicketResource} pagePrintTicket The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the page-level print ticket for this page. See also Remarks.
     * @param {IXpsOMImageResource} pageThumbnail The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image of this page.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>XPS_E_MISSING_DISCARDCONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A page refers to discardable resources but does not specify a DiscardControl part name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_MISSING_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called before <a href="/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-startnewdocument">StartNewDocument</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_UNAVAILABLE_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A severe error occurred and the contents of the XPS OM might be unrecoverable. Some components of the XPS OM might still be usable but only after they have been verified. Because the state of the XPS OM cannot be predicted after this error is returned, all components of the XPS OM should be released and discarded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method calls the <a href="/previous-versions/windows/desktop/opc/packaging">Packaging</a> API. For information about the Packaging API return values, see <a href="/previous-versions/windows/desktop/opc/packaging-errors">Packaging Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-addpage
     */
    AddPage(page, advisoryPageDimensions, discardableResourceParts, storyFragments, pagePrintTicket, pageThumbnail) {
        result := ComCall(4, this, "ptr", page, "ptr", advisoryPageDimensions, "ptr", discardableResourceParts, "ptr", storyFragments, "ptr", pagePrintTicket, "ptr", pageThumbnail, "HRESULT")
        return result
    }

    /**
     * Creates a new part resource in the package.
     * @param {IXpsOMResource} resource The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372762(v=vs.85)">IXpsOMResource</a> interface of the part resource that will be added as a new part in the package. See Remarks for the types of resources that may be passed in this parameter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource with the same name as the resource that is referenced by <i>resource</i> has already been added to the stream or there is no  relationship that includes the resource that is referenced by <i>resource</i>.
     * 
     * After <b>E_INVALIDARG</b> is returned, the stream or file is no longer valid and <a href="/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-close">Close</a> will return  <b>XPS_E_UNAVAILABLE_PACKAGE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_UNAVAILABLE_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A severe error occurred and the contents of the XPS OM might be unrecoverable. Some components of the XPS OM might still be usable but only after they have been verified. Because the state of the XPS OM cannot be predicted after this error is returned, all components of the XPS OM should be released and discarded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method calls the <a href="/previous-versions/windows/desktop/opc/packaging">Packaging</a> API. For information about the Packaging API return values, see <a href="/previous-versions/windows/desktop/opc/packaging-errors">Packaging Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-addresource
     */
    AddResource(resource) {
        result := ComCall(5, this, "ptr", resource, "HRESULT")
        return result
    }

    /**
     * Closes any open parts of the package, then closes the package.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>XPS_E_UNAVAILABLE_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A severe error occurred and the contents of the XPS OM might be unrecoverable. Some components of the XPS OM might still be usable but only after they have been verified. Because the state of the XPS OM cannot be predicted after this error is returned, all components of the XPS OM should be released and discarded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method calls the <a href="/previous-versions/windows/desktop/opc/packaging">Packaging</a> API. For information about the Packaging API return values, see <a href="/previous-versions/windows/desktop/opc/packaging-errors">Packaging Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Gets the status of the IXpsOMPackageWriter interface.
     * @returns {BOOL} A pointer to a Boolean variable that receives the status of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package is closed and no more content can be added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  package is open and content can be added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-isclosed
     */
    IsClosed() {
        result := ComCall(7, this, "int*", &isClosed := 0, "HRESULT")
        return isClosed
    }
}
