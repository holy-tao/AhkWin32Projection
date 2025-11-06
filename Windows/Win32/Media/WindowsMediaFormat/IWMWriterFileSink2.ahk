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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-isstopped
     */
    IsStopped() {
        result := ComCall(11, this, "int*", &pfStopped := 0, "HRESULT")
        return pfStopped
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-getfileduration
     */
    GetFileDuration() {
        result := ComCall(12, this, "uint*", &pcnsDuration := 0, "HRESULT")
        return pcnsDuration
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize() {
        result := ComCall(13, this, "uint*", &pcbFile := 0, "HRESULT")
        return pcbFile
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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink2-isclosed
     */
    IsClosed() {
        result := ComCall(15, this, "int*", &pfClosed := 0, "HRESULT")
        return pfClosed
    }
}
