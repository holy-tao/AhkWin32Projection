#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextStoryRanges.ahk

/**
 * The ITextStoryRanges2 interface enumerates the stories in an ITextDocument.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextstoryranges2
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
     * 
     * @param {Integer} Index 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges2-item2
     */
    Item2(Index, ppRange) {
        result := ComCall(10, this, "int", Index, "ptr*", ppRange, "HRESULT")
        return result
    }
}
