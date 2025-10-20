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
     * 
     * @param {Pointer<IUnknown>} ppunkEnum 
     * @returns {HRESULT} 
     */
    _NewEnum(ppunkEnum) {
        result := ComCall(7, this, "ptr", ppunkEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ITextRange>} ppRange 
     * @returns {HRESULT} 
     */
    Item(Index, ppRange) {
        result := ComCall(8, this, "int", Index, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(9, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
