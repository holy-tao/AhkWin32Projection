#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\HIMC.ahk
#Include .\IEnumRegisterWordA.ahk
#Include .\IEnumRegisterWordW.ahk
#Include ..\..\..\Foundation\LRESULT.ahk
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
     * Inserts a name into the name cache to find a specified FIO_CONTEXT structure.
     * @remarks
     * If the name is already present in the cache, this call fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_DUP_NAME.
     * @param {HWND} hWnd_ 
     * @param {HIMC} hIME 
     * @returns {HIMC} 
     * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nf-filehc-associatecontextwithname
     */
    AssociateContext(hWnd_, hIME) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        hIME := hIME is Win32Handle ? NumGet(hIME, "ptr") : hIME

        phPrev := HIMC()
        result := ComCall(3, this, "ptr", hWnd_, "ptr", hIME, "ptr", phPrev, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPrev
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {HWND} hWnd_ 
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDA>} pData 
     * @returns {HRESULT} 
     */
    ConfigureIMEA(hKL_, hWnd_, dwMode, pData) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        result := ComCall(4, this, "ptr", hKL_, "ptr", hWnd_, "uint", dwMode, "ptr", pData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {HWND} hWnd_ 
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDW>} pData 
     * @returns {HRESULT} 
     */
    ConfigureIMEW(hKL_, hWnd_, dwMode, pData) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        result := ComCall(5, this, "ptr", hKL_, "ptr", hWnd_, "uint", dwMode, "ptr", pData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a recognizer context.
     * @returns {HIMC} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-createcontext
     */
    CreateContext() {
        phIMC := HIMC()
        result := ComCall(6, this, "ptr", phIMC, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-destroycontext
     */
    DestroyContext(hIME) {
        hIME := hIME is Win32Handle ? NumGet(hIME, "ptr") : hIME

        result := ComCall(7, this, "ptr", hIME, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @returns {IEnumRegisterWordA} 
     */
    EnumRegisterWordA(hKL_, szReading, dwStyle, szRegister, pData) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", hKL_, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &pEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumRegisterWordA(pEnum)
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @returns {IEnumRegisterWordW} 
     */
    EnumRegisterWordW(hKL_, szReading, dwStyle, szRegister, pData) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "ptr", hKL_, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &pEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumRegisterWordW(pEnum)
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {HIMC} hIMC_ 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @returns {LRESULT} 
     */
    EscapeA(hKL_, hIMC_, uEscape, pData) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        plResult := LRESULT()
        result := ComCall(10, this, "ptr", hKL_, "ptr", hIMC_, "uint", uEscape, pDataMarshal, pData, "ptr", plResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plResult
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {HIMC} hIMC_ 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @returns {LRESULT} 
     */
    EscapeW(hKL_, hIMC_, uEscape, pData) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        plResult := LRESULT()
        result := ComCall(11, this, "ptr", hKL_, "ptr", hIMC_, "uint", uEscape, pDataMarshal, pData, "ptr", plResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plResult
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pCandList 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetCandidateListA(hIMC_, dwIndex, uBufLen, pCandList, puCopied) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", hIMC_, "uint", dwIndex, "uint", uBufLen, "ptr", pCandList, puCopiedMarshal, puCopied, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pCandList 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetCandidateListW(hIMC_, dwIndex, uBufLen, pCandList, puCopied) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", hIMC_, "uint", dwIndex, "uint", uBufLen, "ptr", pCandList, puCopiedMarshal, puCopied, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Pointer<Integer>} pdwListSize 
     * @param {Pointer<Integer>} pdwBufLen 
     * @returns {HRESULT} 
     */
    GetCandidateListCountA(hIMC_, pdwListSize, pdwBufLen) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pdwListSizeMarshal := pdwListSize is VarRef ? "uint*" : "ptr"
        pdwBufLenMarshal := pdwBufLen is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", hIMC_, pdwListSizeMarshal, pdwListSize, pdwBufLenMarshal, pdwBufLen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Pointer<Integer>} pdwListSize 
     * @param {Pointer<Integer>} pdwBufLen 
     * @returns {HRESULT} 
     */
    GetCandidateListCountW(hIMC_, pdwListSize, pdwBufLen) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pdwListSizeMarshal := pdwListSize is VarRef ? "uint*" : "ptr"
        pdwBufLenMarshal := pdwBufLen is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", hIMC_, pdwListSizeMarshal, pdwListSize, pdwBufLenMarshal, pdwBufLen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @returns {CANDIDATEFORM} 
     */
    GetCandidateWindow(hIMC_, dwIndex) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pCandidate := CANDIDATEFORM()
        result := ComCall(16, this, "ptr", hIMC_, "uint", dwIndex, "ptr", pCandidate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCandidate
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @returns {LOGFONTA} 
     */
    GetCompositionFontA(hIMC_) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        plf := LOGFONTA()
        result := ComCall(17, this, "ptr", hIMC_, "ptr", plf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plf
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @returns {LOGFONTW} 
     */
    GetCompositionFontW(hIMC_) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        plf := LOGFONTW()
        result := ComCall(18, this, "ptr", hIMC_, "ptr", plf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plf
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {Pointer<Integer>} plCopied 
     * @param {Pointer<Void>} pBuf 
     * @returns {HRESULT} 
     */
    GetCompositionStringA(hIMC_, dwIndex, dwBufLen, plCopied, pBuf) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        plCopiedMarshal := plCopied is VarRef ? "int*" : "ptr"
        pBufMarshal := pBuf is VarRef ? "ptr" : "ptr"

        result := ComCall(19, this, "ptr", hIMC_, "uint", dwIndex, "uint", dwBufLen, plCopiedMarshal, plCopied, pBufMarshal, pBuf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {Pointer<Integer>} plCopied 
     * @param {Pointer<Void>} pBuf 
     * @returns {HRESULT} 
     */
    GetCompositionStringW(hIMC_, dwIndex, dwBufLen, plCopied, pBuf) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        plCopiedMarshal := plCopied is VarRef ? "int*" : "ptr"
        pBufMarshal := pBuf is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, "ptr", hIMC_, "uint", dwIndex, "uint", dwBufLen, plCopiedMarshal, plCopied, pBufMarshal, pBuf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @returns {COMPOSITIONFORM} 
     */
    GetCompositionWindow(hIMC_) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pCompForm := COMPOSITIONFORM()
        result := ComCall(21, this, "ptr", hIMC_, "ptr", pCompForm, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCompForm
    }

    /**
     * Gets the context preference flags.
     * @param {HWND} hWnd_ 
     * @returns {HIMC} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-getcontextpreferenceflags
     */
    GetContext(hWnd_) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        phIMC := HIMC()
        result := ComCall(22, this, "ptr", hWnd_, "ptr", phIMC, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phIMC
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {HIMC} hIMC_ 
     * @param {PSTR} pSrc 
     * @param {Integer} uBufLen 
     * @param {Integer} uFlag 
     * @param {Pointer<CANDIDATELIST>} pDst 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetConversionListA(hKL_, hIMC_, pSrc, uBufLen, uFlag, pDst, puCopied) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", hKL_, "ptr", hIMC_, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, "ptr", pDst, puCopiedMarshal, puCopied, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {HIMC} hIMC_ 
     * @param {PWSTR} pSrc 
     * @param {Integer} uBufLen 
     * @param {Integer} uFlag 
     * @param {Pointer<CANDIDATELIST>} pDst 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetConversionListW(hKL_, hIMC_, pSrc, uBufLen, uFlag, pDst, puCopied) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_
        pSrc := pSrc is String ? StrPtr(pSrc) : pSrc

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "ptr", hKL_, "ptr", hIMC_, "ptr", pSrc, "uint", uBufLen, "uint", uFlag, "ptr", pDst, puCopiedMarshal, puCopied, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates the status of the encryption or decryption on the volume.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {HIMC} hIMC_ 
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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/getconversionstatus-win32-encryptablevolume
     */
    GetConversionStatus(hIMC_, pfdwConversion, pfdwSentence) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pfdwConversionMarshal := pfdwConversion is VarRef ? "uint*" : "ptr"
        pfdwSentenceMarshal := pfdwSentence is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "ptr", hIMC_, pfdwConversionMarshal, pfdwConversion, pfdwSentenceMarshal, pfdwSentence, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hWnd_ 
     * @returns {HWND} 
     */
    GetDefaultIMEWnd(hWnd_) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        phDefWnd := HWND()
        result := ComCall(26, this, "ptr", hWnd_, "ptr", phDefWnd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phDefWnd
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {Integer} uBufLen 
     * @param {PSTR} szDescription 
     * @returns {Integer} 
     */
    GetDescriptionA(hKL_, uBufLen, szDescription) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(27, this, "ptr", hKL_, "uint", uBufLen, "ptr", szDescription, "uint*", &puCopied := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puCopied
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {Integer} uBufLen 
     * @param {PWSTR} szDescription 
     * @returns {Integer} 
     */
    GetDescriptionW(hKL_, uBufLen, szDescription) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(28, this, "ptr", hKL_, "uint", uBufLen, "ptr", szDescription, "uint*", &puCopied := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puCopied
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {PSTR} pBuf 
     * @returns {Integer} 
     */
    GetGuideLineA(hIMC_, dwIndex, dwBufLen, pBuf) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(29, this, "ptr", hIMC_, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", &pdwResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwResult
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @param {Integer} dwBufLen 
     * @param {PWSTR} pBuf 
     * @returns {Integer} 
     */
    GetGuideLineW(hIMC_, dwIndex, dwBufLen, pBuf) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_
        pBuf := pBuf is String ? StrPtr(pBuf) : pBuf

        result := ComCall(30, this, "ptr", hIMC_, "uint", dwIndex, "uint", dwBufLen, "ptr", pBuf, "uint*", &pdwResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwResult
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {Integer} uBufLen 
     * @param {PSTR} szFileName 
     * @returns {Integer} 
     */
    GetIMEFileNameA(hKL_, uBufLen, szFileName) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(31, this, "ptr", hKL_, "uint", uBufLen, "ptr", szFileName, "uint*", &puCopied := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puCopied
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {Integer} uBufLen 
     * @param {PWSTR} szFileName 
     * @returns {Integer} 
     */
    GetIMEFileNameW(hKL_, uBufLen, szFileName) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(32, this, "ptr", hKL_, "uint", uBufLen, "ptr", szFileName, "uint*", &puCopied := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puCopied
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @returns {HRESULT} 
     */
    GetOpenStatus(hIMC_) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(33, this, "ptr", hIMC_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {HKL} hKL_ 
     * @param {Integer} fdwIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/getproperty
     */
    GetProperty(hKL_, fdwIndex) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_

        result := ComCall(34, this, "ptr", hKL_, "uint", fdwIndex, "uint*", &pdwProperty := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwProperty
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFA>} pStyleBuf 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyleA(hKL_, nItem, pStyleBuf, puCopied) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, "ptr", hKL_, "uint", nItem, "ptr", pStyleBuf, puCopiedMarshal, puCopied, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFW>} pStyleBuf 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyleW(hKL_, nItem, pStyleBuf, puCopied) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, "ptr", hKL_, "uint", nItem, "ptr", pStyleBuf, puCopiedMarshal, puCopied, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @returns {POINT} 
     */
    GetStatusWindowPos(hIMC_) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pptPos := POINT()
        result := ComCall(37, this, "ptr", hIMC_, "ptr", pptPos, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pptPos
    }

    /**
     * 
     * @param {HWND} hWnd_ 
     * @returns {Integer} 
     */
    GetVirtualKey(hWnd_) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        result := ComCall(38, this, "ptr", hWnd_, "uint*", &puVirtualKey := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(39, this, "ptr", szIMEFileName, "ptr", szLayoutText, "ptr", phKL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(40, this, "ptr", szIMEFileName, "ptr", szLayoutText, "ptr", phKL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phKL
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @returns {HRESULT} 
     */
    IsIME(hKL_) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_

        result := ComCall(41, this, "ptr", hKL_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hWndIME 
     * @param {Integer} msg_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {HRESULT} 
     */
    IsUIMessageA(hWndIME, msg_, wParam_, lParam_) {
        hWndIME := hWndIME is Win32Handle ? NumGet(hWndIME, "ptr") : hWndIME
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(42, this, "ptr", hWndIME, "uint", msg_, "ptr", wParam_, "ptr", lParam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hWndIME 
     * @param {Integer} msg_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {HRESULT} 
     */
    IsUIMessageW(hWndIME, msg_, wParam_, lParam_) {
        hWndIME := hWndIME is Win32Handle ? NumGet(hWndIME, "ptr") : hWndIME
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(43, this, "ptr", hWndIME, "uint", msg_, "ptr", wParam_, "ptr", lParam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwAction 
     * @param {Integer} dwIndex 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    NotifyIME(hIMC_, dwAction, dwIndex, dwValue) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(44, this, "ptr", hIMC_, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szRegister 
     * @returns {HRESULT} 
     */
    RegisterWordA(hKL_, szReading, dwStyle, szRegister) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(45, this, "ptr", hKL_, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @returns {HRESULT} 
     */
    RegisterWordW(hKL_, szReading, dwStyle, szRegister) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(46, this, "ptr", hKL_, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hWnd_ 
     * @param {HIMC} hIMC_ 
     * @returns {HRESULT} 
     */
    ReleaseContext(hWnd_, hIMC_) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(47, this, "ptr", hWnd_, "ptr", hIMC_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Pointer<CANDIDATEFORM>} pCandidate 
     * @returns {HRESULT} 
     */
    SetCandidateWindow(hIMC_, pCandidate) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(48, this, "ptr", hIMC_, "ptr", pCandidate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Pointer<LOGFONTA>} plf 
     * @returns {HRESULT} 
     */
    SetCompositionFontA(hIMC_, plf) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(49, this, "ptr", hIMC_, "ptr", plf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Pointer<LOGFONTW>} plf 
     * @returns {HRESULT} 
     */
    SetCompositionFontW(hIMC_, plf) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(50, this, "ptr", hIMC_, "ptr", plf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @param {Pointer<Void>} pComp 
     * @param {Integer} dwCompLen 
     * @param {Pointer<Void>} pRead 
     * @param {Integer} dwReadLen 
     * @returns {HRESULT} 
     */
    SetCompositionStringA(hIMC_, dwIndex, pComp, dwCompLen, pRead, dwReadLen) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(51, this, "ptr", hIMC_, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwIndex 
     * @param {Pointer<Void>} pComp 
     * @param {Integer} dwCompLen 
     * @param {Pointer<Void>} pRead 
     * @param {Integer} dwReadLen 
     * @returns {HRESULT} 
     */
    SetCompositionStringW(hIMC_, dwIndex, pComp, dwCompLen, pRead, dwReadLen) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(52, this, "ptr", hIMC_, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Pointer<COMPOSITIONFORM>} pCompForm 
     * @returns {HRESULT} 
     */
    SetCompositionWindow(hIMC_, pCompForm) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(53, this, "ptr", hIMC_, "ptr", pCompForm, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} fdwConversion 
     * @param {Integer} fdwSentence 
     * @returns {HRESULT} 
     */
    SetConversionStatus(hIMC_, fdwConversion, fdwSentence) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(54, this, "ptr", hIMC_, "uint", fdwConversion, "uint", fdwSentence, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {BOOL} fOpen 
     * @returns {HRESULT} 
     */
    SetOpenStatus(hIMC_, fOpen) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(55, this, "ptr", hIMC_, "int", fOpen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Pointer<POINT>} pptPos 
     * @returns {HRESULT} 
     */
    SetStatusWindowPos(hIMC_, pptPos) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(56, this, "ptr", hIMC_, "ptr", pptPos, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hWnd_ 
     * @param {Integer} dwHotKeyID 
     * @returns {HRESULT} 
     */
    SimulateHotKey(hWnd_, dwHotKeyID) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        result := ComCall(57, this, "ptr", hWnd_, "uint", dwHotKeyID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {PSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PSTR} szUnregister 
     * @returns {HRESULT} 
     */
    UnregisterWordA(hKL_, szReading, dwStyle, szUnregister) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szUnregister := szUnregister is String ? StrPtr(szUnregister) : szUnregister

        result := ComCall(58, this, "ptr", hKL_, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szUnregister 
     * @returns {HRESULT} 
     */
    UnregisterWordW(hKL_, szReading, dwStyle, szUnregister) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szUnregister := szUnregister is String ? StrPtr(szUnregister) : szUnregister

        result := ComCall(59, this, "ptr", hKL_, "ptr", szReading, "uint", dwStyle, "ptr", szUnregister, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ActivateActCtx function activates the specified activation context.
     * @remarks
     * The <i>lpCookie</i> parameter is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deactivateactctx">DeactivateActCtx</a>, which verifies the pairing of calls to 
     * <b>ActivateActCtx</b> and 
     * <b>DeactivateActCtx</b> and ensures that the appropriate activation context is being deactivated. This is done because the deactivation of activation contexts must occur in the reverse order of activation.
     * 
     * The activation of activation contexts can be understood as pushing an activation context onto a stack of activation contexts. The activation context you activate through this function  redirects any binding to DLLs, window classes, COM servers, type libraries, and mutexes for any side-by-side APIs you call.
     * 
     * The top item of an activation context stack is the active, default-activation context of the current thread. If a null activation context handle is pushed onto the stack, thereby activating it, the default settings in the original manifest override all activation contexts that are lower on the stack.
     * @param {BOOL} fRestoreLayout 
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>.
     * 
     * This function sets errors that can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. For an example, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/retrieving-the-last-error-code">Retrieving the Last-Error Code</a>. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-activateactctx
     */
    Activate(fRestoreLayout) {
        result := ComCall(60, this, "int", fRestoreLayout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DeactivateActCtx function deactivates the activation context corresponding to the specified cookie.
     * @remarks
     * The deactivation of activation contexts must occur in the reverse order of activation. It can be understood as popping an activation context from a stack.
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>.
     * 
     * This function sets errors that can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. For an example, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/retrieving-the-last-error-code">Retrieving the Last-Error Code</a>. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-deactivateactctx
     */
    Deactivate() {
        result := ComCall(61, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hWnd_ 
     * @param {Integer} Msg_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {LRESULT} 
     */
    OnDefWindowProc(hWnd_, Msg_, wParam_, lParam_) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        plResult := LRESULT()
        result := ComCall(62, this, "ptr", hWnd_, "uint", Msg_, "ptr", wParam_, "ptr", lParam_, "ptr", plResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(63, this, aaClassListMarshal, aaClassList, "uint", uSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @returns {Integer} 
     */
    GetCodePageA(hKL_) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_

        result := ComCall(64, this, "ptr", hKL_, "uint*", &uCodePage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return uCodePage
    }

    /**
     * 
     * @param {HKL} hKL_ 
     * @returns {Integer} 
     */
    GetLangId(hKL_) {
        hKL_ := hKL_ is Win32Handle ? NumGet(hKL_, "ptr") : hKL_

        result := ComCall(65, this, "ptr", hKL_, "ushort*", &plid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plid
    }

    /**
     * 
     * @param {HWND} hWnd_ 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AssociateContextEx(hWnd_, hIMC_, dwFlags) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        result := ComCall(66, this, "ptr", hWnd_, "ptr", hIMC_, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} idThread 
     * @returns {HRESULT} 
     */
    DisableIME(idThread) {
        result := ComCall(67, this, "uint", idThread, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwFlags 
     * @param {Integer} dwType 
     * @param {Pointer<IMEMENUITEMINFOA>} pImeParentMenu 
     * @param {Pointer<IMEMENUITEMINFOA>} pImeMenu 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    GetImeMenuItemsA(hIMC_, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(68, this, "ptr", hIMC_, "uint", dwFlags, "uint", dwType, "ptr", pImeParentMenu, "ptr", pImeMenu, "uint", dwSize, pdwResultMarshal, pdwResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HIMC} hIMC_ 
     * @param {Integer} dwFlags 
     * @param {Integer} dwType 
     * @param {Pointer<IMEMENUITEMINFOW>} pImeParentMenu 
     * @param {Pointer<IMEMENUITEMINFOW>} pImeMenu 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    GetImeMenuItemsW(hIMC_, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult) {
        hIMC_ := hIMC_ is Win32Handle ? NumGet(hIMC_, "ptr") : hIMC_

        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(69, this, "ptr", hIMC_, "uint", dwFlags, "uint", dwType, "ptr", pImeParentMenu, "ptr", pImeMenu, "uint", dwSize, pdwResultMarshal, pdwResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} idThread 
     * @returns {IEnumInputContext} 
     */
    EnumInputContext(idThread) {
        result := ComCall(70, this, "uint", idThread, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumInputContext(ppEnum)
    }
}
