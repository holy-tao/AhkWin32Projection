#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMetadataEditor.ahk

/**
 * The IWMMetadataEditor2 interface provides an improved method for opening files for metadata operations.This interface is implemented as part of the metadata editor object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmmetadataeditor2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMMetadataEditor2 extends IWMMetadataEditor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMMetadataEditor2
     * @type {Guid}
     */
    static IID => Guid("{203cffe3-2e18-4fdf-b59d-6e71530534cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenEx"]

    /**
     * 
     * @param {PWSTR} pwszFilename 
     * @param {Integer} dwDesiredAccess 
     * @param {Integer} dwShareMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmetadataeditor2-openex
     */
    OpenEx(pwszFilename, dwDesiredAccess, dwShareMode) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(6, this, "ptr", pwszFilename, "uint", dwDesiredAccess, "uint", dwShareMode, "HRESULT")
        return result
    }
}
