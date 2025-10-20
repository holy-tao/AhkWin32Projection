#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Adds members to the IInkWordList2 Interface.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizer2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizer2 extends IDispatch{
    /**
     * The interface identifier for IInkRecognizer2
     * @type {Guid}
     */
    static IID => Guid("{6110118a-3a75-4ad6-b2aa-04b2b72bbe65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     */
    get_Id(pbstrId) {
        result := ComCall(7, this, "ptr", pbstrId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} UnicodeRanges 
     * @returns {HRESULT} 
     */
    get_UnicodeRanges(UnicodeRanges) {
        result := ComCall(8, this, "ptr", UnicodeRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
