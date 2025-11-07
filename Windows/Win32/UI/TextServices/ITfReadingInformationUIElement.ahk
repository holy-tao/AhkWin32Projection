#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfContext.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfUIElement.ahk

/**
 * The ITfCandidateListUIElement interface is implemented by a text service that has a UI for reading information UI at the near caret.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfreadinginformationuielement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfReadingInformationUIElement extends ITfUIElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfReadingInformationUIElement
     * @type {Guid}
     */
    static IID => Guid("{ea1ea139-19df-11d7-a6d2-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUpdatedFlags", "GetContext", "GetString", "GetMaxReadingStringLength", "GetErrorIndex", "IsVerticalOrderPreferred"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getupdatedflags
     */
    GetUpdatedFlags() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @returns {ITfContext} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getcontext
     */
    GetContext() {
        result := ComCall(8, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getstring
     */
    GetString() {
        pstr := BSTR()
        result := ComCall(9, this, "ptr", pstr, "HRESULT")
        return pstr
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getmaxreadingstringlength
     */
    GetMaxReadingStringLength() {
        result := ComCall(10, this, "uint*", &pcchMax := 0, "HRESULT")
        return pcchMax
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-geterrorindex
     */
    GetErrorIndex() {
        result := ComCall(11, this, "uint*", &pErrorIndex := 0, "HRESULT")
        return pErrorIndex
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-isverticalorderpreferred
     */
    IsVerticalOrderPreferred() {
        result := ComCall(12, this, "int*", &pfVertical := 0, "HRESULT")
        return pfVertical
    }
}
