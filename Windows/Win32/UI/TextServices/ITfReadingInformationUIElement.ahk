#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getupdatedflags
     */
    GetUpdatedFlags(pdwFlags) {
        result := ComCall(7, this, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} ppic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getcontext
     */
    GetContext(ppic) {
        result := ComCall(8, this, "ptr*", ppic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getstring
     */
    GetString(pstr) {
        result := ComCall(9, this, "ptr", pstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getmaxreadingstringlength
     */
    GetMaxReadingStringLength(pcchMax) {
        result := ComCall(10, this, "uint*", pcchMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pErrorIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-geterrorindex
     */
    GetErrorIndex(pErrorIndex) {
        result := ComCall(11, this, "uint*", pErrorIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfVertical 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-isverticalorderpreferred
     */
    IsVerticalOrderPreferred(pfVertical) {
        result := ComCall(12, this, "ptr", pfVertical, "HRESULT")
        return result
    }
}
