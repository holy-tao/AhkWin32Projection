#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfMouseSink.ahk" { ITfMouseSink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfRangeACP.ahk" { ITfRangeACP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfMouseTrackerACP interface is implemented by an application to support mouse event sinks.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfmousetrackeracp
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfMouseTrackerACP extends IUnknown {
    /**
     * The interface identifier for ITfMouseTrackerACP
     * @type {Guid}
     */
    static IID := Guid("{3bdd78e2-c16e-47fd-b883-ce6facc1a208}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfMouseTrackerACP interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseMouseSink   : IntPtr
        UnadviseMouseSink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfMouseTrackerACP.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfMouseTrackerACP::AdviseMouseSink method
     * @remarks
     * When this advise sink is installed, a mouse event that occurs over the range specified by <i>range</i> will result in the mouse event sink <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfmousesink-onmouseevent">ITfMouseSink::OnMouseEvent</a> method being called.
     * 
     * The value placed in <i>pdwCookie</i> will be saved by the caller and passed to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfmousetrackeracp-unadvisemousesink">ITfMouseTrackerACP::UnadviseMouseSink</a> method to remove the mouse event sink.
     * @param {ITfRangeACP} range Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that specifies the range of text that the mouse sink is installed for.
     * @param {ITfMouseSink} pSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfmousesink">ITfMouseSink</a> interface. The application must increment this object reference count and save the interface.
     * @returns {Integer} Pointer to a DWORD that receives a cookie that identifies the mouse event sink.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmousetrackeracp-advisemousesink
     */
    AdviseMouseSink(range, pSink) {
        result := ComCall(3, this, "ptr", range, "ptr", pSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * ITfMouseTrackerACP::UnadviseMouseSink method
     * @remarks
     * The application must release the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfmousesink">ITfMouseSink</a> supplied in the <b>ITfMouseTrackerACP::AdviseMouseSink</b> call associated with <i>dwCookie</i>.
     * @param {Integer} dwCookie Specifies the mouse advise sink identifier. This value is obtained by a call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfmousetrackeracp-advisemousesink">ITfMouseTrackerACP::AdviseMouseSink</a>.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application does not support mouse event sinks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmousetrackeracp-unadvisemousesink
     */
    UnadviseMouseSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfMouseTrackerACP.IID.Equals(iid)) {
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
