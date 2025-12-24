#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Adds members to the InkRecognizerContext Class.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizercontext2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizerContext2 extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnabledUnicodeRanges", "put_EnabledUnicodeRanges"]

    /**
     * @type {VARIANT} 
     */
    EnabledUnicodeRanges {
        get => this.get_EnabledUnicodeRanges()
        set => this.put_EnabledUnicodeRanges(value)
    }

    /**
     * Gets or sets a set of one or more Unicode ranges that the recognizer context will support.
     * @remarks
     * 
     * Use this method to specify a sub-set of Unicode character ranges that the recognizer should use during recognition. This is particularly useful when working with Asian character set where only a sub-set of the characters are commonly used.
     * 
     * Your application should check whether all input ranges are supported by the recognizer. TPC_S_TRUNCATED is returned to indicate that the Unicode ranges passed in were accepted, with the exception of those which were not valid. You can call <b>get_EnabledUnicodeRanges</b> to determine the ranges that were accepted.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext2-get_enabledunicoderanges
     */
    get_EnabledUnicodeRanges() {
        UnicodeRanges := VARIANT()
        result := ComCall(7, this, "ptr", UnicodeRanges, "HRESULT")
        return UnicodeRanges
    }

    /**
     * Gets or sets a set of one or more Unicode ranges that the recognizer context will support.
     * @remarks
     * 
     * Use this method to specify a sub-set of Unicode character ranges that the recognizer should use during recognition. This is particularly useful when working with Asian character set where only a sub-set of the characters are commonly used.
     * 
     * Your application should check whether all input ranges are supported by the recognizer. TPC_S_TRUNCATED is returned to indicate that the Unicode ranges passed in were accepted, with the exception of those which were not valid. You can call <b>get_EnabledUnicodeRanges</b> to determine the ranges that were accepted.
     * 
     * 
     * @param {VARIANT} UnicodeRanges 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext2-put_enabledunicoderanges
     */
    put_EnabledUnicodeRanges(UnicodeRanges) {
        result := ComCall(8, this, "ptr", UnicodeRanges, "HRESULT")
        return result
    }
}
