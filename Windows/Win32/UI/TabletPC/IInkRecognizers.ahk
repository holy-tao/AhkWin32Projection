#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IInkRecognizer.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizers
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizers extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognizers
     * @type {Guid}
     */
    static IID => Guid("{9ccc4f12-b0b7-4a8b-bf58-4aeca4e8cefd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "GetDefaultRecognizer", "Item"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "HRESULT")
        return IUnknown(_NewEnum)
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {IInkRecognizer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-getdefaultrecognizer
     */
    GetDefaultRecognizer(lcid) {
        result := ComCall(9, this, "int", lcid, "ptr*", &DefaultRecognizer := 0, "HRESULT")
        return IInkRecognizer(DefaultRecognizer)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IInkRecognizer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-item
     */
    Item(Index) {
        result := ComCall(10, this, "int", Index, "ptr*", &InkRecognizer := 0, "HRESULT")
        return IInkRecognizer(InkRecognizer)
    }
}
