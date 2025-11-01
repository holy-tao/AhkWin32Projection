#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMMetadataEditor interface is used to edit metadata information in ASF file headers. It is obtained by calling the WMCreateEditor function.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmmetadataeditor
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMMetadataEditor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMMetadataEditor
     * @type {Guid}
     */
    static IID => Guid("{96406bd9-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "Flush"]

    /**
     * 
     * @param {PWSTR} pwszFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmetadataeditor-open
     */
    Open(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(3, this, "ptr", pwszFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmetadataeditor-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmetadataeditor-flush
     */
    Flush() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
