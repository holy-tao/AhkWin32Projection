#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMessagePump interface is implemented by the TSF manager and is used by an application to obtain messages from the application message queue.
 * @remarks
 * If the application is Unicode, it should use the PeekMessageW and GetMessageW methods. Otherwise, the application should use the PeekMessageA and GetMessageA methods.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfmessagepump
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMessagePump extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfMessagePump
     * @type {Guid}
     */
    static IID => Guid("{8f1b8ad8-0b6b-4874-90c5-bd76011e8f7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PeekMessageA", "GetMessageA", "PeekMessageW", "GetMessageW"]

    /**
     * ITfMessagePump::PeekMessageA method
     * @remarks
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, this method returns all available messages; that is, no range filtering is performed.
     * @param {Pointer<MSG>} pMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that receives message data.
     * @param {HWND} _hwnd 
     * @param {Integer} wMsgFilterMin Specifies the lowest message value to obtain.
     * @param {Integer} wMsgFilterMax Specifies the highest message value to obtain.
     * @param {Integer} wRemoveMsg Specifies how messages are handled. For more information, see the <b>PeekMessage</b> function.
     * @param {Pointer<BOOL>} pfResult Pointer to a BOOL that receives the return value from the <b>PeekMessage</b> function.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmessagepump-peekmessagea
     */
    PeekMessageA(pMsg, _hwnd, wMsgFilterMin, wMsgFilterMax, wRemoveMsg, pfResult) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pMsg, "ptr", _hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, "uint", wRemoveMsg, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * ITfMessagePump::GetMessageA method
     * @remarks
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, this method returns all available messages; that is, no range filtering is performed.
     * @param {Pointer<MSG>} pMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that receives message data.
     * @param {HWND} _hwnd 
     * @param {Integer} wMsgFilterMin Specifies the lowest message value obtained.
     * @param {Integer} wMsgFilterMax Specifies the highest message value obtained.
     * @param {Pointer<BOOL>} pfResult Pointer to a BOOL value that receives the return value from the <b>GetMessage</b> function.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmessagepump-getmessagea
     */
    GetMessageA(pMsg, _hwnd, wMsgFilterMin, wMsgFilterMax, pfResult) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pMsg, "ptr", _hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * ITfMessagePump::PeekMessageW method
     * @remarks
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, this method returns all available messages; that is, no range filtering is performed.
     * @param {Pointer<MSG>} pMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that receives message data.
     * @param {HWND} _hwnd 
     * @param {Integer} wMsgFilterMin Specifies the lowest message value to obtain.
     * @param {Integer} wMsgFilterMax Specifies the highest message value to obtain.
     * @param {Integer} wRemoveMsg Specifies how messages are handled. For more information, see the <b>PeekMessage</b> function.
     * @param {Pointer<BOOL>} pfResult Pointer to a BOOL that receives the return value from the <b>PeekMessage</b> function.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmessagepump-peekmessagew
     */
    PeekMessageW(pMsg, _hwnd, wMsgFilterMin, wMsgFilterMax, wRemoveMsg, pfResult) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pMsg, "ptr", _hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, "uint", wRemoveMsg, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * ITfMessagePump::GetMessageW method
     * @remarks
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, this method returns all available messages; that is, no range filtering is performed.
     * @param {Pointer<MSG>} pMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that receives message data.
     * @param {HWND} _hwnd 
     * @param {Integer} wMsgFilterMin Specifies the lowest message value to obtain.
     * @param {Integer} wMsgFilterMax Specifies the highest message value to obtain.
     * @param {Pointer<BOOL>} pfResult Pointer to a BOOL that receives the return value from the <b>GetMessage</b> function.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmessagepump-getmessagew
     */
    GetMessageW(pMsg, _hwnd, wMsgFilterMin, wMsgFilterMax, pfResult) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pMsg, "ptr", _hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, pfResultMarshal, pfResult, "HRESULT")
        return result
    }
}
