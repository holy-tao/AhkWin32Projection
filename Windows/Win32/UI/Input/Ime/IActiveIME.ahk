#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIME extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveIME
     * @type {Guid}
     */
    static IID => Guid("{6fe20962-d077-11d0-8fe7-00aa006bcc59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Inquire", "ConversionList", "Configure", "Destroy", "Escape", "SetActiveContext", "ProcessKey", "Notify", "Select", "SetCompositionString", "ToAsciiEx", "RegisterWord", "UnregisterWord", "GetRegisterWordStyle", "EnumRegisterWord", "GetCodePageA", "GetLangId"]

    /**
     * 
     * @param {Integer} dwSystemInfoFlags 
     * @param {Pointer<IMEINFO>} pIMEInfo 
     * @param {PWSTR} szWndClass 
     * @param {Pointer<Integer>} pdwPrivate 
     * @returns {HRESULT} 
     */
    Inquire(dwSystemInfoFlags, pIMEInfo, szWndClass, pdwPrivate) {
        szWndClass := szWndClass is String ? StrPtr(szWndClass) : szWndClass

        result := ComCall(3, this, "uint", dwSystemInfoFlags, "ptr", pIMEInfo, "ptr", szWndClass, "uint*", pdwPrivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {PWSTR} szSource 
     * @param {Integer} uFlag 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pDest 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    ConversionList(hIMC, szSource, uFlag, uBufLen, pDest, puCopied) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC
        szSource := szSource is String ? StrPtr(szSource) : szSource

        result := ComCall(4, this, "ptr", hIMC, "ptr", szSource, "uint", uFlag, "uint", uBufLen, "ptr", pDest, "uint*", puCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKL} hKL 
     * @param {HWND} hWnd 
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDW>} pRegisterWord 
     * @returns {HRESULT} 
     */
    Configure(hKL, hWnd, dwMode, pRegisterWord) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(5, this, "ptr", hKL, "ptr", hWnd, "uint", dwMode, "ptr", pRegisterWord, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uReserved 
     * @returns {HRESULT} 
     */
    Destroy(uReserved) {
        result := ComCall(6, this, "uint", uReserved, "HRESULT")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @param {HIMC} hIMC 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<LRESULT>} plResult 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero, except with the <a href="/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-escape
     */
    Escape(hIMC, uEscape, pData, plResult) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(7, this, "ptr", hIMC, "uint", uEscape, "ptr", pData, "ptr", plResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {BOOL} fFlag 
     * @returns {HRESULT} 
     */
    SetActiveContext(hIMC, fFlag) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(8, this, "ptr", hIMC, "int", fFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {Integer} uVirKey 
     * @param {Integer} lParam 
     * @param {Pointer<Integer>} pbKeyState 
     * @returns {HRESULT} 
     */
    ProcessKey(hIMC, uVirKey, lParam, pbKeyState) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(9, this, "ptr", hIMC, "uint", uVirKey, "uint", lParam, "char*", pbKeyState, "HRESULT")
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
    Notify(hIMC, dwAction, dwIndex, dwValue) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(10, this, "ptr", hIMC, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} hIMC 
     * @param {BOOL} fSelect 
     * @returns {HRESULT} 
     */
    Select(hIMC, fSelect) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(11, this, "ptr", hIMC, "int", fSelect, "HRESULT")
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
    SetCompositionString(hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(12, this, "ptr", hIMC, "uint", dwIndex, "ptr", pComp, "uint", dwCompLen, "ptr", pRead, "uint", dwReadLen, "HRESULT")
        return result
    }

    /**
     * Translates the specified virtual-key code and keyboard state to the corresponding character or characters. The function translates the code using the input language and physical keyboard layout identified by the input locale identifier.
     * @param {Integer} uVirKey 
     * @param {Integer} uScanCode Type: <b>UINT</b>
     * 
     * The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up (not pressed).
     * @param {Pointer<Integer>} pbKeyState 
     * @param {Integer} fuState 
     * @param {HIMC} hIMC 
     * @param {Pointer<Integer>} pdwTransBuf 
     * @param {Pointer<Integer>} puSize 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * If the specified key is a dead key, the return value is negative. Otherwise, it is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified virtual key has no translation for the current state of the keyboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One character was copied to the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Two characters were copied to the buffer. This usually happens when a dead-key character (accent or diacritic) stored in the keyboard layout cannot be composed with the specified virtual key to form a single character.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-toasciiex
     */
    ToAsciiEx(uVirKey, uScanCode, pbKeyState, fuState, hIMC, pdwTransBuf, puSize) {
        hIMC := hIMC is Win32Handle ? NumGet(hIMC, "ptr") : hIMC

        result := ComCall(13, this, "uint", uVirKey, "uint", uScanCode, "char*", pbKeyState, "uint", fuState, "ptr", hIMC, "uint*", pdwTransBuf, "uint*", puSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szString 
     * @returns {HRESULT} 
     */
    RegisterWord(szReading, dwStyle, szString) {
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szString := szString is String ? StrPtr(szString) : szString

        result := ComCall(14, this, "ptr", szReading, "uint", dwStyle, "ptr", szString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szString 
     * @returns {HRESULT} 
     */
    UnregisterWord(szReading, dwStyle, szString) {
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szString := szString is String ? StrPtr(szString) : szString

        result := ComCall(15, this, "ptr", szReading, "uint", dwStyle, "ptr", szString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nItem 
     * @param {Pointer<STYLEBUFW>} pStyleBuf 
     * @param {Pointer<Integer>} puBufSize 
     * @returns {HRESULT} 
     */
    GetRegisterWordStyle(nItem, pStyleBuf, puBufSize) {
        result := ComCall(16, this, "uint", nItem, "ptr", pStyleBuf, "uint*", puBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<IEnumRegisterWordW>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumRegisterWord(szReading, dwStyle, szRegister, pData, ppEnum) {
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        result := ComCall(17, this, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, "ptr", pData, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} uCodePage 
     * @returns {HRESULT} 
     */
    GetCodePageA(uCodePage) {
        result := ComCall(18, this, "uint*", uCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plid 
     * @returns {HRESULT} 
     */
    GetLangId(plid) {
        result := ComCall(19, this, "ushort*", plid, "HRESULT")
        return result
    }
}
