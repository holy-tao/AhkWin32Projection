#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Adds members to the IInkWordList2 Interface.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizer2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizer2 extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_UnicodeRanges"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer2-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(7, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer2-get_unicoderanges
     */
    get_UnicodeRanges() {
        UnicodeRanges := VARIANT()
        result := ComCall(8, this, "ptr", UnicodeRanges, "HRESULT")
        return UnicodeRanges
    }
}
