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
     * 
     * @param {Pointer<IOpcPartUri>} documentPartName 
     * @param {Pointer<IXpsOMPrintTicketResource>} documentPrintTicket 
     * @param {Pointer<IXpsOMDocumentStructureResource>} documentStructure 
     * @param {Pointer<IXpsOMSignatureBlockResourceCollection>} signatureBlockResources 
     * @param {Pointer<IXpsOMPartUriCollection>} restrictedFonts 
     * @returns {HRESULT} 
     */
    StartNewDocument(documentPartName, documentPrintTicket, documentStructure, signatureBlockResources, restrictedFonts) {
        result := ComCall(3, this, "ptr", documentPartName, "ptr", documentPrintTicket, "ptr", documentStructure, "ptr", signatureBlockResources, "ptr", restrictedFonts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPage>} page 
     * @param {Pointer<XPS_SIZE>} advisoryPageDimensions 
     * @param {Pointer<IXpsOMPartUriCollection>} discardableResourceParts 
     * @param {Pointer<IXpsOMStoryFragmentsResource>} storyFragments 
     * @param {Pointer<IXpsOMPrintTicketResource>} pagePrintTicket 
     * @param {Pointer<IXpsOMImageResource>} pageThumbnail 
     * @returns {HRESULT} 
     */
    AddPage(page, advisoryPageDimensions, discardableResourceParts, storyFragments, pagePrintTicket, pageThumbnail) {
        result := ComCall(4, this, "ptr", page, "ptr", advisoryPageDimensions, "ptr", discardableResourceParts, "ptr", storyFragments, "ptr", pagePrintTicket, "ptr", pageThumbnail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMResource>} resource 
     * @returns {HRESULT} 
     */
    AddResource(resource) {
        result := ComCall(5, this, "ptr", resource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isClosed 
     * @returns {HRESULT} 
     */
    IsClosed(isClosed) {
        result := ComCall(7, this, "ptr", isClosed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
