#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IInkLineInfo interface provides access to the display properties and recognition result list of a text ink object (tInk).
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinklineinfo
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkLineInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkLineInfo
     * @type {Guid}
     */
    static IID => Guid("{9c1c5ad6-f22f-4de4-b453-a2cc482e7c33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFormat", "GetFormat", "GetInkExtent", "GetCandidate", "SetCandidate", "Recognize"]

    /**
     * 
     * @param {Pointer<INKMETRIC>} pim 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-setformat
     */
    SetFormat(pim) {
        result := ComCall(3, this, "ptr", pim, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INKMETRIC>} pim 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-getformat
     */
    GetFormat(pim) {
        result := ComCall(4, this, "ptr", pim, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INKMETRIC>} pim 
     * @param {Pointer<Integer>} pnWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-getinkextent
     */
    GetInkExtent(pim, pnWidth) {
        pnWidthMarshal := pnWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pim, pnWidthMarshal, pnWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCandidateNum 
     * @param {PWSTR} pwcRecogWord 
     * @param {Pointer<Integer>} pcwcRecogWord 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-getcandidate
     */
    GetCandidate(nCandidateNum, pwcRecogWord, pcwcRecogWord, dwFlags) {
        pwcRecogWord := pwcRecogWord is String ? StrPtr(pwcRecogWord) : pwcRecogWord

        pcwcRecogWordMarshal := pcwcRecogWord is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", nCandidateNum, "ptr", pwcRecogWord, pcwcRecogWordMarshal, pcwcRecogWord, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCandidateNum 
     * @param {PWSTR} strRecogWord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-setcandidate
     */
    SetCandidate(nCandidateNum, strRecogWord) {
        strRecogWord := strRecogWord is String ? StrPtr(strRecogWord) : strRecogWord

        result := ComCall(7, this, "uint", nCandidateNum, "ptr", strRecogWord, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-recognize
     */
    Recognize() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
