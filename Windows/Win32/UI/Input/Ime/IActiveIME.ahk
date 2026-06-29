#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\REGISTERWORDW.ahk" { REGISTERWORDW }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMEINFO.ahk" { IMEINFO }
#Import "..\..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CANDIDATELIST.ahk" { CANDIDATELIST }
#Import "..\KeyboardAndMouse\HKL.ahk" { HKL }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IEnumRegisterWordW.ahk" { IEnumRegisterWordW }
#Import ".\HIMC.ahk" { HIMC }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\STYLEBUFW.ahk" { STYLEBUFW }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IActiveIME extends IUnknown {
    /**
     * The interface identifier for IActiveIME
     * @type {Guid}
     */
    static IID := Guid("{6fe20962-d077-11d0-8fe7-00aa006bcc59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveIME interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Inquire              : IntPtr
        ConversionList       : IntPtr
        Configure            : IntPtr
        Destroy              : IntPtr
        Escape               : IntPtr
        SetActiveContext     : IntPtr
        ProcessKey           : IntPtr
        Notify               : IntPtr
        Select               : IntPtr
        SetCompositionString : IntPtr
        ToAsciiEx            : IntPtr
        RegisterWord         : IntPtr
        UnregisterWord       : IntPtr
        GetRegisterWordStyle : IntPtr
        EnumRegisterWord     : IntPtr
        GetCodePageA         : IntPtr
        GetLangId            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveIME.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        pdwPrivateMarshal := pdwPrivate is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwSystemInfoFlags, IMEINFO.Ptr, pIMEInfo, "ptr", szWndClass, pdwPrivateMarshal, pdwPrivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {PWSTR} szSource 
     * @param {Integer} uFlag 
     * @param {Integer} uBufLen 
     * @param {Pointer<CANDIDATELIST>} pDest 
     * @param {Pointer<Integer>} puCopied 
     * @returns {HRESULT} 
     */
    ConversionList(_hIMC, szSource, uFlag, uBufLen, pDest, puCopied) {
        szSource := szSource is String ? StrPtr(szSource) : szSource

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, HIMC, _hIMC, "ptr", szSource, "uint", uFlag, "uint", uBufLen, CANDIDATELIST.Ptr, pDest, puCopiedMarshal, puCopied, "HRESULT")
        return result
    }

    /**
     * Configures the expert within the expert DLL.
     * @remarks
     * Network Monitor calls the **Configure** function with the current configuration of the expert, if one exists. The expert displays a dialog box, with which you can change any configurable item.
     * 
     * When *ppConfig* is passed in and Network Monitor does not have a configuration stored for the specified expert, the parameter value can be **NULL**. In this case, the **Configure** function assumes hard-coded default values (or, uses the startup information) to open the dialog box.
     * 
     * The configuration data can also be **NULL** when the **Configure** function returns, and a **NULL** was passed-in. This situation occurs when Network Monitor does not have a stored default, and the user presses **Cancel**.
     * 
     * The beginning of the [**EXPERTCONFIG**](expertconfig.md) data structure includes a Private section that stores the structure size information. The size of the **EXPERTCONFIG** structure should include the reserved **DWORD** length that appears at the beginning of the structure. For example, if your configuration data requires 20 bytes of storage space, allocate 24 bytes to store the data. If a *ppConfig* is **NULL**, the **Configure** function calls the [**ExpertAllocMemory**](expertallocmemory.md) function to allocate a new configuration that is the correct size. If the buffer is not enough to hold the expert data, the expert should call the [**ExpertReallocMemory**](expertreallocmemory.md) function.
     * @param {HKL} _hKL 
     * @param {HWND} _hWnd A handle to the parent window. Use the handle to open a dialog box.
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDW>} pRegisterWord 
     * @returns {HRESULT} If the function is successful (that is, if a current configuration exists), the return value is **TRUE**.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/configure
     */
    Configure(_hKL, _hWnd, dwMode, pRegisterWord) {
        result := ComCall(5, this, HKL, _hKL, HWND, _hWnd, "uint", dwMode, REGISTERWORDW.Ptr, pRegisterWord, "HRESULT")
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
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The effect of passing 0 for <i>cbInput</i> will depend on the value of <i>nEscape</i> and on the driver that is handling the escape.
     * 
     * Of the original printer escapes, only the following can be used.
     * 
     * <table>
     * <tr>
     * <th>Escape</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * QUERYESCSUPPORT
     * 
     * </td>
     * <td>
     * Determines whether a particular escape is implemented by the device driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PASSTHROUGH
     * 
     * </td>
     * <td>
     * Allows the application to send data directly to a printer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For information about printer escapes, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extescape">ExtEscape</a>.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startpage">StartPage</a> function to prepare the printer driver to receive data.
     * @param {HIMC} _hIMC 
     * @param {Integer} uEscape 
     * @param {Pointer<Void>} pData 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-escape
     */
    Escape(_hIMC, uEscape, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, HIMC, _hIMC, "uint", uEscape, pDataMarshal, pData, LRESULT.Ptr, &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {BOOL} fFlag 
     * @returns {HRESULT} 
     */
    SetActiveContext(_hIMC, fFlag) {
        result := ComCall(8, this, HIMC, _hIMC, BOOL, fFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {Integer} uVirKey 
     * @param {Integer} _lParam 
     * @param {Pointer<Integer>} pbKeyState 
     * @returns {HRESULT} 
     */
    ProcessKey(_hIMC, uVirKey, _lParam, pbKeyState) {
        pbKeyStateMarshal := pbKeyState is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, HIMC, _hIMC, "uint", uVirKey, "uint", _lParam, pbKeyStateMarshal, pbKeyState, "HRESULT")
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
    Notify(_hIMC, dwAction, dwIndex, dwValue) {
        result := ComCall(10, this, HIMC, _hIMC, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * An XPath query that identifies the events to include in the query result set.
     * @param {HIMC} _hIMC 
     * @param {BOOL} fSelect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WES/queryschema-select-querytype-element
     */
    Select(_hIMC, fSelect) {
        result := ComCall(11, this, HIMC, _hIMC, BOOL, fSelect, "HRESULT")
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
    SetCompositionString(_hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen) {
        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, HIMC, _hIMC, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "HRESULT")
        return result
    }

    /**
     * Translates the specified virtual-key code and keyboard state to the corresponding character or characters. The function translates the code using the input language and physical keyboard layout identified by the input locale identifier.
     * @remarks
     * The input locale identifier is a broader concept than a keyboard layout, since it can also encompass a speech-to-text converter, an Input Method Editor (IME), or any other form of input.
     * 
     * The parameters supplied to the <b>ToAsciiEx</b> function might not be sufficient to translate the virtual-key code, because a previous dead key is stored in the keyboard layout.
     * 
     * Typically, <b>ToAsciiEx</b> performs the translation based on the virtual-key code. In some cases, however, bit 15 of the 
     *     <i>uScanCode</i> parameter may be used to distinguish between a key press and a key release. The scan code is used for translating ALT+number key combinations.
     * 
     * Although NUM LOCK is a toggle key that affects keyboard behavior, <b>ToAsciiEx</b> ignores the toggle setting (the low bit) of 
     *     <i>lpKeyState</i> (<b>VK_NUMLOCK</b>) because the 
     *     <i>uVirtKey</i> parameter alone is sufficient to distinguish the cursor movement keys (<b>VK_HOME</b>, <b>VK_INSERT</b>, and so on) from the numeric keys (<b>VK_DECIMAL</b>, <b>VK_NUMPAD0</b> - <b>VK_NUMPAD9</b>).
     * @param {Integer} uVirKey 
     * @param {Integer} uScanCode Type: <b>UINT</b>
     * 
     * The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up (not pressed).
     * @param {Pointer<Integer>} pbKeyState 
     * @param {Integer} fuState 
     * @param {HIMC} _hIMC 
     * @param {Pointer<Integer>} pdwTransBuf 
     * @param {Pointer<Integer>} puSize 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * The return value is one of the following values.
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
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-toasciiex
     */
    ToAsciiEx(uVirKey, uScanCode, pbKeyState, fuState, _hIMC, pdwTransBuf, puSize) {
        pbKeyStateMarshal := pbKeyState is VarRef ? "char*" : "ptr"
        pdwTransBufMarshal := pdwTransBuf is VarRef ? "uint*" : "ptr"
        puSizeMarshal := puSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", uVirKey, "uint", uScanCode, pbKeyStateMarshal, pbKeyState, "uint", fuState, HIMC, _hIMC, pdwTransBufMarshal, pdwTransBuf, puSizeMarshal, puSize, "HRESULT")
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
        puBufSizeMarshal := puBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", nItem, STYLEBUFW.Ptr, pStyleBuf, puBufSizeMarshal, puBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szReading 
     * @param {Integer} dwStyle 
     * @param {PWSTR} szRegister 
     * @param {Pointer<Void>} pData 
     * @returns {IEnumRegisterWordW} 
     */
    EnumRegisterWord(szReading, dwStyle, szRegister, pData) {
        szReading := szReading is String ? StrPtr(szReading) : szReading
        szRegister := szRegister is String ? StrPtr(szRegister) : szRegister

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, "ptr", szReading, "uint", dwStyle, "ptr", szRegister, pDataMarshal, pData, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumRegisterWordW(ppEnum)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCodePageA() {
        result := ComCall(18, this, "uint*", &uCodePage := 0, "HRESULT")
        return uCodePage
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLangId() {
        result := ComCall(19, this, "ushort*", &plid := 0, "HRESULT")
        return plid
    }

    Query(iid) {
        if (IActiveIME.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Inquire := CallbackCreate(GetMethod(implObj, "Inquire"), flags, 5)
        this.vtbl.ConversionList := CallbackCreate(GetMethod(implObj, "ConversionList"), flags, 7)
        this.vtbl.Configure := CallbackCreate(GetMethod(implObj, "Configure"), flags, 5)
        this.vtbl.Destroy := CallbackCreate(GetMethod(implObj, "Destroy"), flags, 2)
        this.vtbl.Escape := CallbackCreate(GetMethod(implObj, "Escape"), flags, 5)
        this.vtbl.SetActiveContext := CallbackCreate(GetMethod(implObj, "SetActiveContext"), flags, 3)
        this.vtbl.ProcessKey := CallbackCreate(GetMethod(implObj, "ProcessKey"), flags, 5)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 5)
        this.vtbl.Select := CallbackCreate(GetMethod(implObj, "Select"), flags, 3)
        this.vtbl.SetCompositionString := CallbackCreate(GetMethod(implObj, "SetCompositionString"), flags, 7)
        this.vtbl.ToAsciiEx := CallbackCreate(GetMethod(implObj, "ToAsciiEx"), flags, 8)
        this.vtbl.RegisterWord := CallbackCreate(GetMethod(implObj, "RegisterWord"), flags, 4)
        this.vtbl.UnregisterWord := CallbackCreate(GetMethod(implObj, "UnregisterWord"), flags, 4)
        this.vtbl.GetRegisterWordStyle := CallbackCreate(GetMethod(implObj, "GetRegisterWordStyle"), flags, 4)
        this.vtbl.EnumRegisterWord := CallbackCreate(GetMethod(implObj, "EnumRegisterWord"), flags, 6)
        this.vtbl.GetCodePageA := CallbackCreate(GetMethod(implObj, "GetCodePageA"), flags, 2)
        this.vtbl.GetLangId := CallbackCreate(GetMethod(implObj, "GetLangId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Inquire)
        CallbackFree(this.vtbl.ConversionList)
        CallbackFree(this.vtbl.Configure)
        CallbackFree(this.vtbl.Destroy)
        CallbackFree(this.vtbl.Escape)
        CallbackFree(this.vtbl.SetActiveContext)
        CallbackFree(this.vtbl.ProcessKey)
        CallbackFree(this.vtbl.Notify)
        CallbackFree(this.vtbl.Select)
        CallbackFree(this.vtbl.SetCompositionString)
        CallbackFree(this.vtbl.ToAsciiEx)
        CallbackFree(this.vtbl.RegisterWord)
        CallbackFree(this.vtbl.UnregisterWord)
        CallbackFree(this.vtbl.GetRegisterWordStyle)
        CallbackFree(this.vtbl.EnumRegisterWord)
        CallbackFree(this.vtbl.GetCodePageA)
        CallbackFree(this.vtbl.GetLangId)
    }
}
