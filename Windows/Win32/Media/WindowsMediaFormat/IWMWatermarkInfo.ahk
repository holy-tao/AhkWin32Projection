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
     * The GetWatermarkEntryCount method retrieves the total number of installed watermarking systems of a specified type. Use this method in conjunction with IWMWatermarkInfo::GetWatermarkEntry to enumerate the installed watermarking DMOs.
     * @param {Integer} wmetType A value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_watermark_entry_type">WMT_WATERMARK_ENTRY_TYPE</a> enumeration type specifying the type of watermarking system..
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the number of watermark entries.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwatermarkinfo-getwatermarkentrycount
     */
    GetWatermarkEntryCount(wmetType) {
        result := ComCall(3, this, "int", wmetType, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The GetWatermarkEntry method retrieves information about one available watermarking system.
     * @param {Integer} wmetType A value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_watermark_entry_type">WMT_WATERMARK_ENTRY_TYPE</a> enumeration type specifying the type of watermarking system.
     * @param {Integer} dwEntryNum <b>DWORD</b> containing the watermark entry number. This number is between zero and one less than the number of watermark entries returned by <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwatermarkinfo-getwatermarkentrycount">IWMWatermarkInfo::GetWatermarkEntryCount</a>.
     * @returns {WMT_WATERMARK_ENTRY} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_watermark_entry">WMT_WATERMARK_ENTRY</a> structure containing information about the specified watermarking system.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwatermarkinfo-getwatermarkentry
     */
    GetWatermarkEntry(wmetType, dwEntryNum) {
        pEntry := WMT_WATERMARK_ENTRY()
        result := ComCall(4, this, "int", wmetType, "uint", dwEntryNum, "ptr", pEntry, "HRESULT")
        return pEntry
    }
}
