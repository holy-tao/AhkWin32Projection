#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The purpose of the ITextStoryRanges interface is to enumerate the stories in an ITextDocument.
 * @remarks
 * 
  *  
  * You get a pointer to an <b>ITextStoryRanges</b> collection by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-getstoryranges">GetStoryRanges</a> method. Each story obtained from this collection is represented by an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object that covers the whole story. Text Object Model (TOM) engines that only have a single story do not need to implement an <b>ITextStoryRanges</b> interface. Your code should only get a stories collection if <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-getstorycount">GetStoryCount</a> returns a story count greater than one.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextstoryranges
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextStoryRanges extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoryRanges
     * @type {Guid}
     */
    static IID => Guid("{8cc497c5-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["_NewEnum", "Item", "GetCount"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppunkEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges-_newenum
     */
    _NewEnum(ppunkEnum) {
        result := ComCall(7, this, "ptr*", ppunkEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ITextRange>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges-item
     */
    Item(Index, ppRange) {
        result := ComCall(8, this, "int", Index, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstoryranges-getcount
     */
    GetCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pCountMarshal, pCount, "HRESULT")
        return result
    }
}
