#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a list of the keystroke sequences required to create a specified string.
 * @remarks
 * 
  * This interface is used to store the results of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfreverseconversion-doreverseconversion">ITfReverseConversionList::DoReverseConversion</a> method.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfreverseconversionlist
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfReverseConversionList extends IUnknown{
    /**
     * The interface identifier for ITfReverseConversionList
     * @type {Guid}
     */
    static IID => Guid("{151d69f0-86f4-4674-b721-56911e797f47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} puIndex 
     * @returns {HRESULT} 
     */
    GetLength(puIndex) {
        result := ComCall(3, this, "uint*", puIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetString(uIndex, pbstr) {
        result := ComCall(4, this, "uint", uIndex, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
