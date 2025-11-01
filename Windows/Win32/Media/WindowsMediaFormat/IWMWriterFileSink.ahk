#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterSink.ahk

/**
 * The IWMWriterFileSink interface is used to open a file to which the writer can write data. The file sink object exposes this interface. To create the file sink object, call the WMCreateWriterFileSink function.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterfilesink
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterFileSink extends IWMWriterSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterFileSink
     * @type {Guid}
     */
    static IID => Guid("{96406be5-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open"]

    /**
     * 
     * @param {PWSTR} pwszFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink-open
     */
    Open(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(8, this, "ptr", pwszFilename, "HRESULT")
        return result
    }
}
