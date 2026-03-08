#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextRange2.ahk
#Include .\ITextStoryRanges.ahk

/**
 * The ITextStoryRanges2 interface enumerates the stories in an ITextDocument.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextstoryranges2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextStoryRanges2 extends ITextStoryRanges{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoryRanges2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e5-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item2"]

    /**
     * Gets an ITextRange2 object for a story, by index, in a stories collection.
     * @remarks
     * The first story has an index of 1, and the last story  has an index equal to the count  retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextstoryranges-getcount">ITextStoryRanges::GetCount</a> method. Negative index values count from the last story to the first; that is, an index of –1 gets the last story in the collection, and an index of –<i>count</i> gets the first story.
     * @param {Integer} Index Type: <b>long</b>
     * 
     * The index of the story range. The default value is 1.
     * @returns {ITextRange2} Type: <b>ITextRange2**</b>
     * 
     * The range.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges2-item2
     */
    Item2(Index) {
        result := ComCall(10, this, "int", Index, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }
}
