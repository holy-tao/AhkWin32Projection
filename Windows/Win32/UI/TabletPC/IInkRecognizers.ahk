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
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} _NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(_NewEnum) {
        result := ComCall(8, this, "ptr", _NewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<IInkRecognizer>} DefaultRecognizer 
     * @returns {HRESULT} 
     */
    GetDefaultRecognizer(lcid, DefaultRecognizer) {
        result := ComCall(9, this, "int", lcid, "ptr", DefaultRecognizer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IInkRecognizer>} InkRecognizer 
     * @returns {HRESULT} 
     */
    Item(Index, InkRecognizer) {
        result := ComCall(10, this, "int", Index, "ptr", InkRecognizer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
