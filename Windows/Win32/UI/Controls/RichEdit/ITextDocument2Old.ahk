#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextSelection.ahk
#Include .\ITextFont.ahk
#Include .\ITextPara.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ITextDocument.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextDocument2Old extends ITextDocument{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDocument2Old
     * @type {Guid}
     */
    static IID => Guid("{01c25500-4268-11d1-883a-3c8b00c10000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachMsgFilter", "SetEffectColor", "GetEffectColor", "GetCaretType", "SetCaretType", "GetImmContext", "ReleaseImmContext", "GetPreferredFont", "GetNotificationMode", "SetNotificationMode", "GetClientRect", "GetSelection2", "GetWindow", "GetFEFlags", "UpdateWindow", "CheckTextLimit", "IMEInProgress", "SysBeep", "Update", "Notify", "GetDocumentFont", "GetDocumentPara", "GetCallManager", "ReleaseCallManager"]

    /**
     * 
     * @param {IUnknown} pFilter 
     * @returns {HRESULT} 
     */
    AttachMsgFilter(pFilter) {
        result := ComCall(26, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {COLORREF} cr 
     * @returns {HRESULT} 
     */
    SetEffectColor(Index, cr) {
        result := ComCall(27, this, "int", Index, "uint", cr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {COLORREF} 
     */
    GetEffectColor(Index) {
        result := ComCall(28, this, "int", Index, "uint*", &pcr := 0, "HRESULT")
        return pcr
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCaretType() {
        result := ComCall(29, this, "int*", &pCaretType := 0, "HRESULT")
        return pCaretType
    }

    /**
     * 
     * @param {Integer} CaretType 
     * @returns {HRESULT} 
     */
    SetCaretType(CaretType) {
        result := ComCall(30, this, "int", CaretType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetImmContext() {
        result := ComCall(31, this, "int64*", &pContext := 0, "HRESULT")
        return pContext
    }

    /**
     * 
     * @param {Integer} _Context 
     * @returns {HRESULT} 
     */
    ReleaseImmContext(_Context) {
        result := ComCall(32, this, "int64", _Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cp 
     * @param {Integer} CharRep 
     * @param {Integer} Option 
     * @param {Integer} CharRepCur 
     * @param {Integer} curFontSize 
     * @param {Pointer<BSTR>} pbstr 
     * @param {Pointer<Integer>} pPitchAndFamily 
     * @param {Pointer<Integer>} pNewFontSize 
     * @returns {HRESULT} 
     */
    GetPreferredFont(cp, CharRep, Option, CharRepCur, curFontSize, pbstr, pPitchAndFamily, pNewFontSize) {
        pPitchAndFamilyMarshal := pPitchAndFamily is VarRef ? "int*" : "ptr"
        pNewFontSizeMarshal := pNewFontSize is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, "int", cp, "int", CharRep, "int", Option, "int", CharRepCur, "int", curFontSize, "ptr", pbstr, pPitchAndFamilyMarshal, pPitchAndFamily, pNewFontSizeMarshal, pNewFontSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNotificationMode() {
        result := ComCall(34, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @returns {HRESULT} 
     */
    SetNotificationMode(_Mode) {
        result := ComCall(35, this, "int", _Mode, "HRESULT")
        return result
    }

    /**
     * Retrieves the coordinates of a window's client area.
     * @remarks
     * In conformance with conventions for the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure, the bottom-right coordinates of the returned rectangle are exclusive. In other words, the pixel at (<b>right</b>, <b>bottom</b>) lies immediately outside the rectangle.
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pLeft 
     * @param {Pointer<Integer>} pTop 
     * @param {Pointer<Integer>} pRight 
     * @param {Pointer<Integer>} pBottom 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getclientrect
     */
    GetClientRect(Type, pLeft, pTop, pRight, pBottom) {
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pRightMarshal := pRight is VarRef ? "int*" : "ptr"
        pBottomMarshal := pBottom is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, "int", Type, pLeftMarshal, pLeft, pTopMarshal, pTop, pRightMarshal, pRight, pBottomMarshal, pBottom, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITextSelection} 
     */
    GetSelection2() {
        result := ComCall(37, this, "ptr*", &ppSel := 0, "HRESULT")
        return ITextSelection(ppSel)
    }

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumchildwindows">EnumChildWindows</a> function is more reliable than calling <b>GetWindow</b> in a loop. An application that calls <b>GetWindow</b> to perform this task risks being caught in an infinite loop or referencing a handle to a window that has been destroyed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getwindow
     */
    GetWindow() {
        result := ComCall(38, this, "int*", &phWnd := 0, "HRESULT")
        return phWnd
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFEFlags() {
        result := ComCall(39, this, "int*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * The UpdateWindow function updates the client area of the specified window by sending a WM_PAINT message to the window if the window's update region is not empty.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-updatewindow
     */
    UpdateWindow() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cch 
     * @param {Pointer<Integer>} pcch 
     * @returns {HRESULT} 
     */
    CheckTextLimit(cch, pcch) {
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, "int", cch, pcchMarshal, pcch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    IMEInProgress(Value) {
        result := ComCall(42, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SysBeep() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * Learn more about: Update constructor
     * @param {Integer} _Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/update-constructor
     */
    Update(_Mode) {
        result := ComCall(44, this, "int", _Mode, "HRESULT")
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
     * @param {Integer} Notify 
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
    Notify(Notify) {
        result := ComCall(45, this, "int", Notify, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITextFont} 
     */
    GetDocumentFont() {
        result := ComCall(46, this, "ptr*", &ppITextFont := 0, "HRESULT")
        return ITextFont(ppITextFont)
    }

    /**
     * 
     * @returns {ITextPara} 
     */
    GetDocumentPara() {
        result := ComCall(47, this, "ptr*", &ppITextPara := 0, "HRESULT")
        return ITextPara(ppITextPara)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetCallManager() {
        result := ComCall(48, this, "ptr*", &ppVoid := 0, "HRESULT")
        return IUnknown(ppVoid)
    }

    /**
     * 
     * @param {IUnknown} pVoid 
     * @returns {HRESULT} 
     */
    ReleaseCallManager(pVoid) {
        result := ComCall(49, this, "ptr", pVoid, "HRESULT")
        return result
    }
}
