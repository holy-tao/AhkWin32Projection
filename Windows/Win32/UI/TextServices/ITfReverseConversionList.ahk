#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLength", "GetString"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreverseconversionlist-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint*", &puIndex := 0, "HRESULT")
        return puIndex
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreverseconversionlist-getstring
     */
    GetString(uIndex) {
        pbstr := BSTR()
        result := ComCall(4, this, "uint", uIndex, "ptr", pbstr, "HRESULT")
        return pbstr
    }
}
