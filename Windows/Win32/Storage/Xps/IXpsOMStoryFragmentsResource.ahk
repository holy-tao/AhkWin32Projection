#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPageReference.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides access to the content of the resource stream of a page's StoryFragments part.
 * @remarks
 * The StoryFragments part of a page contains the XML markup that describes the   portions of one or more stories  that are associated with a single fixed page. Some of the document contents that might be described by the XML markup in a StoryFragments part include  the story's tables and paragraphs that are found on the page.
 * 
 * The XML markup  of the DocumentStructure and StoryFragments parts is described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomstoryfragmentsresource
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
     * Gets a pointer to the IXpsOMPage interface that contains this resource.
     * @returns {IXpsOMPageReference} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage">IXpsOMPage</a> interface that contains this resource. If the resource is not part of a page, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomstoryfragmentsresource-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &owner := 0, "HRESULT")
        return IXpsOMPageReference(owner)
    }

    /**
     * Gets a new, read-only copy of the stream that is associated with this resource. (IXpsOMStoryFragmentsResource.GetStream)
     * @remarks
     * Reading from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object returned by this method might return an E_PENDING error, which indicates that the stream length has not been determined yet.  This behavior is different from that of a standard <b>IStream</b> object.
     * 
     * For more information about the content of StoryFragments part, see the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * 
     * This method calls the stream's <b>Clone</b> method to create the stream returned in <i>stream</i>. As a result, the performance of this method will depend on that of the stream's <b>Clone</b> method.
     * @returns {IStream} A new, read-only copy of the stream that is associated with this resource.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomstoryfragmentsresource-getstream
     */
    GetStream() {
        result := ComCall(6, this, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    /**
     * Sets the read-only stream to be associated with this resource. (IXpsOMStoryFragmentsResource.SetContent)
     * @remarks
     * The calling method  should treat this stream as a single-threaded apartment (STA) model object and not re-enter any of the stream interface's methods.
     * 
     * For more information about the content of a StoryFragments part, see the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * 
     * Because <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomstoryfragmentsresource-getstream">GetStream</a> gets a clone of  the stream that is set by this method, the provided stream should have an efficient cloning method. A stream with an inefficient cloning method will reduce the performance of <b>GetStream</b>.
     * @param {IStream} sourceStream The read-only stream to be associated with this resource.
     * @param {IOpcPartUri} partName The part name to be assigned to this resource.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomstoryfragmentsresource-setcontent
     */
    SetContent(sourceStream, partName) {
        result := ComCall(7, this, "ptr", sourceStream, "ptr", partName, "HRESULT")
        return result
    }
}
