#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IWMWriterFileSink.ahk" { IWMWriterFileSink }

/**
 * The IWMWriterFileSink2 interface provides extended management of a file sink.This interface can be obtained by calling the QueryInterface method of an IWMWriterFileSink interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwriterfilesink2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWriterFileSink2 extends IWMWriterFileSink {
    /**
     * The interface identifier for IWMWriterFileSink2
     * @type {Guid}
     */
    static IID := Guid("{14282ba7-4aef-4205-8ce5-c229035a05bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWriterFileSink2 interfaces
    */
    struct Vtbl extends IWMWriterFileSink.Vtbl {
        Start           : IntPtr
        Stop            : IntPtr
        IsStopped       : IntPtr
        GetFileDuration : IntPtr
        GetFileSize     : IntPtr
        Close           : IntPtr
        IsClosed        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWriterFileSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Start method starts recording at the specified time.
     * @remarks
     * It is not necessary to call this method unless the sink has been stopped. The sink automatically starts (at time 0) when it is added to the writer by using <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-addsink">IWMWriterAdvanced::AddSink</a>.
     * 
     * Because of interleaving of streams with slightly different time stamps at any particular point in the file, the actual start time might not be exactly as specified in <i>cnsStartTime</i>. To increase the precision, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setcontrolstream">IWMWriterFileSink3::SetControlStream</a>.
     * @param {Integer} cnsStartTime Start time in 100-nanosecond units.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested start time precedes the last stop time.
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
     * Not enough memory to complete the task.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-start
     */
    Start(cnsStartTime) {
        result := ComCall(9, this, "uint", cnsStartTime, "HRESULT")
        return result
    }

    /**
     * The Stop method stops recording at the specified time.
     * @remarks
     * Because of interleaving of streams with slightly different time stamps at any particular point in the file, the actual stop time might not be exactly as specified in <i>cnsStopTime</i>. To increase the precision, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setcontrolstream">IWMWriterFileSink3::SetControlStream</a>.
     * @param {Integer} cnsStopTime Stop time in 100-nanosecond units.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-stop
     */
    Stop(cnsStopTime) {
        result := ComCall(10, this, "uint", cnsStopTime, "HRESULT")
        return result
    }

    /**
     * The IsStopped method ascertains whether the file sink has stopped writing.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if writing has stopped.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-isstopped
     */
    IsStopped() {
        result := ComCall(11, this, BOOL.Ptr, &pfStopped := 0, "HRESULT")
        return pfStopped
    }

    /**
     * The GetFileDuration method retrieves the duration of the portion of the file that has been written.
     * @returns {Integer} Pointer to variable specifying the duration, in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-getfileduration
     */
    GetFileDuration() {
        result := ComCall(12, this, "uint*", &pcnsDuration := 0, "HRESULT")
        return pcnsDuration
    }

    /**
     * The GetFileSize method retrieves the size of the file.
     * @returns {Integer} Pointer to a count of the bytes in the file.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-getfilesize
     */
    GetFileSize() {
        result := ComCall(13, this, "uint*", &pcbFile := 0, "HRESULT")
        return pcbFile
    }

    /**
     * The Close method closes the sink.
     * @remarks
     * See the Remarks and Example Code sections for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-close
     */
    Close() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The IsClosed method ascertains whether the file sink has been closed.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if the file sink has been closed.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-isclosed
     */
    IsClosed() {
        result := ComCall(15, this, BOOL.Ptr, &pfClosed := 0, "HRESULT")
        return pfClosed
    }

    Query(iid) {
        if (IWMWriterFileSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 2)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 2)
        this.vtbl.IsStopped := CallbackCreate(GetMethod(implObj, "IsStopped"), flags, 2)
        this.vtbl.GetFileDuration := CallbackCreate(GetMethod(implObj, "GetFileDuration"), flags, 2)
        this.vtbl.GetFileSize := CallbackCreate(GetMethod(implObj, "GetFileSize"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.IsClosed := CallbackCreate(GetMethod(implObj, "IsClosed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.IsStopped)
        CallbackFree(this.vtbl.GetFileDuration)
        CallbackFree(this.vtbl.GetFileSize)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.IsClosed)
    }
}
