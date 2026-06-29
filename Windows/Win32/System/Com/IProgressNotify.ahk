#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Enables applications and other objects to receive notifications of changes in the progress of a downloading operation.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iprogressnotify
 * @namespace Windows.Win32.System.Com
 */
export default struct IProgressNotify extends IUnknown {
    /**
     * The interface identifier for IProgressNotify
     * @type {Guid}
     */
    static IID := Guid("{a9d758a0-4617-11cf-95fc-00aa00680db4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProgressNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnProgress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProgressNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies registered objects and applications of the progress of a downloading operation.
     * @remarks
     * Sinks may be inherited by any substorage or substream of a given storage. If no sink is registered, the thread will block until the requested data becomes available, or the download is canceled by the downloader.
     * 
     * Where multiple objects or applications have registered progress notification sinks on a single stream, only one of them can control the behavior of a download. Ownership of the download goes to the first sink to register with the storage or stream, or any advise skinks that may have been inherited from the parent storage (if the storage was created with ASYNC_MODE_COMPATIBILITY.) 
     * 
     * Any one of the sinks can relinquish control to the next connection point by returning STG_S_MONITORING to the connection point making the current caller. After a connection point obtains control (through receiving STG_S_BLOCK or STG_S_RETRYNOW), all subsequent connection points calling <b>OnProgress</b> will set <i>fOwner</i> to <b>FALSE</b>.
     * @param {Integer} dwProgressCurrent The amount of data available.
     * @param {Integer} dwProgressMaximum The total amount of data to be downloaded.
     * @param {BOOL} fAccurate Indicates the accuracy of the values in <i>dwProgressCurrent</i> and <i>dwProgressMaximum</i>. They are either reliable (<b>TRUE</b>) or unreliable (<b>FALSE</b>). The <b>FALSE</b> value indicates that control structures for determining the actual position of, or amount of, data yet to be downloaded are not available.
     * @param {BOOL} fOwner Indicates whether this <b>OnProgress</b> call can control the blocking behavior of the operation. If <b>TRUE</b>, the caller can use return values from <b>OnProgress</b> to block (STG_S_BLOCK), retry (STG_S_RETRYNOW), or monitor (STG_S_MONITORING) the operation. If <b>FALSE</b>, the return value from <b>OnProgress</b> has no influence on blocking behavior.
     * @returns {HRESULT} This method can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_S_RETRYNOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is to retry the operation immediately. (This value is most useful for applications that do blocking from within the callback routine.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_S_BLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is to block the download and retry the call as needed to determine if additional data is available. This is the default behavior if no sinks are registered on the connection point.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_S_MONITORING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callback recipient relinquishes control of the downloading process to one of the other objects or applications that have registered progress notification sinks on the same stream. This is useful if the notification sink is interested only in gathering statistics.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is currently unavailable. The caller is to try again after some desired interval. The notification sink returns this value if the asynchronous storage is to operate in nonblocking mode.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iprogressnotify-onprogress
     */
    OnProgress(dwProgressCurrent, dwProgressMaximum, fAccurate, fOwner) {
        result := ComCall(3, this, "uint", dwProgressCurrent, "uint", dwProgressMaximum, BOOL, fAccurate, BOOL, fOwner, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProgressNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnProgress := CallbackCreate(GetMethod(implObj, "OnProgress"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnProgress)
    }
}
