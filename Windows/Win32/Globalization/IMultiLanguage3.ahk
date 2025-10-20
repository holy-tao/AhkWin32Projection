#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMultiLanguage2.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMultiLanguage3 extends IMultiLanguage2{
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
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpWideCharStr 
     * @param {Integer} cchWideChar 
     * @param {Pointer<UInt32>} puiPreferredCodePages 
     * @param {Integer} nPreferredCodePages 
     * @param {Pointer<UInt32>} puiDetectedCodePages 
     * @param {Pointer<UInt32>} pnDetectedCodePages 
     * @param {PWSTR} lpSpecialChar 
     * @returns {HRESULT} 
     */
    DetectOutboundCodePage(dwFlags, lpWideCharStr, cchWideChar, puiPreferredCodePages, nPreferredCodePages, puiDetectedCodePages, pnDetectedCodePages, lpSpecialChar) {
        lpWideCharStr := lpWideCharStr is String ? StrPtr(lpWideCharStr) : lpWideCharStr
        lpSpecialChar := lpSpecialChar is String ? StrPtr(lpSpecialChar) : lpSpecialChar

        result := ComCall(30, this, "uint", dwFlags, "ptr", lpWideCharStr, "uint", cchWideChar, "uint*", puiPreferredCodePages, "uint", nPreferredCodePages, "uint*", puiDetectedCodePages, "uint*", pnDetectedCodePages, "ptr", lpSpecialChar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IStream>} pStrIn 
     * @param {Pointer<UInt32>} puiPreferredCodePages 
     * @param {Integer} nPreferredCodePages 
     * @param {Pointer<UInt32>} puiDetectedCodePages 
     * @param {Pointer<UInt32>} pnDetectedCodePages 
     * @param {PWSTR} lpSpecialChar 
     * @returns {HRESULT} 
     */
    DetectOutboundCodePageInIStream(dwFlags, pStrIn, puiPreferredCodePages, nPreferredCodePages, puiDetectedCodePages, pnDetectedCodePages, lpSpecialChar) {
        lpSpecialChar := lpSpecialChar is String ? StrPtr(lpSpecialChar) : lpSpecialChar

        result := ComCall(31, this, "uint", dwFlags, "ptr", pStrIn, "uint*", puiPreferredCodePages, "uint", nPreferredCodePages, "uint*", puiDetectedCodePages, "uint*", pnDetectedCodePages, "ptr", lpSpecialChar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
