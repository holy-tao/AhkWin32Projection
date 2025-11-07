#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WMT_WATERMARK_ENTRY.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWatermarkInfo interface retrieves information about available watermarking systems.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwatermarkinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWatermarkInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWatermarkInfo
     * @type {Guid}
     */
    static IID => Guid("{6f497062-f2e2-4624-8ea7-9dd40d81fc8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWatermarkEntryCount", "GetWatermarkEntry"]

    /**
     * 
     * @param {Integer} wmetType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwatermarkinfo-getwatermarkentrycount
     */
    GetWatermarkEntryCount(wmetType) {
        result := ComCall(3, this, "int", wmetType, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} wmetType 
     * @param {Integer} dwEntryNum 
     * @returns {WMT_WATERMARK_ENTRY} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwatermarkinfo-getwatermarkentry
     */
    GetWatermarkEntry(wmetType, dwEntryNum) {
        pEntry := WMT_WATERMARK_ENTRY()
        result := ComCall(4, this, "int", wmetType, "uint", dwEntryNum, "ptr", pEntry, "HRESULT")
        return pEntry
    }
}
