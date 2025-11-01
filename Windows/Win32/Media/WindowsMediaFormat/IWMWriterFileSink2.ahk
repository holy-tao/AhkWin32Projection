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
     * 
     * @param {Integer} cnsStartTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-start
     */
    Start(cnsStartTime) {
        result := ComCall(9, this, "uint", cnsStartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cnsStopTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-stop
     */
    Stop(cnsStopTime) {
        result := ComCall(10, this, "uint", cnsStopTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfStopped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-isstopped
     */
    IsStopped(pfStopped) {
        result := ComCall(11, this, "ptr", pfStopped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcnsDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-getfileduration
     */
    GetFileDuration(pcnsDuration) {
        pcnsDurationMarshal := pcnsDuration is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pcnsDurationMarshal, pcnsDuration, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @param {Pointer<Integer>} pcbFile 
     * @returns {HRESULT} If the function succeeds, the return value is the low-order doubleword of the file size, and, if 
     *        <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the function puts the 
     *        high-order doubleword of the file size into the variable pointed to by that parameter.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is <b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. When 
     *        <i>lpFileSizeHigh</i> is <b>NULL</b>, the results returned for large 
     *        files are ambiguous, and you will not be able to determine the actual size of the file. It is recommended that 
     *        you use <a href="/windows/desktop/api/fileapi/nf-fileapi-getfilesizeex">GetFileSizeEx</a> instead.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b> and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return a value other than 
     *        <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize(pcbFile) {
        pcbFileMarshal := pcbFile is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pcbFileMarshal, pcbFile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-close
     */
    Close() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfClosed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-isclosed
     */
    IsClosed(pfClosed) {
        result := ComCall(15, this, "ptr", pfClosed, "HRESULT")
        return result
    }
}
