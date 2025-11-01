#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkwordlist
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkWordList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkWordList
     * @type {Guid}
     */
    static IID => Guid("{76ba3491-cb2f-406b-9961-0e0c4cdaaef2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddWord", "RemoveWord", "Merge"]

    /**
     * 
     * @param {BSTR} NewWord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkwordlist-addword
     */
    AddWord(NewWord) {
        NewWord := NewWord is String ? BSTR.Alloc(NewWord).Value : NewWord

        result := ComCall(7, this, "ptr", NewWord, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} RemoveWord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkwordlist-removeword
     */
    RemoveWord(RemoveWord) {
        RemoveWord := RemoveWord is String ? BSTR.Alloc(RemoveWord).Value : RemoveWord

        result := ComCall(8, this, "ptr", RemoveWord, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkWordList} MergeWordList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkwordlist-merge
     */
    Merge(MergeWordList) {
        result := ComCall(9, this, "ptr", MergeWordList, "HRESULT")
        return result
    }
}
