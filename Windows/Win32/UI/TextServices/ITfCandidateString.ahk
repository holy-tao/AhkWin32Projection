#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCandidateString interface is implemented by a text service and is used by the TSF manager or a client to obtain information about a candidate string object.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itfcandidatestring
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCandidateString extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCandidateString
     * @type {Guid}
     */
    static IID => Guid("{581f317e-fd9d-443f-b972-ed00467c5d40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetString", "GetIndex"]

    /**
     * ITfCandidateString::GetString method
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that receives the text of the candidate string object. The caller must release this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itfcandidatestring-getstring
     */
    GetString() {
        pbstr := BSTR()
        result := ComCall(3, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * ITfCandidateString::GetIndex method
     * @returns {Integer} Pointer to a <b>ULONG</b> value that receives the zero-based index of the candidate string object within the candidate list.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itfcandidatestring-getindex
     */
    GetIndex() {
        result := ComCall(4, this, "uint*", &pnIndex := 0, "HRESULT")
        return pnIndex
    }
}
