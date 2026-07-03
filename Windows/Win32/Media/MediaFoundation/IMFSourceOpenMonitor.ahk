#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaEvent.ahk" { IMFMediaEvent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback interface to receive notifications from a network source on the progress of an asynchronous open operation.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsourceopenmonitor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSourceOpenMonitor extends IUnknown {
    /**
     * The interface identifier for IMFSourceOpenMonitor
     * @type {Guid}
     */
    static IID := Guid("{059054b3-027c-494c-a27d-9113291cf87f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSourceOpenMonitor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSourceEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSourceOpenMonitor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the network source when the open operation begins or ends.
     * @remarks
     * The networks source calls this method with the following event types.
     * 
     * <ul>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/meconnectstart">MEConnectStart</a>
     * 
     * 
     * </li>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/meconnectend">MEConnectEnd</a>
     * 
     * 
     * </li>
     * </ul>
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/how-to-get-events-from-the-network-source">How to Get Events from the Network Source</a>.
     * @param {IMFMediaEvent} pEvent Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsourceopenmonitor-onsourceevent
     */
    OnSourceEvent(pEvent) {
        result := ComCall(3, this, "ptr", pEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSourceOpenMonitor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSourceEvent := CallbackCreate(GetMethod(implObj, "OnSourceEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSourceEvent)
    }
}
