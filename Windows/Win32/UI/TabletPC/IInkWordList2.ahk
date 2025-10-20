#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Adds members to the InkWordList Class.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkwordlist2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkWordList2 extends IDispatch{
    /**
     * The interface identifier for IInkWordList2
     * @type {Guid}
     */
    static IID => Guid("{14542586-11bf-4f5f-b6e7-49d0744aab6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} NewWords 
     * @returns {HRESULT} 
     */
    AddWords(NewWords) {
        NewWords := NewWords is String ? BSTR.Alloc(NewWords).Value : NewWords

        result := ComCall(7, this, "ptr", NewWords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
