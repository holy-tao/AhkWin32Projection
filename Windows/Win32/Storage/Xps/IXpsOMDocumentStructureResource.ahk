#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMDocument.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides access to the XML content of the resource stream of the DocumentStructure part.
 * @remarks
 * The <i>DocumentStructure</i> part of an XPS document contains the document outline, which, along with the <i>StoryFragments</i> parts, defines the reading order of every element that appears in the fixed pages of the document. 
 * 
 * The reading order of an XPS document is organized into semantic blocks called stories. Stories are logical units of the document, in the same way that  articles are units in a magazine. Stories are made up of one or more StoryFragments parts; <i>StoryFragments</i> parts contain the XML markup that defines the story's semantic blocks, which describe the structure of the document's content. Examples of a story's semantic blocks include  paragraphs and tables.
 * 
 * The XML markup  in the DocumentStructure and StoryFragments parts is described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentstructureresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMDocumentStructureResource extends IXpsOMResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMDocumentStructureResource
     * @type {Guid}
     */
    static IID => Guid("{85febc8a-6b63-48a9-af07-7064e4ecff30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetStream", "SetContent"]

    /**
     * Gets a pointer to the IXpsOMDocument interface that contains the resource. (IXpsOMDocumentStructureResource.GetOwner)
     * @returns {IXpsOMDocument} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocument">IXpsOMDocument</a> interface that contains the resource. If the resource is not part of a document, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentstructureresource-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &owner := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMDocument(owner)
    }

    /**
     * Gets a new, read-only copy of the stream that is associated with this resource. (IXpsOMDocumentStructureResource.GetStream)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object returned by this method might return an error of E_PENDING, which indicates that the stream length has not been determined yet.  This behavior is different from that of a standard <b>IStream</b> object.
     * 
     * For more information about the content of DocumentStructure part, see the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * 
     * This method calls the stream's <b>Clone</b> method to create the stream returned in <i>stream</i>. As a result, the performance of this method will depend on that of the stream's <b>Clone</b> method.
     * @returns {IStream} A new, read-only copy of the stream that is associated with this resource.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentstructureresource-getstream
     */
    GetStream() {
        result := ComCall(6, this, "ptr*", &stream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(stream)
    }

    /**
     * Sets the read-only stream to be associated with this resource. (IXpsOMDocumentStructureResource.SetContent)
     * @remarks
     * The calling method  should treat this stream as a single-threaded apartment (STA) model object and not re-enter any of the stream interface's methods.
     * 
     * For more information about the content of DocumentStructure part, see the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * 
     * Because <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentstructureresource-getstream">GetStream</a> gets a clone of  the stream that is set by this method, the provided stream should have an efficient cloning method. A stream with an inefficient cloning method will reduce the performance of <b>GetStream</b>.
     * @param {IStream} sourceStream The read-only stream to be associated with this resource.
     * @param {IOpcPartUri} partName The part name to be assigned to this resource.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentstructureresource-setcontent
     */
    SetContent(sourceStream, partName) {
        result := ComCall(7, this, "ptr", sourceStream, "ptr", partName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
