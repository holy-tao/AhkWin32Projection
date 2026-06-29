#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\WindowsAndMessaging\MSG.ahk" { MSG }

/**
 * The ITfMessagePump interface is implemented by the TSF manager and is used by an application to obtain messages from the application message queue.
 * @remarks
 * If the application is Unicode, it should use the PeekMessageW and GetMessageW methods. Otherwise, the application should use the PeekMessageA and GetMessageA methods.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfmessagepump
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfMessagePump extends IUnknown {
    /**
     * The interface identifier for ITfMessagePump
     * @type {Guid}
     */
    static IID := Guid("{8f1b8ad8-0b6b-4874-90c5-bd76011e8f7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfMessagePump interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PeekMessageA : IntPtr
        GetMessageA  : IntPtr
        PeekMessageW : IntPtr
        GetMessageW  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfMessagePump.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfMessagePump::PeekMessageA method
     * @remarks
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, this method returns all available messages; that is, no range filtering is performed.
     * @param {Pointer<MSG>} pMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that receives message data.
     * @param {HWND} _hwnd Handle to the window whose messages are obtained. The window must belong to the current thread. If this value is <b>NULL</b>, this method obtains messages for any window owned by the calling thread.
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
        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, MSG.Ptr, pMsg, HWND, _hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, "uint", wRemoveMsg, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * ITfMessagePump::GetMessageA method
     * @remarks
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, this method returns all available messages; that is, no range filtering is performed.
     * @param {Pointer<MSG>} pMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that receives message data.
     * @param {HWND} _hwnd Handle to the window whose messages are obtained. The window must belong to the current thread. If this value is <b>NULL</b>, this method obtains messages for any window that belongs to the calling thread.
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
        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, MSG.Ptr, pMsg, HWND, _hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * ITfMessagePump::PeekMessageW method
     * @remarks
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, this method returns all available messages; that is, no range filtering is performed.
     * @param {Pointer<MSG>} pMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that receives message data.
     * @param {HWND} _hwnd Handle to the window whose messages are obtained. The window must belong to the current thread. If this value is <b>NULL</b>, this method obtains messages for any window that belongs to the calling thread.
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
        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, MSG.Ptr, pMsg, HWND, _hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, "uint", wRemoveMsg, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * ITfMessagePump::GetMessageW method
     * @remarks
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, this method returns all available messages; that is, no range filtering is performed.
     * @param {Pointer<MSG>} pMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that receives message data.
     * @param {HWND} _hwnd Handle to the window whose messages are obtained. The window must belong to the current thread. If this value is <b>NULL</b>, this method obtains messages for any window owned by the calling thread.
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
        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, MSG.Ptr, pMsg, HWND, _hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfMessagePump.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PeekMessageA := CallbackCreate(GetMethod(implObj, "PeekMessageA"), flags, 7)
        this.vtbl.GetMessageA := CallbackCreate(GetMethod(implObj, "GetMessageA"), flags, 6)
        this.vtbl.PeekMessageW := CallbackCreate(GetMethod(implObj, "PeekMessageW"), flags, 7)
        this.vtbl.GetMessageW := CallbackCreate(GetMethod(implObj, "GetMessageW"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PeekMessageA)
        CallbackFree(this.vtbl.GetMessageA)
        CallbackFree(this.vtbl.PeekMessageW)
        CallbackFree(this.vtbl.GetMessageW)
    }
}
