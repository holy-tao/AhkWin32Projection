#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMouseTracker interface is implemented by the TSF manager and is used by a text service to manage mouse event notification sinks. An instance of this interface is obtained by querying an ITfContext object for IID_ITfMouseTracker.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfmousetracker
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMouseTracker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfMouseTracker
     * @type {Guid}
     */
    static IID => Guid("{09d146cd-a544-4132-925b-7afa8ef322d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseMouseSink", "UnadviseMouseSink"]

    /**
     * ITfMouseTracker::AdviseMouseSink method
     * @param {ITfRange} range Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that specifies the range of text that the mouse sink is installed for.
     * @param {ITfMouseSink} pSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfmousesink">ITfMouseSink</a> interface.
     * @returns {Integer} Pointer to a DWORD value that receives a cookie that identifies the mouse event sink.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfmousetracker-advisemousesink
     */
    AdviseMouseSink(range, pSink) {
        result := ComCall(3, this, "ptr", range, "ptr", pSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * ITfMouseTracker::UnadviseMouseSink method
     * @param {Integer} dwCookie Specifies the mouse advise sink identifier. This value is obtained by a call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfmousetracker-advisemousesink">ITfMouseTracker::AdviseMouseSink</a>.
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
     * <dt><b>TF_E_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context object is not on a document stack.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context owner does not support mouse event sinks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfmousetracker-unadvisemousesink
     */
    UnadviseMouseSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
