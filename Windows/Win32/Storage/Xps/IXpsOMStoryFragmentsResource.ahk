#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IXpsOMPageReference>} owner 
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
