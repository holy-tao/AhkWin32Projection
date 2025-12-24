#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterFileSink.ahk

/**
 * The IWMWriterFileSink2 interface provides extended management of a file sink.This interface can be obtained by calling the QueryInterface method of an IWMWriterFileSink interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterfilesink2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterFileSink2 extends IWMWriterFileSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterFileSink2
     * @type {Guid}
     */
    static IID => Guid("{14282ba7-4aef-4205-8ce5-c229035a05bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "IsStopped", "GetFileDuration", "GetFileSize", "Close", "IsClosed"]

    /**
     * The Start method starts recording at the specified time.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-start
     */
    Start(cnsStartTime) {
        result := ComCall(9, this, "uint", cnsStartTime, "HRESULT")
        return result
    }

    /**
     * The Stop method stops recording at the specified time.
     * @param {Integer} cnsStopTime Stop time in 100-nanosecond units.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-stop
     */
    Stop(cnsStopTime) {
        result := ComCall(10, this, "uint", cnsStopTime, "HRESULT")
        return result
    }

    /**
     * The IsStopped method ascertains whether the file sink has stopped writing.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if writing has stopped.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-isstopped
     */
    IsStopped() {
        result := ComCall(11, this, "int*", &pfStopped := 0, "HRESULT")
        return pfStopped
    }

    /**
     * The GetFileDuration method retrieves the duration of the portion of the file that has been written.
     * @returns {Integer} Pointer to variable specifying the duration, in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-getfileduration
     */
    GetFileDuration() {
        result := ComCall(12, this, "uint*", &pcnsDuration := 0, "HRESULT")
        return pcnsDuration
    }

    /**
     * The GetFileSize method retrieves the size of the file.
     * @returns {Integer} Pointer to a count of the bytes in the file.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-getfilesize
     */
    GetFileSize() {
        result := ComCall(13, this, "uint*", &pcbFile := 0, "HRESULT")
        return pcbFile
    }

    /**
     * The Close method closes the sink.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-close
     */
    Close() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The IsClosed method ascertains whether the file sink has been closed.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if the file sink has been closed.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-isclosed
     */
    IsClosed() {
        result := ComCall(15, this, "int*", &pfClosed := 0, "HRESULT")
        return pfClosed
    }
}
