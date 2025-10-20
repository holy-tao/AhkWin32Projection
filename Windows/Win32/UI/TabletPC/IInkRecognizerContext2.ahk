#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Adds members to the InkRecognizerContext Class.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizercontext2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizerContext2 extends IDispatch{
    /**
     * The interface identifier for IInkRecognizerContext2
     * @type {Guid}
     */
    static IID => Guid("{d6f0e32f-73d8-408e-8e9f-5fea592c363f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT>} UnicodeRanges 
     * @returns {HRESULT} 
     */
    get_EnabledUnicodeRanges(UnicodeRanges) {
        result := ComCall(7, this, "ptr", UnicodeRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} UnicodeRanges 
     * @returns {HRESULT} 
     */
    put_EnabledUnicodeRanges(UnicodeRanges) {
        result := ComCall(8, this, "ptr", UnicodeRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
