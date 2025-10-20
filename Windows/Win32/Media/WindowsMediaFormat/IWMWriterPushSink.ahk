#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterSink.ahk

/**
 * The IWMWriterPushSink interface enables the application to send ASF files to a publishing point on a Windows Media server.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterpushsink
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterPushSink extends IWMWriterSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterPushSink
     * @type {Guid}
     */
    static IID => Guid("{dc10e6a5-072c-467d-bf57-6330a9dde12a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "EndSession"]

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {PWSTR} pwszTemplateURL 
     * @param {BOOL} fAutoDestroy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-connect
     */
    Connect(pwszURL, pwszTemplateURL, fAutoDestroy) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        pwszTemplateURL := pwszTemplateURL is String ? StrPtr(pwszTemplateURL) : pwszTemplateURL

        result := ComCall(8, this, "ptr", pwszURL, "ptr", pwszTemplateURL, "int", fAutoDestroy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-disconnect
     */
    Disconnect() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-endsession
     */
    EndSession() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
