#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\REGISTERWORDW.ahk" { REGISTERWORDW }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import ".\INPUTCONTEXT.ahk" { INPUTCONTEXT }
#Import ".\CANDIDATEFORM.ahk" { CANDIDATEFORM }
#Import ".\IEnumInputContext.ahk" { IEnumInputContext }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IEnumRegisterWordA.ahk" { IEnumRegisterWordA }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import ".\REGISTERWORDA.ahk" { REGISTERWORDA }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\IMEMENUITEMINFOA.ahk" { IMEMENUITEMINFOA }
#Import ".\CANDIDATELIST.ahk" { CANDIDATELIST }
#Import "..\KeyboardAndMouse\HKL.ahk" { HKL }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IMEMENUITEMINFOW.ahk" { IMEMENUITEMINFOW }
#Import ".\IEnumRegisterWordW.ahk" { IEnumRegisterWordW }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\HIMC.ahk" { HIMC }
#Import ".\HIMCC.ahk" { HIMCC }
#Import ".\COMPOSITIONFORM.ahk" { COMPOSITIONFORM }
#Import "..\..\..\Graphics\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\STYLEBUFA.ahk" { STYLEBUFA }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\STYLEBUFW.ahk" { STYLEBUFW }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\..\Graphics\Gdi\LOGFONTA.ahk" { LOGFONTA }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IActiveIMMIME extends IUnknown {
    /**
     * The interface identifier for IActiveIMMIME
     * @type {Guid}
     */
    static IID := Guid("{08c03411-f96b-11d0-a475-00aa006bcc59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveIMMIME interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AssociateContext       : IntPtr
        ConfigureIMEA          : IntPtr
        ConfigureIMEW          : IntPtr
        CreateContext          : IntPtr
        DestroyContext         : IntPtr
        EnumRegisterWordA      : IntPtr
        EnumRegisterWordW      : IntPtr
        EscapeA                : IntPtr
        EscapeW                : IntPtr
        GetCandidateListA      : IntPtr
        GetCandidateListW      : IntPtr
        GetCandidateListCountA : IntPtr
        GetCandidateListCountW : IntPtr
        GetCandidateWindow     : IntPtr
        GetCompositionFontA    : IntPtr
        GetCompositionFontW    : IntPtr
        GetCompositionStringA  : IntPtr
        GetCompositionStringW  : IntPtr
        GetCompositionWindow   : IntPtr
        GetContext             : IntPtr
        GetConversionListA     : IntPtr
        GetConversionListW     : IntPtr
        GetConversionStatus    : IntPtr
        GetDefaultIMEWnd       : IntPtr
        GetDescriptionA        : IntPtr
        GetDescriptionW        : IntPtr
        GetGuideLineA          : IntPtr
        GetGuideLineW          : IntPtr
        GetIMEFileNameA        : IntPtr
        GetIMEFileNameW        : IntPtr
        GetOpenStatus          : IntPtr
        GetProperty            : IntPtr
        GetRegisterWordStyleA  : IntPtr
        GetRegisterWordStyleW  : IntPtr
        GetStatusWindowPos     : IntPtr
        GetVirtualKey          : IntPtr
        InstallIMEA            : IntPtr
        InstallIMEW            : IntPtr
        IsIME                  : IntPtr
        IsUIMessageA           : IntPtr
        IsUIMessageW           : IntPtr
        NotifyIME              : IntPtr
        RegisterWordA          : IntPtr
        RegisterWordW          : IntPtr
        ReleaseContext         : IntPtr
        SetCandidateWindow     : IntPtr
        SetCompositionFontA    : IntPtr
        SetCompositionFontW    : IntPtr
        SetCompositionStringA  : IntPtr
        SetCompositionStringW  : IntPtr
        SetCompositionWindow   : IntPtr
        SetConversionStatus    : IntPtr
        SetOpenStatus          : IntPtr
        SetStatusWindowPos     : IntPtr
        SimulateHotKey         : IntPtr
        UnregisterWordA        : IntPtr
        UnregisterWordW        : IntPtr
        GenerateMessage        : IntPtr
        LockIMC                : IntPtr
        UnlockIMC              : IntPtr
        GetIMCLockCount        : IntPtr
        CreateIMCC             : IntPtr
        DestroyIMCC            : IntPtr
        LockIMCC               : IntPtr
        UnlockIMCC             : IntPtr
        ReSizeIMCC             : IntPtr
        GetIMCCSize            : IntPtr
        GetIMCCLockCount       : IntPtr
        GetHotKey              : IntPtr
        SetHotKey              : IntPtr
        CreateSoftKeyboard     : IntPtr
        DestroySoftKeyboard    : IntPtr
        ShowSoftKeyboard       : IntPtr
        GetCodePageA           : IntPtr
        GetLangId              : IntPtr
        KeybdEvent             : IntPtr
        LockModal              : IntPtr
        UnlockModal            : IntPtr
        AssociateContextEx     : IntPtr
        DisableIME             : IntPtr
        GetImeMenuItemsA       : IntPtr
        GetImeMenuItemsW       : IntPtr
        EnumInputContext       : IntPtr
        RequestMessageA        : IntPtr
        RequestMessageW        : IntPtr
        SendIMCA               : IntPtr
        SendIMCW               : IntPtr
        IsSleeping             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveIMMIME.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {HIMC} hIME 
     * @returns {HIMC} 
     */
    AssociateContext(_hWnd, hIME) {
        phPrev := HIMC.Owned()
        result := ComCall(3, this, HWND, _hWnd, HIMC, hIME, HIMC.Ptr, phPrev, "HRESULT")
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
        result := ComCall(4, this, HKL, _hKL, HWND, _hWnd, "uint", dwMode, REGISTERWORDA.Ptr, pData, "HRESULT")
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
        result := ComCall(5, this, HKL, _hKL, HWND, _hWnd, "uint", dwMode, REGISTERWORDW.Ptr, pData, "HRESULT")
        return result
    }

    /**
     * Creates a recognizer context.
     * @returns {HIMC} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-createcontext
     */
    CreateContext() {
        phIMC := HIMC.Owned()
        result := ComCall(6, this, HIMC.Ptr, phIMC, "HRESULT")
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
        result := ComCall(7, this, HIMC, hIME, "HRESULT")
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
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, HKL, _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &pEnum := 0, "HRESULT")
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
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, HKL, _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &pEnum := 0, "HRESULT")
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
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, HKL, _hKL, HIMC, _hIMC, "uint", uEscape, pDataMarshal, pData, LRESULT.Ptr, &plResult := 0, "HRESULT")
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
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, HKL, _hKL, HIMC, _hIMC, "uint", uEscape, pDataMarshal, pData, LRESULT.Ptr, &plResult := 0, "HRESULT")
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
        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, HIMC, _hIMC, "uint", dwIndex, "uint", uBufLen, CANDIDATELIST.Ptr, pCandList, puCopiedMarshal, puCopied, "HRESULT")
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
        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, HIMC, _hIMC, "uint", dwIndex, "uint", uBufLen, CANDIDATELIST.Ptr, pCandList, puCopiedMarshal, puCopied, "HRESULT")
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
        pdwListSizeMarshal := pdwListSize is VarRef ? "uint*" : "ptr"
        pdwBufLenMarshal := pdwBufLen is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, HIMC, _hIMC, pdwListSizeMarshal, pdwListSize, pdwBufLenMarshal, pdwBufLen, "HRESULT")
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
        pdwListSizeMarshal := pdwListSize is VarRef ? "uint*" : "ptr"
        pdwBufLenMarshal := pdwBufLen is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, HIMC, _hIMC, pdwListSizeMarshal, pdwListSize, pdwBufLenMarshal, pdwBufLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} dwIndex 
     * @returns {CANDIDATEFORM} 
     */
    GetCandidateWindow(_hIMC, dwIndex) {
        pCandidate := CANDIDATEFORM()
        result := ComCall(16, this, HIMC, _hIMC, "uint", dwIndex, CANDIDATEFORM.Ptr, pCandidate, "HRESULT")
        return pCandidate
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {LOGFONTA} 
     */
    GetCompositionFontA(_hIMC) {
        plf := LOGFONTA()
        result := ComCall(17, this, HIMC, _hIMC, LOGFONTA.Ptr, plf, "HRESULT")
        return plf
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {LOGFONTW} 
     */
    GetCompositionFontW(_hIMC) {
        plf := LOGFONTW()
        result := ComCall(18, this, HIMC, _hIMC, LOGFONTW.Ptr, plf, "HRESULT")
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
        plCopiedMarshal := plCopied is VarRef ? "int*" : "ptr"
        pBufMarshal := pBuf is VarRef ? "ptr" : "ptr"

        result := ComCall(19, this, HIMC, _hIMC, "uint", dwIndex, "uint", dwBufLen, plCopiedMarshal, plCopied, pBufMarshal, pBuf, "HRESULT")
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
        plCopiedMarshal := plCopied is VarRef ? "int*" : "ptr"
        pBufMarshal := pBuf is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, HIMC, _hIMC, "uint", dwIndex, "uint", dwBufLen, plCopiedMarshal, plCopied, pBufMarshal, pBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {COMPOSITIONFORM} 
     */
    GetCompositionWindow(_hIMC) {
        pCompForm := COMPOSITIONFORM()
        result := ComCall(21, this, HIMC, _hIMC, COMPOSITIONFORM.Ptr, pCompForm, "HRESULT")
        return pCompForm
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @returns {HIMC} 
     */
    GetContext(_hWnd) {
        phIMC := HIMC.Owned()
        result := ComCall(22, this, HWND, _hWnd, HIMC.Ptr, phIMC, "HRESULT")
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
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, HKL, _hKL, HIMC, _hIMC, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, CANDIDATELIST.Ptr, pDst, puCopiedMarshal, puCopied, "HRESULT")
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
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, HKL, _hKL, HIMC, _hIMC, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, CANDIDATELIST.Ptr, pDst, puCopiedMarshal, puCopied, "HRESULT")
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
        pfdwConversionMarshal := pfdwConversion is VarRef ? "uint*" : "ptr"
        pfdwSentenceMarshal := pfdwSentence is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, HIMC, _hIMC, pfdwConversionMarshal, pfdwConversion, pfdwSentenceMarshal, pfdwSentence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @returns {HWND} 
     */
    GetDefaultIMEWnd(_hWnd) {
        phDefWnd := HWND()
        result := ComCall(26, this, HWND, _hWnd, HWND.Ptr, phDefWnd, "HRESULT")
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
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(27, this, HKL, _hKL, "uint", uBufLen, "ptr", szDescription, "uint*", &puCopied := 0, "HRESULT")
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
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(28, this, HKL, _hKL, "uint", uBufLen, "ptr", szDescription, "uint*", &puCopied := 0, "HRESULT")
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
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(29, this, HIMC, _hIMC, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", &pdwResult := 0, "HRESULT")
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
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(30, this, HIMC, _hIMC, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", &pdwResult := 0, "HRESULT")
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
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(31, this, HKL, _hKL, "uint", uBufLen, "ptr", szFileName, "uint*", &puCopied := 0, "HRESULT")
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
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(32, this, HKL, _hKL, "uint", uBufLen, "ptr", szFileName, "uint*", &puCopied := 0, "HRESULT")
        return puCopied
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {HRESULT} 
     */
    GetOpenStatus(_hIMC) {
        result := ComCall(33, this, HIMC, _hIMC, "HRESULT")
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
        result := ComCall(34, this, HKL, _hKL, "uint", fdwIndex, "uint*", &pdwProperty := 0, "HRESULT")
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
        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, HKL, _hKL, "uint", nItem, STYLEBUFA.Ptr, pStyleBuf, puCopiedMarshal, puCopied, "HRESULT")
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
        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, HKL, _hKL, "uint", nItem, STYLEBUFW.Ptr, pStyleBuf, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {POINT} 
     */
    GetStatusWindowPos(_hIMC) {
        pptPos := POINT()
        result := ComCall(37, this, HIMC, _hIMC, POINT.Ptr, pptPos, "HRESULT")
        return pptPos
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @returns {Integer} 
     */
    GetVirtualKey(_hWnd) {
        result := ComCall(38, this, HWND, _hWnd, "uint*", &puVirtualKey := 0, "HRESULT")
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

        phKL := HKL.Owned()
        result := ComCall(39, this, "ptr", szIMEFileName, "ptr", szLayoutText, HKL.Ptr, phKL, "HRESULT")
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

        phKL := HKL.Owned()
        result := ComCall(40, this, "ptr", szIMEFileName, "ptr", szLayoutText, HKL.Ptr, phKL, "HRESULT")
        return phKL
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @returns {HRESULT} 
     */
    IsIME(_hKL) {
        result := ComCall(41, this, HKL, _hKL, "HRESULT")
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
        result := ComCall(42, this, HWND, hWndIME, "uint", _msg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
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
        result := ComCall(43, this, HWND, hWndIME, "uint", _msg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
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
        result := ComCall(44, this, HIMC, _hIMC, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "HRESULT")
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
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(45, this, HKL, _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "HRESULT")
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
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(46, this, HKL, _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {HIMC} _hIMC 
     * @returns {HRESULT} 
     */
    ReleaseContext(_hWnd, _hIMC) {
        result := ComCall(47, this, HWND, _hWnd, HIMC, _hIMC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<CANDIDATEFORM>} pCandidate 
     * @returns {HRESULT} 
     */
    SetCandidateWindow(_hIMC, pCandidate) {
        result := ComCall(48, this, HIMC, _hIMC, CANDIDATEFORM.Ptr, pCandidate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<LOGFONTA>} plf 
     * @returns {HRESULT} 
     */
    SetCompositionFontA(_hIMC, plf) {
        result := ComCall(49, this, HIMC, _hIMC, LOGFONTA.Ptr, plf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<LOGFONTW>} plf 
     * @returns {HRESULT} 
     */
    SetCompositionFontW(_hIMC, plf) {
        result := ComCall(50, this, HIMC, _hIMC, LOGFONTW.Ptr, plf, "HRESULT")
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
        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(51, this, HIMC, _hIMC, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "HRESULT")
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
        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(52, this, HIMC, _hIMC, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<COMPOSITIONFORM>} pCompForm 
     * @returns {HRESULT} 
     */
    SetCompositionWindow(_hIMC, pCompForm) {
        result := ComCall(53, this, HIMC, _hIMC, COMPOSITIONFORM.Ptr, pCompForm, "HRESULT")
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
        result := ComCall(54, this, HIMC, _hIMC, "uint", fdwConversion, "uint", fdwSentence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {BOOL} fOpen 
     * @returns {HRESULT} 
     */
    SetOpenStatus(_hIMC, fOpen) {
        result := ComCall(55, this, HIMC, _hIMC, BOOL, fOpen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Pointer<POINT>} pptPos 
     * @returns {HRESULT} 
     */
    SetStatusWindowPos(_hIMC, pptPos) {
        result := ComCall(56, this, HIMC, _hIMC, POINT.Ptr, pptPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Integer} dwHotKeyID 
     * @returns {HRESULT} 
     */
    SimulateHotKey(_hWnd, dwHotKeyID) {
        result := ComCall(57, this, HWND, _hWnd, "uint", dwHotKeyID, "HRESULT")
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
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szUnregister := szUnregister is String ? StrPtr(szUnregister) : szUnregister

        result := ComCall(58, this, HKL, _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "HRESULT")
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
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szUnregister := szUnregister is String ? StrPtr(szUnregister) : szUnregister

        result := ComCall(59, this, HKL, _hKL, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {HRESULT} 
     */
    GenerateMessage(_hIMC) {
        result := ComCall(60, this, HIMC, _hIMC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {Pointer<INPUTCONTEXT>} 
     */
    LockIMC(_hIMC) {
        result := ComCall(61, this, HIMC, _hIMC, "ptr*", &ppIMC := 0, "HRESULT")
        return ppIMC
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {HRESULT} 
     */
    UnlockIMC(_hIMC) {
        result := ComCall(62, this, HIMC, _hIMC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @returns {Integer} 
     */
    GetIMCLockCount(_hIMC) {
        result := ComCall(63, this, HIMC, _hIMC, "uint*", &pdwLockCount := 0, "HRESULT")
        return pdwLockCount
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @returns {HIMCC} 
     */
    CreateIMCC(dwSize) {
        phIMCC := HIMCC()
        result := ComCall(64, this, "uint", dwSize, HIMCC.Ptr, phIMCC, "HRESULT")
        return phIMCC
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {HRESULT} 
     */
    DestroyIMCC(_hIMCC) {
        result := ComCall(65, this, HIMCC, _hIMCC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {Pointer<Void>} 
     */
    LockIMCC(_hIMCC) {
        result := ComCall(66, this, HIMCC, _hIMCC, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {HRESULT} 
     */
    UnlockIMCC(_hIMCC) {
        result := ComCall(67, this, HIMCC, _hIMCC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @param {Integer} dwSize 
     * @returns {HIMCC} 
     */
    ReSizeIMCC(_hIMCC, dwSize) {
        phIMCC := HIMCC()
        result := ComCall(68, this, HIMCC, _hIMCC, "uint", dwSize, HIMCC.Ptr, phIMCC, "HRESULT")
        return phIMCC
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {Integer} 
     */
    GetIMCCSize(_hIMCC) {
        result := ComCall(69, this, HIMCC, _hIMCC, "uint*", &pdwSize := 0, "HRESULT")
        return pdwSize
    }

    /**
     * 
     * @param {HIMCC} _hIMCC 
     * @returns {Integer} 
     */
    GetIMCCLockCount(_hIMCC) {
        result := ComCall(70, this, HIMCC, _hIMCC, "uint*", &pdwLockCount := 0, "HRESULT")
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

        result := ComCall(71, this, "uint", dwHotKeyID, puModifiersMarshal, puModifiers, puVKeyMarshal, puVKey, HKL.Ptr, phKL, "HRESULT")
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
        result := ComCall(72, this, "uint", dwHotKeyID, "uint", uModifiers, "uint", uVKey, HKL, _hKL, "HRESULT")
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
        phSoftKbdWnd := HWND()
        result := ComCall(73, this, "uint", uType, HWND, hOwner, "int", x, "int", y, HWND.Ptr, phSoftKbdWnd, "HRESULT")
        return phSoftKbdWnd
    }

    /**
     * 
     * @param {HWND} hSoftKbdWnd 
     * @returns {HRESULT} 
     */
    DestroySoftKeyboard(hSoftKbdWnd) {
        result := ComCall(74, this, HWND, hSoftKbdWnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hSoftKbdWnd 
     * @param {Integer} nCmdShow 
     * @returns {HRESULT} 
     */
    ShowSoftKeyboard(hSoftKbdWnd, nCmdShow) {
        result := ComCall(75, this, HWND, hSoftKbdWnd, "int", nCmdShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @returns {Integer} 
     */
    GetCodePageA(_hKL) {
        result := ComCall(76, this, HKL, _hKL, "uint*", &uCodePage := 0, "HRESULT")
        return uCodePage
    }

    /**
     * 
     * @param {HKL} _hKL 
     * @returns {Integer} 
     */
    GetLangId(_hKL) {
        result := ComCall(77, this, HKL, _hKL, "ushort*", &plid := 0, "HRESULT")
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
        result := ComCall(81, this, HWND, _hWnd, HIMC, _hIMC, "uint", dwFlags, "HRESULT")
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
        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, HIMC, _hIMC, "uint", dwFlags, "uint", dwType, IMEMENUITEMINFOA.Ptr, pImeParentMenu, IMEMENUITEMINFOA.Ptr, pImeMenu, "uint", dwSize, pdwResultMarshal, pdwResult, "HRESULT")
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
        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(84, this, HIMC, _hIMC, "uint", dwFlags, "uint", dwType, IMEMENUITEMINFOW.Ptr, pImeParentMenu, IMEMENUITEMINFOW.Ptr, pImeMenu, "uint", dwSize, pdwResultMarshal, pdwResult, "HRESULT")
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
        result := ComCall(86, this, HIMC, _hIMC, WPARAM, _wParam, LPARAM, _lParam, LRESULT.Ptr, &plResult := 0, "HRESULT")
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
        result := ComCall(87, this, HIMC, _hIMC, WPARAM, _wParam, LPARAM, _lParam, LRESULT.Ptr, &plResult := 0, "HRESULT")
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
        result := ComCall(88, this, HWND, _hWnd, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, LRESULT.Ptr, &plResult := 0, "HRESULT")
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
        result := ComCall(89, this, HWND, _hWnd, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, LRESULT.Ptr, &plResult := 0, "HRESULT")
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

    Query(iid) {
        if (IActiveIMMIME.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssociateContext := CallbackCreate(GetMethod(implObj, "AssociateContext"), flags, 4)
        this.vtbl.ConfigureIMEA := CallbackCreate(GetMethod(implObj, "ConfigureIMEA"), flags, 5)
        this.vtbl.ConfigureIMEW := CallbackCreate(GetMethod(implObj, "ConfigureIMEW"), flags, 5)
        this.vtbl.CreateContext := CallbackCreate(GetMethod(implObj, "CreateContext"), flags, 2)
        this.vtbl.DestroyContext := CallbackCreate(GetMethod(implObj, "DestroyContext"), flags, 2)
        this.vtbl.EnumRegisterWordA := CallbackCreate(GetMethod(implObj, "EnumRegisterWordA"), flags, 7)
        this.vtbl.EnumRegisterWordW := CallbackCreate(GetMethod(implObj, "EnumRegisterWordW"), flags, 7)
        this.vtbl.EscapeA := CallbackCreate(GetMethod(implObj, "EscapeA"), flags, 6)
        this.vtbl.EscapeW := CallbackCreate(GetMethod(implObj, "EscapeW"), flags, 6)
        this.vtbl.GetCandidateListA := CallbackCreate(GetMethod(implObj, "GetCandidateListA"), flags, 6)
        this.vtbl.GetCandidateListW := CallbackCreate(GetMethod(implObj, "GetCandidateListW"), flags, 6)
        this.vtbl.GetCandidateListCountA := CallbackCreate(GetMethod(implObj, "GetCandidateListCountA"), flags, 4)
        this.vtbl.GetCandidateListCountW := CallbackCreate(GetMethod(implObj, "GetCandidateListCountW"), flags, 4)
        this.vtbl.GetCandidateWindow := CallbackCreate(GetMethod(implObj, "GetCandidateWindow"), flags, 4)
        this.vtbl.GetCompositionFontA := CallbackCreate(GetMethod(implObj, "GetCompositionFontA"), flags, 3)
        this.vtbl.GetCompositionFontW := CallbackCreate(GetMethod(implObj, "GetCompositionFontW"), flags, 3)
        this.vtbl.GetCompositionStringA := CallbackCreate(GetMethod(implObj, "GetCompositionStringA"), flags, 6)
        this.vtbl.GetCompositionStringW := CallbackCreate(GetMethod(implObj, "GetCompositionStringW"), flags, 6)
        this.vtbl.GetCompositionWindow := CallbackCreate(GetMethod(implObj, "GetCompositionWindow"), flags, 3)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 3)
        this.vtbl.GetConversionListA := CallbackCreate(GetMethod(implObj, "GetConversionListA"), flags, 8)
        this.vtbl.GetConversionListW := CallbackCreate(GetMethod(implObj, "GetConversionListW"), flags, 8)
        this.vtbl.GetConversionStatus := CallbackCreate(GetMethod(implObj, "GetConversionStatus"), flags, 4)
        this.vtbl.GetDefaultIMEWnd := CallbackCreate(GetMethod(implObj, "GetDefaultIMEWnd"), flags, 3)
        this.vtbl.GetDescriptionA := CallbackCreate(GetMethod(implObj, "GetDescriptionA"), flags, 5)
        this.vtbl.GetDescriptionW := CallbackCreate(GetMethod(implObj, "GetDescriptionW"), flags, 5)
        this.vtbl.GetGuideLineA := CallbackCreate(GetMethod(implObj, "GetGuideLineA"), flags, 6)
        this.vtbl.GetGuideLineW := CallbackCreate(GetMethod(implObj, "GetGuideLineW"), flags, 6)
        this.vtbl.GetIMEFileNameA := CallbackCreate(GetMethod(implObj, "GetIMEFileNameA"), flags, 5)
        this.vtbl.GetIMEFileNameW := CallbackCreate(GetMethod(implObj, "GetIMEFileNameW"), flags, 5)
        this.vtbl.GetOpenStatus := CallbackCreate(GetMethod(implObj, "GetOpenStatus"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
        this.vtbl.GetRegisterWordStyleA := CallbackCreate(GetMethod(implObj, "GetRegisterWordStyleA"), flags, 5)
        this.vtbl.GetRegisterWordStyleW := CallbackCreate(GetMethod(implObj, "GetRegisterWordStyleW"), flags, 5)
        this.vtbl.GetStatusWindowPos := CallbackCreate(GetMethod(implObj, "GetStatusWindowPos"), flags, 3)
        this.vtbl.GetVirtualKey := CallbackCreate(GetMethod(implObj, "GetVirtualKey"), flags, 3)
        this.vtbl.InstallIMEA := CallbackCreate(GetMethod(implObj, "InstallIMEA"), flags, 4)
        this.vtbl.InstallIMEW := CallbackCreate(GetMethod(implObj, "InstallIMEW"), flags, 4)
        this.vtbl.IsIME := CallbackCreate(GetMethod(implObj, "IsIME"), flags, 2)
        this.vtbl.IsUIMessageA := CallbackCreate(GetMethod(implObj, "IsUIMessageA"), flags, 5)
        this.vtbl.IsUIMessageW := CallbackCreate(GetMethod(implObj, "IsUIMessageW"), flags, 5)
        this.vtbl.NotifyIME := CallbackCreate(GetMethod(implObj, "NotifyIME"), flags, 5)
        this.vtbl.RegisterWordA := CallbackCreate(GetMethod(implObj, "RegisterWordA"), flags, 5)
        this.vtbl.RegisterWordW := CallbackCreate(GetMethod(implObj, "RegisterWordW"), flags, 5)
        this.vtbl.ReleaseContext := CallbackCreate(GetMethod(implObj, "ReleaseContext"), flags, 3)
        this.vtbl.SetCandidateWindow := CallbackCreate(GetMethod(implObj, "SetCandidateWindow"), flags, 3)
        this.vtbl.SetCompositionFontA := CallbackCreate(GetMethod(implObj, "SetCompositionFontA"), flags, 3)
        this.vtbl.SetCompositionFontW := CallbackCreate(GetMethod(implObj, "SetCompositionFontW"), flags, 3)
        this.vtbl.SetCompositionStringA := CallbackCreate(GetMethod(implObj, "SetCompositionStringA"), flags, 7)
        this.vtbl.SetCompositionStringW := CallbackCreate(GetMethod(implObj, "SetCompositionStringW"), flags, 7)
        this.vtbl.SetCompositionWindow := CallbackCreate(GetMethod(implObj, "SetCompositionWindow"), flags, 3)
        this.vtbl.SetConversionStatus := CallbackCreate(GetMethod(implObj, "SetConversionStatus"), flags, 4)
        this.vtbl.SetOpenStatus := CallbackCreate(GetMethod(implObj, "SetOpenStatus"), flags, 3)
        this.vtbl.SetStatusWindowPos := CallbackCreate(GetMethod(implObj, "SetStatusWindowPos"), flags, 3)
        this.vtbl.SimulateHotKey := CallbackCreate(GetMethod(implObj, "SimulateHotKey"), flags, 3)
        this.vtbl.UnregisterWordA := CallbackCreate(GetMethod(implObj, "UnregisterWordA"), flags, 5)
        this.vtbl.UnregisterWordW := CallbackCreate(GetMethod(implObj, "UnregisterWordW"), flags, 5)
        this.vtbl.GenerateMessage := CallbackCreate(GetMethod(implObj, "GenerateMessage"), flags, 2)
        this.vtbl.LockIMC := CallbackCreate(GetMethod(implObj, "LockIMC"), flags, 3)
        this.vtbl.UnlockIMC := CallbackCreate(GetMethod(implObj, "UnlockIMC"), flags, 2)
        this.vtbl.GetIMCLockCount := CallbackCreate(GetMethod(implObj, "GetIMCLockCount"), flags, 3)
        this.vtbl.CreateIMCC := CallbackCreate(GetMethod(implObj, "CreateIMCC"), flags, 3)
        this.vtbl.DestroyIMCC := CallbackCreate(GetMethod(implObj, "DestroyIMCC"), flags, 2)
        this.vtbl.LockIMCC := CallbackCreate(GetMethod(implObj, "LockIMCC"), flags, 3)
        this.vtbl.UnlockIMCC := CallbackCreate(GetMethod(implObj, "UnlockIMCC"), flags, 2)
        this.vtbl.ReSizeIMCC := CallbackCreate(GetMethod(implObj, "ReSizeIMCC"), flags, 4)
        this.vtbl.GetIMCCSize := CallbackCreate(GetMethod(implObj, "GetIMCCSize"), flags, 3)
        this.vtbl.GetIMCCLockCount := CallbackCreate(GetMethod(implObj, "GetIMCCLockCount"), flags, 3)
        this.vtbl.GetHotKey := CallbackCreate(GetMethod(implObj, "GetHotKey"), flags, 5)
        this.vtbl.SetHotKey := CallbackCreate(GetMethod(implObj, "SetHotKey"), flags, 5)
        this.vtbl.CreateSoftKeyboard := CallbackCreate(GetMethod(implObj, "CreateSoftKeyboard"), flags, 6)
        this.vtbl.DestroySoftKeyboard := CallbackCreate(GetMethod(implObj, "DestroySoftKeyboard"), flags, 2)
        this.vtbl.ShowSoftKeyboard := CallbackCreate(GetMethod(implObj, "ShowSoftKeyboard"), flags, 3)
        this.vtbl.GetCodePageA := CallbackCreate(GetMethod(implObj, "GetCodePageA"), flags, 3)
        this.vtbl.GetLangId := CallbackCreate(GetMethod(implObj, "GetLangId"), flags, 3)
        this.vtbl.KeybdEvent := CallbackCreate(GetMethod(implObj, "KeybdEvent"), flags, 6)
        this.vtbl.LockModal := CallbackCreate(GetMethod(implObj, "LockModal"), flags, 1)
        this.vtbl.UnlockModal := CallbackCreate(GetMethod(implObj, "UnlockModal"), flags, 1)
        this.vtbl.AssociateContextEx := CallbackCreate(GetMethod(implObj, "AssociateContextEx"), flags, 4)
        this.vtbl.DisableIME := CallbackCreate(GetMethod(implObj, "DisableIME"), flags, 2)
        this.vtbl.GetImeMenuItemsA := CallbackCreate(GetMethod(implObj, "GetImeMenuItemsA"), flags, 8)
        this.vtbl.GetImeMenuItemsW := CallbackCreate(GetMethod(implObj, "GetImeMenuItemsW"), flags, 8)
        this.vtbl.EnumInputContext := CallbackCreate(GetMethod(implObj, "EnumInputContext"), flags, 3)
        this.vtbl.RequestMessageA := CallbackCreate(GetMethod(implObj, "RequestMessageA"), flags, 5)
        this.vtbl.RequestMessageW := CallbackCreate(GetMethod(implObj, "RequestMessageW"), flags, 5)
        this.vtbl.SendIMCA := CallbackCreate(GetMethod(implObj, "SendIMCA"), flags, 6)
        this.vtbl.SendIMCW := CallbackCreate(GetMethod(implObj, "SendIMCW"), flags, 6)
        this.vtbl.IsSleeping := CallbackCreate(GetMethod(implObj, "IsSleeping"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssociateContext)
        CallbackFree(this.vtbl.ConfigureIMEA)
        CallbackFree(this.vtbl.ConfigureIMEW)
        CallbackFree(this.vtbl.CreateContext)
        CallbackFree(this.vtbl.DestroyContext)
        CallbackFree(this.vtbl.EnumRegisterWordA)
        CallbackFree(this.vtbl.EnumRegisterWordW)
        CallbackFree(this.vtbl.EscapeA)
        CallbackFree(this.vtbl.EscapeW)
        CallbackFree(this.vtbl.GetCandidateListA)
        CallbackFree(this.vtbl.GetCandidateListW)
        CallbackFree(this.vtbl.GetCandidateListCountA)
        CallbackFree(this.vtbl.GetCandidateListCountW)
        CallbackFree(this.vtbl.GetCandidateWindow)
        CallbackFree(this.vtbl.GetCompositionFontA)
        CallbackFree(this.vtbl.GetCompositionFontW)
        CallbackFree(this.vtbl.GetCompositionStringA)
        CallbackFree(this.vtbl.GetCompositionStringW)
        CallbackFree(this.vtbl.GetCompositionWindow)
        CallbackFree(this.vtbl.GetContext)
        CallbackFree(this.vtbl.GetConversionListA)
        CallbackFree(this.vtbl.GetConversionListW)
        CallbackFree(this.vtbl.GetConversionStatus)
        CallbackFree(this.vtbl.GetDefaultIMEWnd)
        CallbackFree(this.vtbl.GetDescriptionA)
        CallbackFree(this.vtbl.GetDescriptionW)
        CallbackFree(this.vtbl.GetGuideLineA)
        CallbackFree(this.vtbl.GetGuideLineW)
        CallbackFree(this.vtbl.GetIMEFileNameA)
        CallbackFree(this.vtbl.GetIMEFileNameW)
        CallbackFree(this.vtbl.GetOpenStatus)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.GetRegisterWordStyleA)
        CallbackFree(this.vtbl.GetRegisterWordStyleW)
        CallbackFree(this.vtbl.GetStatusWindowPos)
        CallbackFree(this.vtbl.GetVirtualKey)
        CallbackFree(this.vtbl.InstallIMEA)
        CallbackFree(this.vtbl.InstallIMEW)
        CallbackFree(this.vtbl.IsIME)
        CallbackFree(this.vtbl.IsUIMessageA)
        CallbackFree(this.vtbl.IsUIMessageW)
        CallbackFree(this.vtbl.NotifyIME)
        CallbackFree(this.vtbl.RegisterWordA)
        CallbackFree(this.vtbl.RegisterWordW)
        CallbackFree(this.vtbl.ReleaseContext)
        CallbackFree(this.vtbl.SetCandidateWindow)
        CallbackFree(this.vtbl.SetCompositionFontA)
        CallbackFree(this.vtbl.SetCompositionFontW)
        CallbackFree(this.vtbl.SetCompositionStringA)
        CallbackFree(this.vtbl.SetCompositionStringW)
        CallbackFree(this.vtbl.SetCompositionWindow)
        CallbackFree(this.vtbl.SetConversionStatus)
        CallbackFree(this.vtbl.SetOpenStatus)
        CallbackFree(this.vtbl.SetStatusWindowPos)
        CallbackFree(this.vtbl.SimulateHotKey)
        CallbackFree(this.vtbl.UnregisterWordA)
        CallbackFree(this.vtbl.UnregisterWordW)
        CallbackFree(this.vtbl.GenerateMessage)
        CallbackFree(this.vtbl.LockIMC)
        CallbackFree(this.vtbl.UnlockIMC)
        CallbackFree(this.vtbl.GetIMCLockCount)
        CallbackFree(this.vtbl.CreateIMCC)
        CallbackFree(this.vtbl.DestroyIMCC)
        CallbackFree(this.vtbl.LockIMCC)
        CallbackFree(this.vtbl.UnlockIMCC)
        CallbackFree(this.vtbl.ReSizeIMCC)
        CallbackFree(this.vtbl.GetIMCCSize)
        CallbackFree(this.vtbl.GetIMCCLockCount)
        CallbackFree(this.vtbl.GetHotKey)
        CallbackFree(this.vtbl.SetHotKey)
        CallbackFree(this.vtbl.CreateSoftKeyboard)
        CallbackFree(this.vtbl.DestroySoftKeyboard)
        CallbackFree(this.vtbl.ShowSoftKeyboard)
        CallbackFree(this.vtbl.GetCodePageA)
        CallbackFree(this.vtbl.GetLangId)
        CallbackFree(this.vtbl.KeybdEvent)
        CallbackFree(this.vtbl.LockModal)
        CallbackFree(this.vtbl.UnlockModal)
        CallbackFree(this.vtbl.AssociateContextEx)
        CallbackFree(this.vtbl.DisableIME)
        CallbackFree(this.vtbl.GetImeMenuItemsA)
        CallbackFree(this.vtbl.GetImeMenuItemsW)
        CallbackFree(this.vtbl.EnumInputContext)
        CallbackFree(this.vtbl.RequestMessageA)
        CallbackFree(this.vtbl.RequestMessageW)
        CallbackFree(this.vtbl.SendIMCA)
        CallbackFree(this.vtbl.SendIMCW)
        CallbackFree(this.vtbl.IsSleeping)
    }
}
