#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-get_count
     */
    get_Count(Count) {
        CountMarshal := Count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, CountMarshal, Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} _NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(_NewEnum) {
        result := ComCall(8, this, "ptr*", _NewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<IInkRecognizer>} DefaultRecognizer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-getdefaultrecognizer
     */
    GetDefaultRecognizer(lcid, DefaultRecognizer) {
        result := ComCall(9, this, "int", lcid, "ptr*", DefaultRecognizer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IInkRecognizer>} InkRecognizer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-item
     */
    Item(Index, InkRecognizer) {
        result := ComCall(10, this, "int", Index, "ptr*", InkRecognizer, "HRESULT")
        return result
    }
}
