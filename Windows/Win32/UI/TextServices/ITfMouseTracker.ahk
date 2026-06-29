#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfMouseSink.ahk" { ITfMouseSink }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfMouseTracker interface is implemented by the TSF manager and is used by a text service to manage mouse event notification sinks. An instance of this interface is obtained by querying an ITfContext object for IID_ITfMouseTracker.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfmousetracker
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfMouseTracker extends IUnknown {
    /**
     * The interface identifier for ITfMouseTracker
     * @type {Guid}
     */
    static IID := Guid("{09d146cd-a544-4132-925b-7afa8ef322d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfMouseTracker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseMouseSink   : IntPtr
        UnadviseMouseSink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfMouseTracker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfMouseTracker::AdviseMouseSink method
     * @remarks
     * When the advise sink is installed, a mouse event that occurs over the range specified by <i>range</i> will result in the mouse event sink <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfmousesink-onmouseevent">ITfMouseSink::OnMouseEvent</a> call.
     * 
     * The value placed in <i>pdwCookie</i> must be saved and passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfmousetracker-unadvisemousesink">ITfMouseTracker::UnadviseMouseSink</a> to remove the mouse event sink.
     * @param {ITfRange} range Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that specifies the range of text that the mouse sink is installed for.
     * @param {ITfMouseSink} pSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfmousesink">ITfMouseSink</a> interface.
     * @returns {Integer} Pointer to a DWORD value that receives a cookie that identifies the mouse event sink.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmousetracker-advisemousesink
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmousetracker-unadvisemousesink
     */
    UnadviseMouseSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfMouseTracker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdviseMouseSink := CallbackCreate(GetMethod(implObj, "AdviseMouseSink"), flags, 4)
        this.vtbl.UnadviseMouseSink := CallbackCreate(GetMethod(implObj, "UnadviseMouseSink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdviseMouseSink)
        CallbackFree(this.vtbl.UnadviseMouseSink)
    }
}
