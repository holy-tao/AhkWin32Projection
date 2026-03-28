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
#Include .\HIMCC.ahk
#Include .\IEnumInputContext.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIMMIME extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssociateContext", "ConfigureIMEA", "ConfigureIMEW", "CreateContext", "DestroyContext", "EnumRegisterWordA", "EnumRegisterWordW", "EscapeA", "EscapeW", "GetCandidateListA", "GetCandidateListW", "GetCandidateListCountA", "GetCandidateListCountW", "GetCandidateWindow", "GetCompositionFontA", "GetCompositionFontW", "GetCompositionStringA", "GetCompositionStringW", "GetCompositionWindow", "GetContext", "GetConversionListA", "GetConversionListW", "GetConversionStatus", "GetDefaultIMEWnd", "GetDescriptionA", "GetDescriptionW", "GetGuideLineA", "GetGuideLineW", "GetIMEFileNameA", "GetIMEFileNameW", "GetOpenStatus", "GetProperty", "GetRegisterWordStyleA", "GetRegisterWordStyleW", "GetStatusWindowPos", "GetVirtualKey", "InstallIMEA", "InstallIMEW", "IsIME", "IsUIMessageA", "IsUIMessageW", "NotifyIME", "RegisterWordA", "RegisterWordW", "ReleaseContext", "SetCandidateWindow", "SetCompositionFontA", "SetCompositionFontW", "SetCompositionStringA", "SetCompositionStringW", "SetCompositionWindow", "SetConversionStatus", "SetOpenStatus", "SetStatusWindowPos", "SimulateHotKey", "UnregisterWordA", "UnregisterWordW", "GenerateMessage", "LockIMC", "UnlockIMC", "GetIMCLockCount", "CreateIMCC", "DestroyIMCC", "LockIMCC", "UnlockIMCC", "ReSizeIMCC", "GetIMCCSize", "GetIMCCLockCount", "GetHotKey", "SetHotKey", "CreateSoftKeyboard", "DestroySoftKeyboard", "ShowSoftKeyboard", "GetCodePageA", "GetLangId", "KeybdEvent", "LockModal", "UnlockModal", "AssociateContextEx", "DisableIME", "GetImeMenuItemsA", "GetImeMenuItemsW", "EnumInputContext", "RequestMessageA", "RequestMessageW", "SendIMCA", "SendIMCW", "IsSleeping"]

    /**
     * Inserts a name into the name cache to find a specified FIO_CONTEXT structure.
     * @remarks
     * If the name is already present in the cache, this call fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_DUP_NAME.
     * @param {HWND} _hWnd 
     * @param {HIMC} hIME 
     * @returns {HIMC} 
     * @see https://learn.microsoft.com/windows/win32/api/filehc/nf-filehc-associatecontextwithname
     */
    AssociateContext(_hWnd, hIME) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd
        hIME := hIME is Win32Handle ? NumGet(hIME, "ptr") : hIME

        phPrev := HIMC()
        result := ComCall(3, this, "ptr", _hWnd, "ptr", hIME, "ptr", phPrev, "HRESULT")
        return phPrev
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {HWND} _hWnd 
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDA>} pData 
     * @returns {HRESULT} 
     */
    ConfigureIMEA(_hKL, _hWnd, dwMode, pData) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(4, this, "ptr", _hKL, "ptr", _hWnd, "uint", dwMode, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {HWND} _hWnd 
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDW>} pData 
     * @returns {HRESULT} 
     */
    ConfigureIMEW(_hKL, _hWnd, dwMode, pData) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(5, this, "ptr", _hKL, "ptr", _hWnd, "uint", dwMode, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Creates a recognizer context.
     * @returns {HIMC} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-createcontext
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
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-destroycontext
     */
    DestroyContext(hIME) {
        hIME := hIME is Win32Handle ? NumGet(hIME, "ptr") : hIME

        result := ComCall(7, this, "ptr", hIME, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @returns {IEnumRegisterWordA} 
     */
    EnumRegisterWordA(_hKL, szReading, dwStyle, szRegister, pData) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &pEnum := 0, "HRESULT")
        return IEnumRegisterWordA(pEnum)
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @returns {IEnumRegisterWordW} 
     */
    EnumRegisterWordW(_hKL, szReading, dwStyle, szRegister, pData) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "ptr", _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &pEnum := 0, "HRESULT")
        return IEnumRegisterWordW(pEnum)
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {HIMC} _hIMC 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @returns {LRESULT} 
     */
    EscapeA(_hKL, _hIMC, uEscape, pData) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", _hKL, "ptr", _hIMC, "uint", uEscape, pDataMarshal, pData, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {HIMC} _hIMC 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @returns {LRESULT} 
     */
    EscapeW(_hKL, _hIMC, uEscape, pData) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", _hKL, "ptr", _hIMC, "uint", uEscape, pDataMarshal, pData, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pCandList 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetCandidateListA(_hIMC, dwIndex, uBufLen, pCandList, puCopied) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", _hIMC, "uint", dwIndex, "uint", uBufLen, "ptr", pCandList, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pCandList 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetCandidateListW(_hIMC, dwIndex, uBufLen, pCandList, puCopied) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", _hIMC, "uint", dwIndex, "uint", uBufLen, "ptr", pCandList, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<Integer>} pdwListSize 
     * @param {Pointer<Integer>} pdwBufLen 
     * @returns {HRESULT} 
     */
    GetCandidateListCountA(_hIMC, pdwListSize, pdwBufLen) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pdwListSizeMarshal := pdwListSize is VarRef ? "uint*" : "ptr"
        pdwBufLenMarshal := pdwBufLen is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", _hIMC, pdwListSizeMarshal, pdwListSize, pdwBufLenMarshal, pdwBufLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<Integer>} pdwListSize 
     * @param {Pointer<Integer>} pdwBufLen 
     * @returns {HRESULT} 
     */
    GetCandidateListCountW(_hIMC, pdwListSize, pdwBufLen) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pdwListSizeMarshal := pdwListSize is VarRef ? "uint*" : "ptr"
        pdwBufLenMarshal := pdwBufLen is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", _hIMC, pdwListSizeMarshal, pdwListSize, pdwBufLenMarshal, pdwBufLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @returns {CANDIDATEFORM} 
     */
    GetCandidateWindow(_hIMC, dwIndex) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pCandidate := CANDIDATEFORM()
        result := ComCall(16, this, "ptr", _hIMC, "uint", dwIndex, "ptr", pCandidate, "HRESULT")
        return pCandidate
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {LOGFONTA} 
     */
    GetCompositionFontA(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        plf := LOGFONTA()
        result := ComCall(17, this, "ptr", _hIMC, "ptr", plf, "HRESULT")
        return plf
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {LOGFONTW} 
     */
    GetCompositionFontW(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        plf := LOGFONTW()
        result := ComCall(18, this, "ptr", _hIMC, "ptr", plf, "HRESULT")
        return plf
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {Pointer<Integer>} plCopied 
     * @param {Pointer<Void>} pBuf 
     * @returns {HRESULT} 
     */
    GetCompositionStringA(_hIMC, dwIndex, dwBufLen, plCopied, pBuf) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        plCopiedMarshal := plCopied is VarRef ? "int*" : "ptr"
        pBufMarshal := pBuf is VarRef ? "ptr" : "ptr"

        result := ComCall(19, this, "ptr", _hIMC, "uint", dwIndex, "uint", dwBufLen, plCopiedMarshal, plCopied, pBufMarshal, pBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {Pointer<Integer>} plCopied 
     * @param {Pointer<Void>} pBuf 
     * @returns {HRESULT} 
     */
    GetCompositionStringW(_hIMC, dwIndex, dwBufLen, plCopied, pBuf) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        plCopiedMarshal := plCopied is VarRef ? "int*" : "ptr"
        pBufMarshal := pBuf is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, "ptr", _hIMC, "uint", dwIndex, "uint", dwBufLen, plCopiedMarshal, plCopied, pBufMarshal, pBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {COMPOSITIONFORM} 
     */
    GetCompositionWindow(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pCompForm := COMPOSITIONFORM()
        result := ComCall(21, this, "ptr", _hIMC, "ptr", pCompForm, "HRESULT")
        return pCompForm
    }

    /**
     * Gets the context preference flags.
     * @param {HWND} _hWnd 
     * @returns {HIMC} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getcontextpreferenceflags
     */
    GetContext(_hWnd) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        phIMC := HIMC()
        result := ComCall(22, this, "ptr", _hWnd, "ptr", phIMC, "HRESULT")
        return phIMC
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {HIMC} _hIMC 
     * @param {PSTR} pSrc 
     * @param {Integer} uBufLen 
     * @param {Integer} uFlag 
     * @param {Pointer<CANDIDATELIST>} pDst 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetConversionListA(_hKL, _hIMC, pSrc, uBufLen, uFlag, pDst, puCopied) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", _hKL, "ptr", _hIMC, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, "ptr", pDst, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {HIMC} _hIMC 
     * @param {PWSTR} pSrc 
     * @param {Integer} uBufLen 
     * @param {Integer} uFlag 
     * @param {Pointer<CANDIDATELIST>} pDst 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetConversionListW(_hKL, _hIMC, pSrc, uBufLen, uFlag, pDst, puCopied) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "ptr", _hKL, "ptr", _hIMC, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, "ptr", pDst, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * Indicates the status of the encryption or decryption on the volume.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {HIMC} _hIMC 
     * @param {Pointer<Integer>} pfdwConversion 
     * @param {Pointer<Integer>} pfdwSentence 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                  | Description                           |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                  | The method was successful.<br/> |
     * | <dl> <dt>**FVE\_E\_LOCKED\_VOLUME**</dt> <dt>2150694912 (0x80310000)</dt> </dl> | The volume is locked.<br/>      |
     * @see https://learn.microsoft.com/windows/win32/SecProv/getconversionstatus-win32-encryptablevolume
     */
    GetConversionStatus(_hIMC, pfdwConversion, pfdwSentence) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pfdwConversionMarshal := pfdwConversion is VarRef ? "uint*" : "ptr"
        pfdwSentenceMarshal := pfdwSentence is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "ptr", _hIMC, pfdwConversionMarshal, pfdwConversion, pfdwSentenceMarshal, pfdwSentence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @returns {HWND} 
     */
    GetDefaultIMEWnd(_hWnd) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        phDefWnd := HWND()
        result := ComCall(26, this, "ptr", _hWnd, "ptr", phDefWnd, "HRESULT")
        return phDefWnd
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {Integer} uBufLen 
     * @param {PSTR} szDescription 
     * @returns {Integer} 
     */
    GetDescriptionA(_hKL, uBufLen, szDescription) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(27, this, "ptr", _hKL, "uint", uBufLen, "ptr", szDescription, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {Integer} uBufLen 
     * @param {PWSTR} szDescription 
     * @returns {Integer} 
     */
    GetDescriptionW(_hKL, uBufLen, szDescription) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(28, this, "ptr", _hKL, "uint", uBufLen, "ptr", szDescription, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {PSTR} pBuf 
     * @returns {Integer} 
     */
    GetGuideLineA(_hIMC, dwIndex, dwBufLen, pBuf) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(29, this, "ptr", _hIMC, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {PWSTR} pBuf 
     * @returns {Integer} 
     */
    GetGuideLineW(_hIMC, dwIndex, dwBufLen, pBuf) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(30, this, "ptr", _hIMC, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {Integer} uBufLen 
     * @param {PSTR} szFileName 
     * @returns {Integer} 
     */
    GetIMEFileNameA(_hKL, uBufLen, szFileName) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(31, this, "ptr", _hKL, "uint", uBufLen, "ptr", szFileName, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {Integer} uBufLen 
     * @param {PWSTR} szFileName 
     * @returns {Integer} 
     */
    GetIMEFileNameW(_hKL, uBufLen, szFileName) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(32, this, "ptr", _hKL, "uint", uBufLen, "ptr", szFileName, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {HRESULT} 
     */
    GetOpenStatus(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(33, this, "ptr", _hIMC, "HRESULT")
        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {HKL} _hKL 
     * @param {Integer} fdwIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(_hKL, fdwIndex) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL

        result := ComCall(34, this, "ptr", _hKL, "uint", fdwIndex, "uint*", &pdwProperty := 0, "HRESULT")
        return pdwProperty
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFA>} pStyleBuf 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyleA(_hKL, nItem, pStyleBuf, puCopied) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, "ptr", _hKL, "uint", nItem, "ptr", pStyleBuf, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFW>} pStyleBuf 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyleW(_hKL, nItem, pStyleBuf, puCopied) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, "ptr", _hKL, "uint", nItem, "ptr", pStyleBuf, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {POINT} 
     */
    GetStatusWindowPos(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pptPos := POINT()
        result := ComCall(37, this, "ptr", _hIMC, "ptr", pptPos, "HRESULT")
        return pptPos
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @returns {Integer} 
     */
    GetVirtualKey(_hWnd) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(38, this, "ptr", _hWnd, "uint*", &puVirtualKey := 0, "HRESULT")
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
     * @param {HKL} _hKL 
     * @returns {HRESULT} 
     */
    IsIME(_hKL) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL

        result := ComCall(41, this, "ptr", _hKL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndIME 
     * @param {Integer} _msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    IsUIMessageA(hWndIME, _msg, _wParam, _lParam) {
        hWndIME := hWndIME is Win32Handle ? NumGet(hWndIME, "ptr") : hWndIME

        result := ComCall(42, this, "ptr", hWndIME, "uint", _msg, "ptr", _wParam, "ptr", _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndIME 
     * @param {Integer} _msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    IsUIMessageW(hWndIME, _msg, _wParam, _lParam) {
        hWndIME := hWndIME is Win32Handle ? NumGet(hWndIME, "ptr") : hWndIME

        result := ComCall(43, this, "ptr", hWndIME, "uint", _msg, "ptr", _wParam, "ptr", _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwAction 
     * @param {Integer} dwIndex 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    NotifyIME(_hIMC, dwAction, dwIndex, dwValue) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(44, this, "ptr", _hIMC, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szRegister 
     * @returns {HRESULT} 
     */
    RegisterWordA(_hKL, szReading, dwStyle, szRegister) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(45, this, "ptr", _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @returns {HRESULT} 
     */
    RegisterWordW(_hKL, szReading, dwStyle, szRegister) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(46, this, "ptr", _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {HIMC} _hIMC 
     * @returns {HRESULT} 
     */
    ReleaseContext(_hWnd, _hIMC) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(47, this, "ptr", _hWnd, "ptr", _hIMC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<CANDIDATEFORM>} pCandidate 
     * @returns {HRESULT} 
     */
    SetCandidateWindow(_hIMC, pCandidate) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(48, this, "ptr", _hIMC, "ptr", pCandidate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<LOGFONTA>} plf 
     * @returns {HRESULT} 
     */
    SetCompositionFontA(_hIMC, plf) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(49, this, "ptr", _hIMC, "ptr", plf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<LOGFONTW>} plf 
     * @returns {HRESULT} 
     */
    SetCompositionFontW(_hIMC, plf) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(50, this, "ptr", _hIMC, "ptr", plf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @param {Pointer<Void>} pComp 
     * @param {Integer} dwCompLen 
     * @param {Pointer<Void>} pRead 
     * @param {Integer} dwReadLen 
     * @returns {HRESULT} 
     */
    SetCompositionStringA(_hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(51, this, "ptr", _hIMC, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @param {Pointer<Void>} pComp 
     * @param {Integer} dwCompLen 
     * @param {Pointer<Void>} pRead 
     * @param {Integer} dwReadLen 
     * @returns {HRESULT} 
     */
    SetCompositionStringW(_hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(52, this, "ptr", _hIMC, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<COMPOSITIONFORM>} pCompForm 
     * @returns {HRESULT} 
     */
    SetCompositionWindow(_hIMC, pCompForm) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(53, this, "ptr", _hIMC, "ptr", pCompForm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} fdwConversion 
     * @param {Integer} fdwSentence 
     * @returns {HRESULT} 
     */
    SetConversionStatus(_hIMC, fdwConversion, fdwSentence) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(54, this, "ptr", _hIMC, "uint", fdwConversion, "uint", fdwSentence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {BOOL} fOpen 
     * @returns {HRESULT} 
     */
    SetOpenStatus(_hIMC, fOpen) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(55, this, "ptr", _hIMC, "int", fOpen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<POINT>} pptPos 
     * @returns {HRESULT} 
     */
    SetStatusWindowPos(_hIMC, pptPos) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(56, this, "ptr", _hIMC, "ptr", pptPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Integer} dwHotKeyID 
     * @returns {HRESULT} 
     */
    SimulateHotKey(_hWnd, dwHotKeyID) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(57, this, "ptr", _hWnd, "uint", dwHotKeyID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szUnregister 
     * @returns {HRESULT} 
     */
    UnregisterWordA(_hKL, szReading, dwStyle, szUnregister) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szUnregister := szUnregister is String ? StrPtr(szUnregister) : szUnregister

        result := ComCall(58, this, "ptr", _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szUnregister 
     * @returns {HRESULT} 
     */
    UnregisterWordW(_hKL, szReading, dwStyle, szUnregister) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szUnregister := szUnregister is String ? StrPtr(szUnregister) : szUnregister

        result := ComCall(59, this, "ptr", _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {HRESULT} 
     */
    GenerateMessage(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(60, this, "ptr", _hIMC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {Pointer<INPUTCONTEXT>} 
     */
    LockIMC(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(61, this, "ptr", _hIMC, "ptr*", &ppIMC := 0, "HRESULT")
        return ppIMC
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {HRESULT} 
     */
    UnlockIMC(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(62, this, "ptr", _hIMC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {Integer} 
     */
    GetIMCLockCount(_hIMC) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(63, this, "ptr", _hIMC, "uint*", &pdwLockCount := 0, "HRESULT")
        return pdwLockCount
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @returns {HIMCC} 
     */
    CreateIMCC(dwSize) {
        phIMCC := HIMCC()
        result := ComCall(64, this, "uint", dwSize, "ptr", phIMCC, "HRESULT")
        return phIMCC
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {HRESULT} 
     */
    DestroyIMCC(_hIMCC) {
        _hIMCC := _hIMCC is Win32Handle ? NumGet(_hIMCC, "ptr") : _hIMCC

        result := ComCall(65, this, "ptr", _hIMCC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {Pointer<Void>} 
     */
    LockIMCC(_hIMCC) {
        _hIMCC := _hIMCC is Win32Handle ? NumGet(_hIMCC, "ptr") : _hIMCC

        result := ComCall(66, this, "ptr", _hIMCC, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {HRESULT} 
     */
    UnlockIMCC(_hIMCC) {
        _hIMCC := _hIMCC is Win32Handle ? NumGet(_hIMCC, "ptr") : _hIMCC

        result := ComCall(67, this, "ptr", _hIMCC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @param {Integer} dwSize 
     * @returns {HIMCC} 
     */
    ReSizeIMCC(_hIMCC, dwSize) {
        _hIMCC := _hIMCC is Win32Handle ? NumGet(_hIMCC, "ptr") : _hIMCC

        phIMCC := HIMCC()
        result := ComCall(68, this, "ptr", _hIMCC, "uint", dwSize, "ptr", phIMCC, "HRESULT")
        return phIMCC
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {Integer} 
     */
    GetIMCCSize(_hIMCC) {
        _hIMCC := _hIMCC is Win32Handle ? NumGet(_hIMCC, "ptr") : _hIMCC

        result := ComCall(69, this, "ptr", _hIMCC, "uint*", &pdwSize := 0, "HRESULT")
        return pdwSize
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {Integer} 
     */
    GetIMCCLockCount(_hIMCC) {
        _hIMCC := _hIMCC is Win32Handle ? NumGet(_hIMCC, "ptr") : _hIMCC

        result := ComCall(70, this, "ptr", _hIMCC, "uint*", &pdwLockCount := 0, "HRESULT")
        return pdwLockCount
    }

    /**
     * 
     * @param {Integer} dwHotKeyID 
     * @param {Pointer<Integer>} puModifiers 
     * @param {Pointer<Integer>} puVKey 
     * @param {Pointer<HKL>} phKL 
     * @returns {HRESULT} 
     */
    GetHotKey(dwHotKeyID, puModifiers, puVKey, phKL) {
        puModifiersMarshal := puModifiers is VarRef ? "uint*" : "ptr"
        puVKeyMarshal := puVKey is VarRef ? "uint*" : "ptr"

        result := ComCall(71, this, "uint", dwHotKeyID, puModifiersMarshal, puModifiers, puVKeyMarshal, puVKey, "ptr", phKL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwHotKeyID 
     * @param {Integer} uModifiers 
     * @param {Integer} uVKey 
     * @param {HKL} _hKL 
     * @returns {HRESULT} 
     */
    SetHotKey(dwHotKeyID, uModifiers, uVKey, _hKL) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL

        result := ComCall(72, this, "uint", dwHotKeyID, "uint", uModifiers, "uint", uVKey, "ptr", _hKL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uType 
     * @param {HWND} hOwner 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HWND} 
     */
    CreateSoftKeyboard(uType, hOwner, x, y) {
        hOwner := hOwner is Win32Handle ? NumGet(hOwner, "ptr") : hOwner

        phSoftKbdWnd := HWND()
        result := ComCall(73, this, "uint", uType, "ptr", hOwner, "int", x, "int", y, "ptr", phSoftKbdWnd, "HRESULT")
        return phSoftKbdWnd
    }

    /**
     * 
     * @param {HWND} hSoftKbdWnd 
     * @returns {HRESULT} 
     */
    DestroySoftKeyboard(hSoftKbdWnd) {
        hSoftKbdWnd := hSoftKbdWnd is Win32Handle ? NumGet(hSoftKbdWnd, "ptr") : hSoftKbdWnd

        result := ComCall(74, this, "ptr", hSoftKbdWnd, "HRESULT")
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

        result := ComCall(75, this, "ptr", hSoftKbdWnd, "int", nCmdShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @returns {Integer} 
     */
    GetCodePageA(_hKL) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL

        result := ComCall(76, this, "ptr", _hKL, "uint*", &uCodePage := 0, "HRESULT")
        return uCodePage
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @returns {Integer} 
     */
    GetLangId(_hKL) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL

        result := ComCall(77, this, "ptr", _hKL, "ushort*", &plid := 0, "HRESULT")
        return plid
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
        result := ComCall(78, this, "ushort", lgidIME, "char", bVk, "char", bScan, "uint", dwFlags, "uint", dwExtraInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LockModal() {
        result := ComCall(79, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockModal() {
        result := ComCall(80, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AssociateContextEx(_hWnd, _hIMC, dwFlags) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(81, this, "ptr", _hWnd, "ptr", _hIMC, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idThread 
     * @returns {HRESULT} 
     */
    DisableIME(idThread) {
        result := ComCall(82, this, "uint", idThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwFlags 
     * @param {Integer} dwType 
     * @param {Pointer<IMEMENUITEMINFOA>} pImeParentMenu 
     * @param {Pointer<IMEMENUITEMINFOA>} pImeMenu 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    GetImeMenuItemsA(_hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, "ptr", _hIMC, "uint", dwFlags, "uint", dwType, "ptr", pImeParentMenu, "ptr", pImeMenu, "uint", dwSize, pdwResultMarshal, pdwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwFlags 
     * @param {Integer} dwType 
     * @param {Pointer<IMEMENUITEMINFOW>} pImeParentMenu 
     * @param {Pointer<IMEMENUITEMINFOW>} pImeMenu 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    GetImeMenuItemsW(_hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(84, this, "ptr", _hIMC, "uint", dwFlags, "uint", dwType, "ptr", pImeParentMenu, "ptr", pImeMenu, "uint", dwSize, pdwResultMarshal, pdwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idThread 
     * @returns {IEnumInputContext} 
     */
    EnumInputContext(idThread) {
        result := ComCall(85, this, "uint", idThread, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumInputContext(ppEnum)
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {LRESULT} 
     */
    RequestMessageA(_hIMC, _wParam, _lParam) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(86, this, "ptr", _hIMC, "ptr", _wParam, "ptr", _lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {LRESULT} 
     */
    RequestMessageW(_hIMC, _wParam, _lParam) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(87, this, "ptr", _hIMC, "ptr", _wParam, "ptr", _lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Integer} uMsg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {LRESULT} 
     */
    SendIMCA(_hWnd, uMsg, _wParam, _lParam) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(88, this, "ptr", _hWnd, "uint", uMsg, "ptr", _wParam, "ptr", _lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Integer} uMsg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {LRESULT} 
     */
    SendIMCW(_hWnd, uMsg, _wParam, _lParam) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(89, this, "ptr", _hWnd, "uint", uMsg, "ptr", _wParam, "ptr", _lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsSleeping() {
        result := ComCall(90, this, "HRESULT")
        return result
    }
}
