#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMultiLanguage2.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMultiLanguage3 extends IMultiLanguage2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiLanguage3
     * @type {Guid}
     */
    static IID => Guid("{4e5868ab-b157-4623-9acc-6a1d9caebe04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DetectOutboundCodePage", "DetectOutboundCodePageInIStream"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpWideCharStr 
     * @param {Integer} cchWideChar 
     * @param {Pointer<Integer>} puiPreferredCodePages 
     * @param {Integer} nPreferredCodePages 
     * @param {Pointer<Integer>} pnDetectedCodePages 
     * @param {PWSTR} lpSpecialChar 
     * @returns {Integer} 
     */
    DetectOutboundCodePage(dwFlags, lpWideCharStr, cchWideChar, puiPreferredCodePages, nPreferredCodePages, pnDetectedCodePages, lpSpecialChar) {
        lpWideCharStr := lpWideCharStr is String ? StrPtr(lpWideCharStr) : lpWideCharStr
        lpSpecialChar := lpSpecialChar is String ? StrPtr(lpSpecialChar) : lpSpecialChar

        puiPreferredCodePagesMarshal := puiPreferredCodePages is VarRef ? "uint*" : "ptr"
        pnDetectedCodePagesMarshal := pnDetectedCodePages is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "uint", dwFlags, "ptr", lpWideCharStr, "uint", cchWideChar, puiPreferredCodePagesMarshal, puiPreferredCodePages, "uint", nPreferredCodePages, "uint*", &puiDetectedCodePages := 0, pnDetectedCodePagesMarshal, pnDetectedCodePages, "ptr", lpSpecialChar, "HRESULT")
        return puiDetectedCodePages
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IStream} pStrIn 
     * @param {Pointer<Integer>} puiPreferredCodePages 
     * @param {Integer} nPreferredCodePages 
     * @param {Pointer<Integer>} pnDetectedCodePages 
     * @param {PWSTR} lpSpecialChar 
     * @returns {Integer} 
     */
    DetectOutboundCodePageInIStream(dwFlags, pStrIn, puiPreferredCodePages, nPreferredCodePages, pnDetectedCodePages, lpSpecialChar) {
        lpSpecialChar := lpSpecialChar is String ? StrPtr(lpSpecialChar) : lpSpecialChar

        puiPreferredCodePagesMarshal := puiPreferredCodePages is VarRef ? "uint*" : "ptr"
        pnDetectedCodePagesMarshal := pnDetectedCodePages is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "uint", dwFlags, "ptr", pStrIn, puiPreferredCodePagesMarshal, puiPreferredCodePages, "uint", nPreferredCodePages, "uint*", &puiDetectedCodePages := 0, pnDetectedCodePagesMarshal, pnDetectedCodePages, "ptr", lpSpecialChar, "HRESULT")
        return puiDetectedCodePages
    }
}
