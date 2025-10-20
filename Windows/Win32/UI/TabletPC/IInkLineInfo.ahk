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
     * 
     * @param {Pointer<INKMETRIC>} pim 
     * @returns {HRESULT} 
     */
    SetFormat(pim) {
        result := ComCall(3, this, "ptr", pim, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INKMETRIC>} pim 
     * @returns {HRESULT} 
     */
    GetFormat(pim) {
        result := ComCall(4, this, "ptr", pim, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INKMETRIC>} pim 
     * @param {Pointer<UInt32>} pnWidth 
     * @returns {HRESULT} 
     */
    GetInkExtent(pim, pnWidth) {
        result := ComCall(5, this, "ptr", pim, "uint*", pnWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCandidateNum 
     * @param {PWSTR} pwcRecogWord 
     * @param {Pointer<UInt32>} pcwcRecogWord 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetCandidate(nCandidateNum, pwcRecogWord, pcwcRecogWord, dwFlags) {
        pwcRecogWord := pwcRecogWord is String ? StrPtr(pwcRecogWord) : pwcRecogWord

        result := ComCall(6, this, "uint", nCandidateNum, "ptr", pwcRecogWord, "uint*", pcwcRecogWord, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCandidateNum 
     * @param {PWSTR} strRecogWord 
     * @returns {HRESULT} 
     */
    SetCandidate(nCandidateNum, strRecogWord) {
        strRecogWord := strRecogWord is String ? StrPtr(strRecogWord) : strRecogWord

        result := ComCall(7, this, "uint", nCandidateNum, "ptr", strRecogWord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Recognize() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
