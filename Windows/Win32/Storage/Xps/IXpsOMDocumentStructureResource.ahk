#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides access to the XML content of the resource stream of the DocumentStructure part.
 * @remarks
 * 
  * The <i>DocumentStructure</i> part of an XPS document contains the document outline, which, along with the <i>StoryFragments</i> parts, defines the reading order of every element that appears in the fixed pages of the document. 
  * 
  * The reading order of an XPS document is organized into semantic blocks called stories. Stories are logical units of the document, in the same way that  articles are units in a magazine. Stories are made up of one or more StoryFragments parts; <i>StoryFragments</i> parts contain the XML markup that defines the story's semantic blocks, which describe the structure of the document's content. Examples of a story's semantic blocks include  paragraphs and tables.
  * 
  * The XML markup  in the DocumentStructure and StoryFragments parts is described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentstructureresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMDocumentStructureResource extends IXpsOMResource{
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
     * 
     * @param {Pointer<IXpsOMDocument>} owner 
     * @returns {HRESULT} 
     */
    GetOwner(owner) {
        result := ComCall(5, this, "ptr", owner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @returns {HRESULT} 
     */
    GetStream(stream) {
        result := ComCall(6, this, "ptr", stream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} sourceStream 
     * @param {Pointer<IOpcPartUri>} partName 
     * @returns {HRESULT} 
     */
    SetContent(sourceStream, partName) {
        result := ComCall(7, this, "ptr", sourceStream, "ptr", partName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
