#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\HIMC.ahk
#Include .\IEnumRegisterWordA.ahk
#Include .\IEnumRegisterWordW.ahk
#Include .\CANDIDATEFORM.ahk
#Include ..\..\..\Graphics\Gdi\LOGFONTA.ahk
#Include ..\..\..\Graphics\Gdi\LOGFONTW.ahk
#Include .\COMPOSITIONFORM.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include ..\KeyboardAndMouse\HKL.ahk
#Include .\IEnumInputContext.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIMMApp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveIMMApp
     * @type {Guid}
     */
    static IID => Guid("{08c0e040-62d1-11d1-9326-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssociateContext", "ConfigureIMEA", "ConfigureIMEW", "CreateContext", "DestroyContext", "EnumRegisterWordA", "EnumRegisterWordW", "EscapeA", "EscapeW", "GetCandidateListA", "GetCandidateListW", "GetCandidateListCountA", "GetCandidateListCountW", "GetCandidateWindow", "GetCompositionFontA", "GetCompositionFontW", "GetCompositionStringA", "GetCompositionStringW", "GetCompositionWindow", "GetContext", "GetConversionListA", "GetConversionListW", "GetConversionStatus", "GetDefaultIMEWnd", "GetDescriptionA", "GetDescriptionW", "GetGuideLineA", "GetGuideLineW", "GetIMEFileNameA", "GetIMEFileNameW", "GetOpenStatus", "GetProperty", "GetRegisterWordStyleA", "GetRegisterWordStyleW", "GetStatusWindowPos", "GetVirtualKey", "InstallIMEA", "InstallIMEW", "IsIME", "IsUIMessageA", "IsUIMessageW", "NotifyIME", "RegisterWordA", "RegisterWordW", "ReleaseContext", "SetCandidateWindow", "SetCompositionFontA", "SetCompositionFontW", "SetCompositionStringA", "SetCompositionStringW", "SetCompositionWindow", "SetConversionStatus", "SetOpenStatus", "SetStatusWindowPos", "SimulateHotKey", "UnregisterWordA", "UnregisterWordW", "Activate", "Deactivate", "OnDefWindowProc", "FilterClientWindows", "GetCodePageA", "GetLangId", "AssociateContextEx", "DisableIME", "GetImeMenuItemsA", "GetImeMenuItemsW", "EnumInputContext"]

    /**
     * 
     * @param {HWND} hWnd 
     * @param {HIMC} hIME 
     * @returns {HIMC} 
     */
    AssociateContext(hWnd, hIME) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hIME := hIME is Win32Handle ? NumGet(hIME, "ptr") : hIME

        phPrev := HIMC()
        result := ComCall(3, this, "ptr", hWnd, "ptr", hIME, "ptr", phPrev, "HRESULT")
        return phPrev
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HWND} hWnd 
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDA>} pData 
     * @returns {HRESULT} 
     */
    ConfigureIMEA(hKL, hWnd, dwMode, pData) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", hKL, "ptr", hWnd, "uint", dwMode, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HWND} hWnd 
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDW>} pData 
     * @returns {HRESULT} 
     */
    ConfigureIMEW(hKL, hWnd, dwMode, pData) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(5, this, "ptr", hKL, "ptr", hWnd, "uint", dwMode, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Creates a recognizer context.
     * @returns {HIMC} 
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-createcontext
     */
    CreateContext() {
        phIMC := HIMC()
        result := ComCall(6, this, "ptr", phIMC, "HRESULT")
        return phIMC
    }

    /**
     * Destroys a recognizer context.
     * @param {HIMC} hIME 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-destroycontext
     */
    DestroyContext(hIME) {
        hIME := hIME is Win32Handle ? NumGet(hIME, "ptr") : hIME

        result := ComCall(7, this, "ptr", hIME, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @returns {IEnumRegisterWordA} 
     */
    EnumRegisterWordA(hKL, szReading, dwStyle, szRegister, pData) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &pEnum := 0, "HRESULT")
        return IEnumRegisterWordA(pEnum)
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @returns {IEnumRegisterWordW} 
     */
    EnumRegisterWordW(hKL, szReading, dwStyle, szRegister, pData) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &pEnum := 0, "HRESULT")
        return IEnumRegisterWordW(pEnum)
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HIMC} hIMC 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @returns {LRESULT} 
     */
    EscapeA(hKL, hIMC, uEscape, pData) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", hKL, "ptr", hIMC, "uint", uEscape, pDataMarshal, pData, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HIMC} hIMC 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @returns {LRESULT} 
     */
    EscapeW(hKL, hIMC, uEscape, pData) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", hKL, "ptr", hIMC, "uint", uEscape, pDataMarshal, pData, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pCandList 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetCandidateListA(hIMC, dwIndex, uBufLen, pCandList, puCopied) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", hIMC, "uint", dwIndex, "uint", uBufLen, "ptr", pCandList, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pCandList 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetCandidateListW(hIMC, dwIndex, uBufLen, pCandList, puCopied) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", hIMC, "uint", dwIndex, "uint", uBufLen, "ptr", pCandList, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<Integer>} pdwListSize 
     * @param {Pointer<Integer>} pdwBufLen 
     * @returns {HRESULT} 
     */
    GetCandidateListCountA(hIMC, pdwListSize, pdwBufLen) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pdwListSizeMarshal := pdwListSize is VarRef ? "uint*" : "ptr"
        pdwBufLenMarshal := pdwBufLen is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", hIMC, pdwListSizeMarshal, pdwListSize, pdwBufLenMarshal, pdwBufLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<Integer>} pdwListSize 
     * @param {Pointer<Integer>} pdwBufLen 
     * @returns {HRESULT} 
     */
    GetCandidateListCountW(hIMC, pdwListSize, pdwBufLen) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pdwListSizeMarshal := pdwListSize is VarRef ? "uint*" : "ptr"
        pdwBufLenMarshal := pdwBufLen is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", hIMC, pdwListSizeMarshal, pdwListSize, pdwBufLenMarshal, pdwBufLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @returns {CANDIDATEFORM} 
     */
    GetCandidateWindow(hIMC, dwIndex) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pCandidate := CANDIDATEFORM()
        result := ComCall(16, this, "ptr", hIMC, "uint", dwIndex, "ptr", pCandidate, "HRESULT")
        return pCandidate
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @returns {LOGFONTA} 
     */
    GetCompositionFontA(hIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        plf := LOGFONTA()
        result := ComCall(17, this, "ptr", hIMC, "ptr", plf, "HRESULT")
        return plf
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @returns {LOGFONTW} 
     */
    GetCompositionFontW(hIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        plf := LOGFONTW()
        result := ComCall(18, this, "ptr", hIMC, "ptr", plf, "HRESULT")
        return plf
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {Pointer<Integer>} plCopied 
     * @param {Pointer<Void>} pBuf 
     * @returns {HRESULT} 
     */
    GetCompositionStringA(hIMC, dwIndex, dwBufLen, plCopied, pBuf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        plCopiedMarshal := plCopied is VarRef ? "int*" : "ptr"
        pBufMarshal := pBuf is VarRef ? "ptr" : "ptr"

        result := ComCall(19, this, "ptr", hIMC, "uint", dwIndex, "uint", dwBufLen, plCopiedMarshal, plCopied, pBufMarshal, pBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {Pointer<Integer>} plCopied 
     * @param {Pointer<Void>} pBuf 
     * @returns {HRESULT} 
     */
    GetCompositionStringW(hIMC, dwIndex, dwBufLen, plCopied, pBuf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        plCopiedMarshal := plCopied is VarRef ? "int*" : "ptr"
        pBufMarshal := pBuf is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, "ptr", hIMC, "uint", dwIndex, "uint", dwBufLen, plCopiedMarshal, plCopied, pBufMarshal, pBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @returns {COMPOSITIONFORM} 
     */
    GetCompositionWindow(hIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pCompForm := COMPOSITIONFORM()
        result := ComCall(21, this, "ptr", hIMC, "ptr", pCompForm, "HRESULT")
        return pCompForm
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @returns {HIMC} 
     */
    GetContext(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        phIMC := HIMC()
        result := ComCall(22, this, "ptr", hWnd, "ptr", phIMC, "HRESULT")
        return phIMC
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HIMC} hIMC 
     * @param {PSTR} pSrc 
     * @param {Integer} uBufLen 
     * @param {Integer} uFlag 
     * @param {Pointer<CANDIDATELIST>} pDst 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetConversionListA(hKL, hIMC, pSrc, uBufLen, uFlag, pDst, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", hKL, "ptr", hIMC, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, "ptr", pDst, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HIMC} hIMC 
     * @param {PWSTR} pSrc 
     * @param {Integer} uBufLen 
     * @param {Integer} uFlag 
     * @param {Pointer<CANDIDATELIST>} pDst 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetConversionListW(hKL, hIMC, pSrc, uBufLen, uFlag, pDst, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "ptr", hKL, "ptr", hIMC, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, "ptr", pDst, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<Integer>} pfdwConversion 
     * @param {Pointer<Integer>} pfdwSentence 
     * @returns {HRESULT} 
     */
    GetConversionStatus(hIMC, pfdwConversion, pfdwSentence) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pfdwConversionMarshal := pfdwConversion is VarRef ? "uint*" : "ptr"
        pfdwSentenceMarshal := pfdwSentence is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "ptr", hIMC, pfdwConversionMarshal, pfdwConversion, pfdwSentenceMarshal, pfdwSentence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @returns {HWND} 
     */
    GetDefaultIMEWnd(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        phDefWnd := HWND()
        result := ComCall(26, this, "ptr", hWnd, "ptr", phDefWnd, "HRESULT")
        return phDefWnd
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} uBufLen 
     * @param {PSTR} szDescription 
     * @returns {Integer} 
     */
    GetDescriptionA(hKL, uBufLen, szDescription) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(27, this, "ptr", hKL, "uint", uBufLen, "ptr", szDescription, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} uBufLen 
     * @param {PWSTR} szDescription 
     * @returns {Integer} 
     */
    GetDescriptionW(hKL, uBufLen, szDescription) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(28, this, "ptr", hKL, "uint", uBufLen, "ptr", szDescription, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {PSTR} pBuf 
     * @returns {Integer} 
     */
    GetGuideLineA(hIMC, dwIndex, dwBufLen, pBuf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(29, this, "ptr", hIMC, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {PWSTR} pBuf 
     * @returns {Integer} 
     */
    GetGuideLineW(hIMC, dwIndex, dwBufLen, pBuf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(30, this, "ptr", hIMC, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} uBufLen 
     * @param {PSTR} szFileName 
     * @returns {Integer} 
     */
    GetIMEFileNameA(hKL, uBufLen, szFileName) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(31, this, "ptr", hKL, "uint", uBufLen, "ptr", szFileName, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} uBufLen 
     * @param {PWSTR} szFileName 
     * @returns {Integer} 
     */
    GetIMEFileNameW(hKL, uBufLen, szFileName) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(32, this, "ptr", hKL, "uint", uBufLen, "ptr", szFileName, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @returns {HRESULT} 
     */
    GetOpenStatus(hIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(33, this, "ptr", hIMC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} fdwIndex 
     * @returns {Integer} 
     */
    GetProperty(hKL, fdwIndex) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(34, this, "ptr", hKL, "uint", fdwIndex, "uint*", &pdwProperty := 0, "HRESULT")
        return pdwProperty
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFA>} pStyleBuf 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyleA(hKL, nItem, pStyleBuf, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, "ptr", hKL, "uint", nItem, "ptr", pStyleBuf, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFW>} pStyleBuf 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyleW(hKL, nItem, pStyleBuf, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, "ptr", hKL, "uint", nItem, "ptr", pStyleBuf, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @returns {POINT} 
     */
    GetStatusWindowPos(hIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pptPos := POINT()
        result := ComCall(37, this, "ptr", hIMC, "ptr", pptPos, "HRESULT")
        return pptPos
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @returns {Integer} 
     */
    GetVirtualKey(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(38, this, "ptr", hWnd, "uint*", &puVirtualKey := 0, "HRESULT")
        return puVirtualKey
    }

    /**
     * 
     * @param {PSTR} szIMEFileName 
     * @param {PSTR} szLayoutText 
     * @returns {HKL} 
     */
    InstallIMEA(szIMEFileName, szLayoutText) {
        szIMEFileName := szIMEFileName is String ? StrPtr(szIMEFileName) : szIMEFileName
        szLayoutText := szLayoutText is String ? StrPtr(szLayoutText) : szLayoutText

        phKL := HKL()
        result := ComCall(39, this, "ptr", szIMEFileName, "ptr", szLayoutText, "ptr", phKL, "HRESULT")
        return phKL
    }

    /**
     * 
     * @param {PWSTR} szIMEFileName 
     * @param {PWSTR} szLayoutText 
     * @returns {HKL} 
     */
    InstallIMEW(szIMEFileName, szLayoutText) {
        szIMEFileName := szIMEFileName is String ? StrPtr(szIMEFileName) : szIMEFileName
        szLayoutText := szLayoutText is String ? StrPtr(szLayoutText) : szLayoutText

        phKL := HKL()
        result := ComCall(40, this, "ptr", szIMEFileName, "ptr", szLayoutText, "ptr", phKL, "HRESULT")
        return phKL
    }

    /**
     * 
     * @param {HKL} hKL 
     * @returns {HRESULT} 
     */
    IsIME(hKL) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(41, this, "ptr", hKL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndIME 
     * @param {Integer} msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    IsUIMessageA(hWndIME, msg, wParam, lParam) {
        hWndIME := hWndIME is Win32Handle ? NumGet(hWndIME, "ptr") : hWndIME

        result := ComCall(42, this, "ptr", hWndIME, "uint", msg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndIME 
     * @param {Integer} msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    IsUIMessageW(hWndIME, msg, wParam, lParam) {
        hWndIME := hWndIME is Win32Handle ? NumGet(hWndIME, "ptr") : hWndIME

        result := ComCall(43, this, "ptr", hWndIME, "uint", msg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwAction 
     * @param {Integer} dwIndex 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    NotifyIME(hIMC, dwAction, dwIndex, dwValue) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(44, this, "ptr", hIMC, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szRegister 
     * @returns {HRESULT} 
     */
    RegisterWordA(hKL, szReading, dwStyle, szRegister) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(45, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @returns {HRESULT} 
     */
    RegisterWordW(hKL, szReading, dwStyle, szRegister) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(46, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {HIMC} hIMC 
     * @returns {HRESULT} 
     */
    ReleaseContext(hWnd, hIMC) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(47, this, "ptr", hWnd, "ptr", hIMC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<CANDIDATEFORM>} pCandidate 
     * @returns {HRESULT} 
     */
    SetCandidateWindow(hIMC, pCandidate) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(48, this, "ptr", hIMC, "ptr", pCandidate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<LOGFONTA>} plf 
     * @returns {HRESULT} 
     */
    SetCompositionFontA(hIMC, plf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(49, this, "ptr", hIMC, "ptr", plf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<LOGFONTW>} plf 
     * @returns {HRESULT} 
     */
    SetCompositionFontW(hIMC, plf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(50, this, "ptr", hIMC, "ptr", plf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Pointer<Void>} pComp 
     * @param {Integer} dwCompLen 
     * @param {Pointer<Void>} pRead 
     * @param {Integer} dwReadLen 
     * @returns {HRESULT} 
     */
    SetCompositionStringA(hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(51, this, "ptr", hIMC, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Pointer<Void>} pComp 
     * @param {Integer} dwCompLen 
     * @param {Pointer<Void>} pRead 
     * @param {Integer} dwReadLen 
     * @returns {HRESULT} 
     */
    SetCompositionStringW(hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(52, this, "ptr", hIMC, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<COMPOSITIONFORM>} pCompForm 
     * @returns {HRESULT} 
     */
    SetCompositionWindow(hIMC, pCompForm) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(53, this, "ptr", hIMC, "ptr", pCompForm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} fdwConversion 
     * @param {Integer} fdwSentence 
     * @returns {HRESULT} 
     */
    SetConversionStatus(hIMC, fdwConversion, fdwSentence) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(54, this, "ptr", hIMC, "uint", fdwConversion, "uint", fdwSentence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {BOOL} fOpen 
     * @returns {HRESULT} 
     */
    SetOpenStatus(hIMC, fOpen) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(55, this, "ptr", hIMC, "int", fOpen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<POINT>} pptPos 
     * @returns {HRESULT} 
     */
    SetStatusWindowPos(hIMC, pptPos) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(56, this, "ptr", hIMC, "ptr", pptPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} dwHotKeyID 
     * @returns {HRESULT} 
     */
    SimulateHotKey(hWnd, dwHotKeyID) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(57, this, "ptr", hWnd, "uint", dwHotKeyID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szUnregister 
     * @returns {HRESULT} 
     */
    UnregisterWordA(hKL, szReading, dwStyle, szUnregister) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szUnregister := szUnregister is String ? StrPtr(szUnregister) : szUnregister

        result := ComCall(58, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szUnregister 
     * @returns {HRESULT} 
     */
    UnregisterWordW(hKL, szReading, dwStyle, szUnregister) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szUnregister := szUnregister is String ? StrPtr(szUnregister) : szUnregister

        result := ComCall(59, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fRestoreLayout 
     * @returns {HRESULT} 
     */
    Activate(fRestoreLayout) {
        result := ComCall(60, this, "int", fRestoreLayout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Deactivate() {
        result := ComCall(61, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} Msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     */
    OnDefWindowProc(hWnd, Msg, wParam, lParam) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(62, this, "ptr", hWnd, "uint", Msg, "ptr", wParam, "ptr", lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {Pointer<Integer>} aaClassList 
     * @param {Integer} uSize 
     * @returns {HRESULT} 
     */
    FilterClientWindows(aaClassList, uSize) {
        aaClassListMarshal := aaClassList is VarRef ? "ushort*" : "ptr"

        result := ComCall(63, this, aaClassListMarshal, aaClassList, "uint", uSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @returns {Integer} 
     */
    GetCodePageA(hKL) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(64, this, "ptr", hKL, "uint*", &uCodePage := 0, "HRESULT")
        return uCodePage
    }

    /**
     * 
     * @param {HKL} hKL 
     * @returns {Integer} 
     */
    GetLangId(hKL) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(65, this, "ptr", hKL, "ushort*", &plid := 0, "HRESULT")
        return plid
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {HIMC} hIMC 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AssociateContextEx(hWnd, hIMC, dwFlags) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(66, this, "ptr", hWnd, "ptr", hIMC, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idThread 
     * @returns {HRESULT} 
     */
    DisableIME(idThread) {
        result := ComCall(67, this, "uint", idThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwFlags 
     * @param {Integer} dwType 
     * @param {Pointer<IMEMENUITEMINFOA>} pImeParentMenu 
     * @param {Pointer<IMEMENUITEMINFOA>} pImeMenu 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    GetImeMenuItemsA(hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(68, this, "ptr", hIMC, "uint", dwFlags, "uint", dwType, "ptr", pImeParentMenu, "ptr", pImeMenu, "uint", dwSize, pdwResultMarshal, pdwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwFlags 
     * @param {Integer} dwType 
     * @param {Pointer<IMEMENUITEMINFOW>} pImeParentMenu 
     * @param {Pointer<IMEMENUITEMINFOW>} pImeMenu 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    GetImeMenuItemsW(hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(69, this, "ptr", hIMC, "uint", dwFlags, "uint", dwType, "ptr", pImeParentMenu, "ptr", pImeMenu, "uint", dwSize, pdwResultMarshal, pdwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idThread 
     * @returns {IEnumInputContext} 
     */
    EnumInputContext(idThread) {
        result := ComCall(70, this, "uint", idThread, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumInputContext(ppEnum)
    }
}
