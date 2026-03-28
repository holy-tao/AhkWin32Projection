#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumRegisterWordW.ahk
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

        pdwPrivateMarshal := pdwPrivate is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwSystemInfoFlags, "ptr", pIMEInfo, "ptr", szWndClass, pdwPrivateMarshal, pdwPrivate, "HRESULT")
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
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC
        szSource := szSource is String ? StrPtr(szSource) : szSource

        puCopiedMarshal := puCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", _hIMC, "ptr", szSource, "uint", uFlag, "uint", uBufLen, "ptr", pDest, puCopiedMarshal, puCopied, "HRESULT")
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
     * @param {HWND} _hWnd 
     * @param {Integer} dwMode 
     * @param {Pointer<REGISTERWORDW>} pRegisterWord 
     * @returns {HRESULT} If the function is successful (that is, if a current configuration exists), the return value is **TRUE**.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/configure
     */
    Configure(_hKL, _hWnd, dwMode, pRegisterWord) {
        _hKL := _hKL is Win32Handle ? NumGet(_hKL, "ptr") : _hKL
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(5, this, "ptr", _hKL, "ptr", _hWnd, "uint", dwMode, "ptr", pRegisterWord, "HRESULT")
        return result
    }

    /**
     * Destroys an accelerator table.
     * @param {Integer} uReserved 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero. However, if the table has been loaded more than one call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadacceleratorsa">LoadAccelerators</a>, the function will return a nonzero value only when <b>DestroyAcceleratorTable</b> has been called an equal number of times.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyacceleratortable
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
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", _hIMC, "uint", uEscape, pDataMarshal, pData, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HIMC} _hIMC 
     * @param {BOOL} fFlag 
     * @returns {HRESULT} 
     */
    SetActiveContext(_hIMC, fFlag) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(8, this, "ptr", _hIMC, "int", fFlag, "HRESULT")
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
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pbKeyStateMarshal := pbKeyState is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "ptr", _hIMC, "uint", uVirKey, "uint", _lParam, pbKeyStateMarshal, pbKeyState, "HRESULT")
        return result
    }

    /**
     * The NotifyAddrChange function causes a notification to be sent to the caller whenever a change occurs in the table that maps IPv4 addresses to interfaces.
     * @remarks
     * The  
     * <b>NotifyAddrChange</b> function may be called in two ways:<ul>
     * <li>Synchronous method</li>
     * <li>Asynchronous method</li>
     * </ul>
     * 
     * 
     * If the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters, the call to 
     * <b>NotifyAddrChange</b> is synchronous and will block until an IP address change occurs. In this case if a change occurs, the <b>NotifyAddrChange</b> function completes to indicate that a change has occurred. 
     * 
     * If the <b>NotifyAddrChange</b> function is called synchronously, a notification will be sent on the next IPv4 address change until the application terminates. 
     * 
     * If the caller specifies a handle variable and an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, then the <b>NotifyAddrChange</b> function call is asynchronous and the caller can use the returned handle with the <b>OVERLAPPED</b> structure to receive asynchronous notification of IPv4 address changes using the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function. See the following topics for information about using the handle and 
     * <b>OVERLAPPED</b> structure to receive notifications:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>
     * </li>
     * </ul>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-cancelipchangenotify">CancelIPChangeNotify</a> function cancels notification of IPv4 address and route changes previously requested with successful calls to the <b>NotifyAddrChange</b> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyroutechange">NotifyRouteChange</a> functions.
     * 
     * Once an application has been notified of a change, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function to retrieve the table of IPv4 addresses to determine what has changed. If the application is notified and requires notification for the next change, then the <b>NotifyAddrChange</b> function must be called again.
     * 
     * If the <b>NotifyAddrChange</b> function is called asynchronously, a notification will be sent on the next IPv4 address change until either the application cancels the notification by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-cancelipchangenotify">CancelIPChangeNotify</a> function or the application terminates. If the application terminates, the system will automatically cancel the registration for the notification. It is still recommended that an application explicitly cancel any notification before it terminates.  
     * 
     * Any registration for a notification does not persist across a system shut down or reboot.
     * 
     * On Windows Vista and later, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyipinterfacechange">NotifyIpInterfaceChange</a> function  can be used to  register to be notified for changes to IPv4 and IPv6 interfaces on  the local computer.
     * @param {HIMC} _hIMC 
     * @param {Integer} dwAction 
     * @param {Integer} dwIndex 
     * @param {Integer} dwValue 
     * @returns {HRESULT} If the function succeeds, the return value is NO_ERROR if the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters. If the caller specifies non-<b>NULL</b> parameters, the return value for success is ERROR_IO_PENDING.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is being deregistered, so the call was canceled immediately.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed. This error is returned if the both the <i>Handle</i> and <i>overlapped</i> parameters are not <b>NULL</b>, but the memory specified by the
     *     input parameters cannot be written by the calling process.  This error is also returned if the client already has made a change notification request, so this duplicate request will fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error is returned on versions of Windows where this function is not supported such as Windows 98/95 and Windows NT 4.0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-notifyaddrchange
     */
    Notify(_hIMC, dwAction, dwIndex, dwValue) {
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(10, this, "ptr", _hIMC, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "HRESULT")
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
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        result := ComCall(11, this, "ptr", _hIMC, "int", fSelect, "HRESULT")
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
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pCompMarshal := pComp is VarRef ? "ptr" : "ptr"
        pReadMarshal := pRead is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, "ptr", _hIMC, "uint", dwIndex, pCompMarshal, pComp, "uint", dwCompLen, pReadMarshal, pRead, "uint", dwReadLen, "HRESULT")
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
        _hIMC := _hIMC is Win32Handle ? NumGet(_hIMC, "ptr") : _hIMC

        pbKeyStateMarshal := pbKeyState is VarRef ? "char*" : "ptr"
        pdwTransBufMarshal := pdwTransBuf is VarRef ? "uint*" : "ptr"
        puSizeMarshal := puSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", uVirKey, "uint", uScanCode, pbKeyStateMarshal, pbKeyState, "uint", fuState, "ptr", _hIMC, pdwTransBufMarshal, pdwTransBuf, puSizeMarshal, puSize, "HRESULT")
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

        result := ComCall(16, this, "uint", nItem, "ptr", pStyleBuf, puBufSizeMarshal, puBufSize, "HRESULT")
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
}
