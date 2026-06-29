#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Blocks data flow from an active output pin.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ipinflowcontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IPinFlowControl extends IUnknown {
    /**
     * The interface identifier for IPinFlowControl
     * @type {Guid}
     */
    static IID := Guid("{c56e9858-dbf3-4f6b-8119-384af2060deb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPinFlowControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Block : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPinFlowControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Block method blocks or unblocks the flow of data from the pin.
     * @remarks
     * This method can be synchronous or asynchronous:
     * 
     * <ul>
     * <li>To call it asynchronously, use the <b>CreateEvent</b> function to create an event object. Pass the event handle in the <i>hEvent</i> parameter. The method returns immediately and signals the event when the operation has completed. Call a wait function such as <b>WaitForSingleObject</b> to wait for the event.</li>
     * <li>To call this method synchronously, set the <i>hEvent</i> parameter to <b>NULL</b>. The method blocks until it completes. The method might not complete until the pin is ready to deliver a sample. If the filter is paused, the method might block indefinitely. Therefore, you should not call this method synchronously from your main application thread.</li>
     * </ul>
     * @param {Integer} dwBlockFlags 
     * @param {HANDLE} hEvent Handle to an event object, or <b>NULL</b>. If this parameter is non-<b>NULL</b>, the method is asynchronous and returns immediately. The event is signaled when the operation completes. If this parameter is <b>NULL</b>, the method is synchronous and does not complete until the pin is blocked. If <i>dwBlockFlags</i> is zero, this parameter must be <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin is already unblocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_PIN_ALREADY_BLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin is already blocked on another thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_PIN_ALREADY_BLOCKED_ON_THIS_THREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin is already blocked on the calling thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipinflowcontrol-block
     */
    Block(dwBlockFlags, hEvent) {
        result := ComCall(3, this, "uint", dwBlockFlags, HANDLE, hEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPinFlowControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Block := CallbackCreate(GetMethod(implObj, "Block"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Block)
    }
}
