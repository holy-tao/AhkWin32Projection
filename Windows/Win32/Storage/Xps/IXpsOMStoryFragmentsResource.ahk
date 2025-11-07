#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPageReference.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides access to the content of the resource stream of a page's StoryFragments part.
 * @remarks
 * 
  * The StoryFragments part of a page contains the XML markup that describes the   portions of one or more stories  that are associated with a single fixed page. Some of the document contents that might be described by the XML markup in a StoryFragments part include  the story's tables and paragraphs that are found on the page.
  * 
  * The XML markup  of the DocumentStructure and StoryFragments parts is described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomstoryfragmentsresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMStoryFragmentsResource extends IXpsOMResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMStoryFragmentsResource
     * @type {Guid}
     */
    static IID => Guid("{c2b3ca09-0473-4282-87ae-1780863223f0}")

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
     * 
     * @returns {IXpsOMPageReference} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomstoryfragmentsresource-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &owner := 0, "HRESULT")
        return IXpsOMPageReference(owner)
    }

    /**
     * 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomstoryfragmentsresource-getstream
     */
    GetStream() {
        result := ComCall(6, this, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    /**
     * 
     * @param {IStream} sourceStream 
     * @param {IOpcPartUri} partName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomstoryfragmentsresource-setcontent
     */
    SetContent(sourceStream, partName) {
        result := ComCall(7, this, "ptr", sourceStream, "ptr", partName, "HRESULT")
        return result
    }
}
