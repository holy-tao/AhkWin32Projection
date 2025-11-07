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
     * 
     * @param {IOpcPartUri} documentPartName 
     * @param {IXpsOMPrintTicketResource} documentPrintTicket 
     * @param {IXpsOMDocumentStructureResource} documentStructure 
     * @param {IXpsOMSignatureBlockResourceCollection} signatureBlockResources 
     * @param {IXpsOMPartUriCollection} restrictedFonts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-startnewdocument
     */
    StartNewDocument(documentPartName, documentPrintTicket, documentStructure, signatureBlockResources, restrictedFonts) {
        result := ComCall(3, this, "ptr", documentPartName, "ptr", documentPrintTicket, "ptr", documentStructure, "ptr", signatureBlockResources, "ptr", restrictedFonts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMPage} page 
     * @param {Pointer<XPS_SIZE>} advisoryPageDimensions 
     * @param {IXpsOMPartUriCollection} discardableResourceParts 
     * @param {IXpsOMStoryFragmentsResource} storyFragments 
     * @param {IXpsOMPrintTicketResource} pagePrintTicket 
     * @param {IXpsOMImageResource} pageThumbnail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-addpage
     */
    AddPage(page, advisoryPageDimensions, discardableResourceParts, storyFragments, pagePrintTicket, pageThumbnail) {
        result := ComCall(4, this, "ptr", page, "ptr", advisoryPageDimensions, "ptr", discardableResourceParts, "ptr", storyFragments, "ptr", pagePrintTicket, "ptr", pageThumbnail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMResource} resource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-addresource
     */
    AddResource(resource) {
        result := ComCall(5, this, "ptr", resource, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagewriter-isclosed
     */
    IsClosed() {
        result := ComCall(7, this, "int*", &isClosed := 0, "HRESULT")
        return isClosed
    }
}
