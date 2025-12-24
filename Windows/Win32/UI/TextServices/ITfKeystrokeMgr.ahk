#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfKeystrokeMgr interface is implemented by the TSF manager and used by applications and text services to interact with the keyboard manager.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfkeystrokemgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfKeystrokeMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfKeystrokeMgr
     * @type {Guid}
     */
    static IID => Guid("{aa80e7f0-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseKeyEventSink", "UnadviseKeyEventSink", "GetForeground", "TestKeyDown", "TestKeyUp", "KeyDown", "KeyUp", "GetPreservedKey", "IsPreservedKey", "PreserveKey", "UnpreserveKey", "SetPreservedKeyDescription", "GetPreservedKeyDescription", "SimulatePreservedKey"]

    /**
     * ITfKeystrokeMgr::AdviseKeyEventSink method
     * @param {Integer} tid Identifier of the client that owns the key event sink. This value is obtained by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-activate">ITfThreadMgr::Activate</a>.
     * @param {ITfKeyEventSink} pSink Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfkeyeventsink">ITfKeyEventSink</a> interface.
     * @param {BOOL} fForeground Specifies if this key event sink is made the foreground key event sink. If this is <b>TRUE</b>, this key event sink is made the foreground key event sink. Otherwise, this key event sink does not become the foreground key event sink.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_ADVISELIMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client identified by <i>tid</i> has a key event sink installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-advisekeyeventsink
     */
    AdviseKeyEventSink(tid, pSink, fForeground) {
        result := ComCall(3, this, "uint", tid, "ptr", pSink, "int", fForeground, "HRESULT")
        return result
    }

    /**
     * ITfKeystrokeMgr::UnadviseKeyEventSink method
     * @param {Integer} tid Identifier of the client that owns the key event sink. This value was passed when the advise sink was installed using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfkeystrokemgr-advisekeyeventsink">ITfKeystrokeMgr::AdviseKeyEventSink</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * The <i>tid</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The advise sink identified by <i>tid</i> was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-unadvisekeyeventsink
     */
    UnadviseKeyEventSink(tid) {
        result := ComCall(4, this, "uint", tid, "HRESULT")
        return result
    }

    /**
     * ITfKeystrokeMgr::GetForeground method
     * @returns {Guid} Pointer to a CLSID that receives the class identifier of the foreground TSF text service.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-getforeground
     */
    GetForeground() {
        pclsid := Guid()
        result := ComCall(5, this, "ptr", pclsid, "HRESULT")
        return pclsid
    }

    /**
     * ITfKeystrokeMgr::TestKeyDown method
     * @param {WPARAM} wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a BOOL that indicates if the key event would be handled. If this value receives <b>TRUE</b>, the key event would be handled and the event should not be forwarded to the application. If this value is <b>FALSE</b>, the key event would not be handled and the event should be forwarded to the application.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-testkeydown
     */
    TestKeyDown(wParam, lParam) {
        result := ComCall(6, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeystrokeMgr::TestKeyUp method
     * @param {WPARAM} wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {BOOL} Pointer to a BOOL that indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled and the event should not be forwarded to the application. If this value is <b>FALSE</b>, the key event is not handled and the event should be forwarded to the application.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-testkeyup
     */
    TestKeyUp(wParam, lParam) {
        result := ComCall(7, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeystrokeMgr::KeyDown method
     * @param {WPARAM} wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event was handled. If this value receives <b>TRUE</b>, the key event was handled and the event should not be forwarded to the application. If this value is <b>FALSE</b>, the key event was not handled and the event should be forwarded to the application.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-keydown
     */
    KeyDown(wParam, lParam) {
        result := ComCall(8, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeystrokeMgr::KeyUp method
     * @param {WPARAM} wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event will be handled. If this value receives <b>TRUE</b>, the key event would be handled and the event should not be forwarded to the application. If this value is <b>FALSE</b>, the key event would not be handled and the event should be forwarded to the application.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-keyup
     */
    KeyUp(wParam, lParam) {
        result := ComCall(9, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeystrokeMgr::GetPreservedKey method
     * @param {ITfContext} pic Pointer to the application context. This value is returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a>.
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_preservedkey">TF_PRESERVEDKEY</a> structure that identifies the preserved key to obtain. The <b>uVKey</b> member contains the virtual key code and the <b>uModifiers</b> member identifies the modifiers of the preserved key. The <b>uVKey</b> member must be less than 256.
     * @returns {Guid} Pointer to a GUID value that receives the command GUID of the preserved key. This is the GUID passed in the TSF text service call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfkeystrokemgr-preservekey">ITfKeystrokeMgr::PreserveKey</a>. This value receives GUID_NULL if the preserved key is not found.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-getpreservedkey
     */
    GetPreservedKey(pic, pprekey) {
        pguid := Guid()
        result := ComCall(10, this, "ptr", pic, "ptr", pprekey, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * ITfKeystrokeMgr::IsPreservedKey method
     * @param {Pointer<Guid>} rguid Specifies the command GUID of the preserved key. This is the GUID passed in the text service call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfkeystrokemgr-preservekey">ITfKeystrokeMgr::PreserveKey</a>.
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_preservedkey">TF_PRESERVEDKEY</a> structure that identifies the preserved key. The <b>uVKey</b> member contains the virtual key code and the <b>uModifiers</b> member identifies the modifiers of the preserved key. The <b>uVKey</b> member must be less than 256.
     * @returns {BOOL} Pointer to a BOOL that receives <b>TRUE</b> if the command GUID and key combination is a registered preserved key, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-ispreservedkey
     */
    IsPreservedKey(rguid, pprekey) {
        result := ComCall(11, this, "ptr", rguid, "ptr", pprekey, "int*", &pfRegistered := 0, "HRESULT")
        return pfRegistered
    }

    /**
     * ITfKeystrokeMgr::PreserveKey method
     * @param {Integer} tid Contains the client identifier of the TSF text service. This value is passed to the TSF text service in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-activate">ITfTextInputProcessor::Activate</a> method.
     * @param {Pointer<Guid>} rguid Contains the command GUID of the preserved key. This value is passed to the TSF text service <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfkeyeventsink-onpreservedkey">ITfKeyEventSink::OnPreservedKey</a> method to identify the preserved key when the preserved key is activated.
     * @param {Pointer<TF_PRESERVEDKEY>} prekey Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_preservedkey">TF_PRESERVEDKEY</a> structure that specifies the preserved key. The <b>uVKey</b> member contains the virtual key code and the <b>uModifiers</b> member identifies the modifiers of the preserved key.
     * @param {PWSTR} pchDesc Pointer to a Unicode string that contains the description of the preserved key. This cannot be <b>NULL</b> unless <i>cchDesc</i> is zero.
     * @param {Integer} cchDesc Specifies the number of characters in <i>pchDesc</i>. Pass zero for this parameter if no description is required.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The preserved key is registered.
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
     * One or more parameters are invalid.
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
     * A memory allocation error occurred.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-preservekey
     */
    PreserveKey(tid, rguid, prekey, pchDesc, cchDesc) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(12, this, "uint", tid, "ptr", rguid, "ptr", prekey, "ptr", pchDesc, "uint", cchDesc, "HRESULT")
        return result
    }

    /**
     * ITfKeystrokeMgr::UnpreserveKey method
     * @param {Pointer<Guid>} rguid Contains the command GUID of the preserved key.
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_preservedkey">TF_PRESERVEDKEY</a> structure that specifies the preserved key. The <i>uVKey</i> member contains the virtual key code and the <i>uModifiers</i> member identifies the modifiers of the preserved key.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The preserved key is not registered.
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
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-unpreservekey
     */
    UnpreserveKey(rguid, pprekey) {
        result := ComCall(13, this, "ptr", rguid, "ptr", pprekey, "HRESULT")
        return result
    }

    /**
     * ITfKeystrokeMgr::SetPreservedKeyDescription method
     * @param {Pointer<Guid>} rguid Contains the command GUID of the preserved key.
     * @param {PWSTR} pchDesc Pointer to a Unicode string that contains the new description of the preserved key. This cannot be <b>NULL</b> unless <i>cchDesc</i> is zero.
     * @param {Integer} cchDesc Number of characters in <i>pchDesc</i>. Pass zero for this parameter if no description is required.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * One or more parameters are invalid or the preserved key is not found.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-setpreservedkeydescription
     */
    SetPreservedKeyDescription(rguid, pchDesc, cchDesc) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(14, this, "ptr", rguid, "ptr", pchDesc, "uint", cchDesc, "HRESULT")
        return result
    }

    /**
     * ITfKeystrokeMgr::GetPreservedKeyDescription method
     * @param {Pointer<Guid>} rguid Contains the command GUID of the preserved key.
     * @returns {BSTR} Pointer to a BSTR value the receives the description string. The caller must free this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-getpreservedkeydescription
     */
    GetPreservedKeyDescription(rguid) {
        pbstrDesc := BSTR()
        result := ComCall(15, this, "ptr", rguid, "ptr", pbstrDesc, "HRESULT")
        return pbstrDesc
    }

    /**
     * ITfKeystrokeMgr::SimulatePreservedKey method
     * @param {ITfContext} pic Pointer to the application context. This value was returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a>.
     * @param {Pointer<Guid>} rguid Contains the command GUID of the preserved key.
     * @returns {BOOL} Pointer to a BOOL that indicates if the key event was handled. If this value receives <b>TRUE</b>, the key event was handled. If this value is <b>FALSE</b>, the key event was not handled.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeystrokemgr-simulatepreservedkey
     */
    SimulatePreservedKey(pic, rguid) {
        result := ComCall(16, this, "ptr", pic, "ptr", rguid, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }
}
