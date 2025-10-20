#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIMMIME extends IUnknown{
    /**
     * The interface identifier for IActiveIMMIME
     * @type {Guid}
     */
    static IID => Guid("{08c03411-f96b-11d0-a475-00aa006bcc59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} hWnd 
     * @param {HIMC} hIME 
     * @param {Pointer<HIMC>} phPrev 
     * @returns {HRESULT} 
     */
    AssociateContext(hWnd, hIME, phPrev) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hIME := hIME is Win32Handle ? NumGet(hIME, "ptr") : hIME

        result := ComCall(3, this, "ptr", hWnd, "ptr", hIME, "ptr", phPrev, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := ComCall(4, this, "ptr", hKL, "ptr", hWnd, "uint", dwMode, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(5, this, "ptr", hKL, "ptr", hWnd, "uint", dwMode, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a recognizer context.
     * @param {Pointer<HIMC>} phIMC 
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
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
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-createcontext
     */
    CreateContext(phIMC) {
        result := ComCall(6, this, "ptr", phIMC, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := ComCall(7, this, "ptr", hIME, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<IEnumRegisterWordA>} pEnum 
     * @returns {HRESULT} 
     */
    EnumRegisterWordA(hKL, szReading, dwStyle, szRegister, pData, pEnum) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(8, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "ptr", pData, "ptr", pEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<IEnumRegisterWordW>} pEnum 
     * @returns {HRESULT} 
     */
    EnumRegisterWordW(hKL, szReading, dwStyle, szRegister, pData, pEnum) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(9, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "ptr", pData, "ptr", pEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HIMC} hIMC 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<LRESULT>} plResult 
     * @returns {HRESULT} 
     */
    EscapeA(hKL, hIMC, uEscape, pData, plResult) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(10, this, "ptr", hKL, "ptr", hIMC, "uint", uEscape, "ptr", pData, "ptr", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HIMC} hIMC 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<LRESULT>} plResult 
     * @returns {HRESULT} 
     */
    EscapeW(hKL, hIMC, uEscape, pData, plResult) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(11, this, "ptr", hKL, "ptr", hIMC, "uint", uEscape, "ptr", pData, "ptr", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pCandList 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetCandidateListA(hIMC, dwIndex, uBufLen, pCandList, puCopied) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(12, this, "ptr", hIMC, "uint", dwIndex, "uint", uBufLen, "ptr", pCandList, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pCandList 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetCandidateListW(hIMC, dwIndex, uBufLen, pCandList, puCopied) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(13, this, "ptr", hIMC, "uint", dwIndex, "uint", uBufLen, "ptr", pCandList, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<UInt32>} pdwListSize 
     * @param {Pointer<UInt32>} pdwBufLen 
     * @returns {HRESULT} 
     */
    GetCandidateListCountA(hIMC, pdwListSize, pdwBufLen) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(14, this, "ptr", hIMC, "uint*", pdwListSize, "uint*", pdwBufLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<UInt32>} pdwListSize 
     * @param {Pointer<UInt32>} pdwBufLen 
     * @returns {HRESULT} 
     */
    GetCandidateListCountW(hIMC, pdwListSize, pdwBufLen) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(15, this, "ptr", hIMC, "uint*", pdwListSize, "uint*", pdwBufLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Pointer<CANDIDATEFORM>} pCandidate 
     * @returns {HRESULT} 
     */
    GetCandidateWindow(hIMC, dwIndex, pCandidate) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(16, this, "ptr", hIMC, "uint", dwIndex, "ptr", pCandidate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<LOGFONTA>} plf 
     * @returns {HRESULT} 
     */
    GetCompositionFontA(hIMC, plf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(17, this, "ptr", hIMC, "ptr", plf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<LOGFONTW>} plf 
     * @returns {HRESULT} 
     */
    GetCompositionFontW(hIMC, plf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(18, this, "ptr", hIMC, "ptr", plf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {Pointer<Int32>} plCopied 
     * @param {Pointer<Void>} pBuf 
     * @returns {HRESULT} 
     */
    GetCompositionStringA(hIMC, dwIndex, dwBufLen, plCopied, pBuf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(19, this, "ptr", hIMC, "uint", dwIndex, "uint", dwBufLen, "int*", plCopied, "ptr", pBuf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {Pointer<Int32>} plCopied 
     * @param {Pointer<Void>} pBuf 
     * @returns {HRESULT} 
     */
    GetCompositionStringW(hIMC, dwIndex, dwBufLen, plCopied, pBuf) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(20, this, "ptr", hIMC, "uint", dwIndex, "uint", dwBufLen, "int*", plCopied, "ptr", pBuf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<COMPOSITIONFORM>} pCompForm 
     * @returns {HRESULT} 
     */
    GetCompositionWindow(hIMC, pCompForm) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(21, this, "ptr", hIMC, "ptr", pCompForm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Pointer<HIMC>} phIMC 
     * @returns {HRESULT} 
     */
    GetContext(hWnd, phIMC) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(22, this, "ptr", hWnd, "ptr", phIMC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HIMC} hIMC 
     * @param {PSTR} pSrc 
     * @param {Integer} uBufLen 
     * @param {Integer} uFlag 
     * @param {Pointer<CANDIDATELIST>} pDst 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetConversionListA(hKL, hIMC, pSrc, uBufLen, uFlag, pDst, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(23, this, "ptr", hKL, "ptr", hIMC, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, "ptr", pDst, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetConversionListW(hKL, hIMC, pSrc, uBufLen, uFlag, pDst, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        result := ComCall(24, this, "ptr", hKL, "ptr", hIMC, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, "ptr", pDst, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<UInt32>} pfdwConversion 
     * @param {Pointer<UInt32>} pfdwSentence 
     * @returns {HRESULT} 
     */
    GetConversionStatus(hIMC, pfdwConversion, pfdwSentence) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(25, this, "ptr", hIMC, "uint*", pfdwConversion, "uint*", pfdwSentence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Pointer<HWND>} phDefWnd 
     * @returns {HRESULT} 
     */
    GetDefaultIMEWnd(hWnd, phDefWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(26, this, "ptr", hWnd, "ptr", phDefWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} uBufLen 
     * @param {PSTR} szDescription 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetDescriptionA(hKL, uBufLen, szDescription, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(27, this, "ptr", hKL, "uint", uBufLen, "ptr", szDescription, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} uBufLen 
     * @param {PWSTR} szDescription 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetDescriptionW(hKL, uBufLen, szDescription, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(28, this, "ptr", hKL, "uint", uBufLen, "ptr", szDescription, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {PSTR} pBuf 
     * @param {Pointer<UInt32>} pdwResult 
     * @returns {HRESULT} 
     */
    GetGuideLineA(hIMC, dwIndex, dwBufLen, pBuf, pdwResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(29, this, "ptr", hIMC, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", pdwResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {PWSTR} pBuf 
     * @param {Pointer<UInt32>} pdwResult 
     * @returns {HRESULT} 
     */
    GetGuideLineW(hIMC, dwIndex, dwBufLen, pBuf, pdwResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(30, this, "ptr", hIMC, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", pdwResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} uBufLen 
     * @param {PSTR} szFileName 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetIMEFileNameA(hKL, uBufLen, szFileName, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(31, this, "ptr", hKL, "uint", uBufLen, "ptr", szFileName, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} uBufLen 
     * @param {PWSTR} szFileName 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetIMEFileNameW(hKL, uBufLen, szFileName, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(32, this, "ptr", hKL, "uint", uBufLen, "ptr", szFileName, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @returns {HRESULT} 
     */
    GetOpenStatus(hIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(33, this, "ptr", hIMC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} fdwIndex 
     * @param {Pointer<UInt32>} pdwProperty 
     * @returns {HRESULT} 
     */
    GetProperty(hKL, fdwIndex, pdwProperty) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(34, this, "ptr", hKL, "uint", fdwIndex, "uint*", pdwProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFA>} pStyleBuf 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyleA(hKL, nItem, pStyleBuf, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(35, this, "ptr", hKL, "uint", nItem, "ptr", pStyleBuf, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFW>} pStyleBuf 
     * @param {Pointer<UInt32>} puCopied 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyleW(hKL, nItem, pStyleBuf, puCopied) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(36, this, "ptr", hKL, "uint", nItem, "ptr", pStyleBuf, "uint*", puCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<POINT>} pptPos 
     * @returns {HRESULT} 
     */
    GetStatusWindowPos(hIMC, pptPos) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(37, this, "ptr", hIMC, "ptr", pptPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Pointer<UInt32>} puVirtualKey 
     * @returns {HRESULT} 
     */
    GetVirtualKey(hWnd, puVirtualKey) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(38, this, "ptr", hWnd, "uint*", puVirtualKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} szIMEFileName 
     * @param {PSTR} szLayoutText 
     * @param {Pointer<HKL>} phKL 
     * @returns {HRESULT} 
     */
    InstallIMEA(szIMEFileName, szLayoutText, phKL) {
        result := ComCall(39, this, "ptr", szIMEFileName, "ptr", szLayoutText, "ptr", phKL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szIMEFileName 
     * @param {PWSTR} szLayoutText 
     * @param {Pointer<HKL>} phKL 
     * @returns {HRESULT} 
     */
    InstallIMEW(szIMEFileName, szLayoutText, phKL) {
        szIMEFileName := szIMEFileName is String ? StrPtr(szIMEFileName) : szIMEFileName
        szLayoutText := szLayoutText is String ? StrPtr(szLayoutText) : szLayoutText

        result := ComCall(40, this, "ptr", szIMEFileName, "ptr", szLayoutText, "ptr", phKL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @returns {HRESULT} 
     */
    IsIME(hKL) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(41, this, "ptr", hKL, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(42, this, "ptr", hWndIME, "uint", msg, "ptr", wParam, "ptr", lParam, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(43, this, "ptr", hWndIME, "uint", msg, "ptr", wParam, "ptr", lParam, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(44, this, "ptr", hIMC, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(45, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(46, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(47, this, "ptr", hWnd, "ptr", hIMC, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(48, this, "ptr", hIMC, "ptr", pCandidate, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(49, this, "ptr", hIMC, "ptr", plf, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(50, this, "ptr", hIMC, "ptr", plf, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(51, this, "ptr", hIMC, "uint", dwIndex, "ptr", pComp, "uint", dwCompLen, "ptr", pRead, "uint", dwReadLen, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(52, this, "ptr", hIMC, "uint", dwIndex, "ptr", pComp, "uint", dwCompLen, "ptr", pRead, "uint", dwReadLen, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(53, this, "ptr", hIMC, "ptr", pCompForm, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(54, this, "ptr", hIMC, "uint", fdwConversion, "uint", fdwSentence, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(55, this, "ptr", hIMC, "int", fOpen, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(56, this, "ptr", hIMC, "ptr", pptPos, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(57, this, "ptr", hWnd, "uint", dwHotKeyID, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(58, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(59, this, "ptr", hKL, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @returns {HRESULT} 
     */
    GenerateMessage(hIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(60, this, "ptr", hIMC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<INPUTCONTEXT>} ppIMC 
     * @returns {HRESULT} 
     */
    LockIMC(hIMC, ppIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(61, this, "ptr", hIMC, "ptr", ppIMC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @returns {HRESULT} 
     */
    UnlockIMC(hIMC) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(62, this, "ptr", hIMC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Pointer<UInt32>} pdwLockCount 
     * @returns {HRESULT} 
     */
    GetIMCLockCount(hIMC, pdwLockCount) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(63, this, "ptr", hIMC, "uint*", pdwLockCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @param {Pointer<HIMCC>} phIMCC 
     * @returns {HRESULT} 
     */
    CreateIMCC(dwSize, phIMCC) {
        result := ComCall(64, this, "uint", dwSize, "ptr", phIMCC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMCC} hIMCC 
     * @returns {HRESULT} 
     */
    DestroyIMCC(hIMCC) {
        hIMCC := hIMCC is Win32Handle ? NumGet(hIMCC, "ptr") : hIMCC

        result := ComCall(65, this, "ptr", hIMCC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMCC} hIMCC 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    LockIMCC(hIMCC, ppv) {
        hIMCC := hIMCC is Win32Handle ? NumGet(hIMCC, "ptr") : hIMCC

        result := ComCall(66, this, "ptr", hIMCC, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMCC} hIMCC 
     * @returns {HRESULT} 
     */
    UnlockIMCC(hIMCC) {
        hIMCC := hIMCC is Win32Handle ? NumGet(hIMCC, "ptr") : hIMCC

        result := ComCall(67, this, "ptr", hIMCC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMCC} hIMCC 
     * @param {Integer} dwSize 
     * @param {Pointer<HIMCC>} phIMCC 
     * @returns {HRESULT} 
     */
    ReSizeIMCC(hIMCC, dwSize, phIMCC) {
        hIMCC := hIMCC is Win32Handle ? NumGet(hIMCC, "ptr") : hIMCC

        result := ComCall(68, this, "ptr", hIMCC, "uint", dwSize, "ptr", phIMCC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMCC} hIMCC 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetIMCCSize(hIMCC, pdwSize) {
        hIMCC := hIMCC is Win32Handle ? NumGet(hIMCC, "ptr") : hIMCC

        result := ComCall(69, this, "ptr", hIMCC, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMCC} hIMCC 
     * @param {Pointer<UInt32>} pdwLockCount 
     * @returns {HRESULT} 
     */
    GetIMCCLockCount(hIMCC, pdwLockCount) {
        hIMCC := hIMCC is Win32Handle ? NumGet(hIMCC, "ptr") : hIMCC

        result := ComCall(70, this, "ptr", hIMCC, "uint*", pdwLockCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwHotKeyID 
     * @param {Pointer<UInt32>} puModifiers 
     * @param {Pointer<UInt32>} puVKey 
     * @param {Pointer<HKL>} phKL 
     * @returns {HRESULT} 
     */
    GetHotKey(dwHotKeyID, puModifiers, puVKey, phKL) {
        result := ComCall(71, this, "uint", dwHotKeyID, "uint*", puModifiers, "uint*", puVKey, "ptr", phKL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwHotKeyID 
     * @param {Integer} uModifiers 
     * @param {Integer} uVKey 
     * @param {HKL} hKL 
     * @returns {HRESULT} 
     */
    SetHotKey(dwHotKeyID, uModifiers, uVKey, hKL) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(72, this, "uint", dwHotKeyID, "uint", uModifiers, "uint", uVKey, "ptr", hKL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uType 
     * @param {HWND} hOwner 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<HWND>} phSoftKbdWnd 
     * @returns {HRESULT} 
     */
    CreateSoftKeyboard(uType, hOwner, x, y, phSoftKbdWnd) {
        hOwner := hOwner is Win32Handle ? NumGet(hOwner, "ptr") : hOwner

        result := ComCall(73, this, "uint", uType, "ptr", hOwner, "int", x, "int", y, "ptr", phSoftKbdWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hSoftKbdWnd 
     * @returns {HRESULT} 
     */
    DestroySoftKeyboard(hSoftKbdWnd) {
        hSoftKbdWnd := hSoftKbdWnd is Win32Handle ? NumGet(hSoftKbdWnd, "ptr") : hSoftKbdWnd

        result := ComCall(74, this, "ptr", hSoftKbdWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hSoftKbdWnd 
     * @param {Integer} nCmdShow 
     * @returns {HRESULT} 
     */
    ShowSoftKeyboard(hSoftKbdWnd, nCmdShow) {
        hSoftKbdWnd := hSoftKbdWnd is Win32Handle ? NumGet(hSoftKbdWnd, "ptr") : hSoftKbdWnd

        result := ComCall(75, this, "ptr", hSoftKbdWnd, "int", nCmdShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Pointer<UInt32>} uCodePage 
     * @returns {HRESULT} 
     */
    GetCodePageA(hKL, uCodePage) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(76, this, "ptr", hKL, "uint*", uCodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {Pointer<UInt16>} plid 
     * @returns {HRESULT} 
     */
    GetLangId(hKL, plid) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(77, this, "ptr", hKL, "ushort*", plid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lgidIME 
     * @param {Integer} bVk 
     * @param {Integer} bScan 
     * @param {Integer} dwFlags 
     * @param {Integer} dwExtraInfo 
     * @returns {HRESULT} 
     */
    KeybdEvent(lgidIME, bVk, bScan, dwFlags, dwExtraInfo) {
        result := ComCall(78, this, "ushort", lgidIME, "char", bVk, "char", bScan, "uint", dwFlags, "uint", dwExtraInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LockModal() {
        result := ComCall(79, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockModal() {
        result := ComCall(80, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := ComCall(81, this, "ptr", hWnd, "ptr", hIMC, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idThread 
     * @returns {HRESULT} 
     */
    DisableIME(idThread) {
        result := ComCall(82, this, "uint", idThread, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<UInt32>} pdwResult 
     * @returns {HRESULT} 
     */
    GetImeMenuItemsA(hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(83, this, "ptr", hIMC, "uint", dwFlags, "uint", dwType, "ptr", pImeParentMenu, "ptr", pImeMenu, "uint", dwSize, "uint*", pdwResult, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<UInt32>} pdwResult 
     * @returns {HRESULT} 
     */
    GetImeMenuItemsW(hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(84, this, "ptr", hIMC, "uint", dwFlags, "uint", dwType, "ptr", pImeParentMenu, "ptr", pImeMenu, "uint", dwSize, "uint*", pdwResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idThread 
     * @param {Pointer<IEnumInputContext>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumInputContext(idThread, ppEnum) {
        result := ComCall(85, this, "uint", idThread, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<LRESULT>} plResult 
     * @returns {HRESULT} 
     */
    RequestMessageA(hIMC, wParam, lParam, plResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(86, this, "ptr", hIMC, "ptr", wParam, "ptr", lParam, "ptr", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<LRESULT>} plResult 
     * @returns {HRESULT} 
     */
    RequestMessageW(hIMC, wParam, lParam, plResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(87, this, "ptr", hIMC, "ptr", wParam, "ptr", lParam, "ptr", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<LRESULT>} plResult 
     * @returns {HRESULT} 
     */
    SendIMCA(hWnd, uMsg, wParam, lParam, plResult) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(88, this, "ptr", hWnd, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<LRESULT>} plResult 
     * @returns {HRESULT} 
     */
    SendIMCW(hWnd, uMsg, wParam, lParam, plResult) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(89, this, "ptr", hWnd, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsSleeping() {
        result := ComCall(90, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
