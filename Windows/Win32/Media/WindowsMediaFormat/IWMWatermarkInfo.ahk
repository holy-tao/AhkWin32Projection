#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMT_WATERMARK_ENTRY.ahk" { WMT_WATERMARK_ENTRY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WMT_WATERMARK_ENTRY_TYPE.ahk" { WMT_WATERMARK_ENTRY_TYPE }

/**
 * The IWMWatermarkInfo interface retrieves information about available watermarking systems.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwatermarkinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWatermarkInfo extends IUnknown {
    /**
     * The interface identifier for IWMWatermarkInfo
     * @type {Guid}
     */
    static IID := Guid("{6f497062-f2e2-4624-8ea7-9dd40d81fc8d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWatermarkInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWatermarkEntryCount : IntPtr
        GetWatermarkEntry      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWatermarkInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetWatermarkEntryCount method retrieves the total number of installed watermarking systems of a specified type. Use this method in conjunction with IWMWatermarkInfo::GetWatermarkEntry to enumerate the installed watermarking DMOs.
     * @remarks
     * No watermarking DMOs are provided with the Windows Media Format SDK. You can install third-party DMOs to use with your application.
     * @param {WMT_WATERMARK_ENTRY_TYPE} wmetType A value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_watermark_entry_type">WMT_WATERMARK_ENTRY_TYPE</a> enumeration type specifying the type of watermarking system..
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the number of watermark entries.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwatermarkinfo-getwatermarkentrycount
     */
    GetWatermarkEntryCount(wmetType) {
        result := ComCall(3, this, WMT_WATERMARK_ENTRY_TYPE, wmetType, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The GetWatermarkEntry method retrieves information about one available watermarking system.
     * @remarks
     * No watermarking <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">DMOs</a> are provided with the Windows Media Format SDK. You can install third-party DMOs to use with your application.
     * @param {WMT_WATERMARK_ENTRY_TYPE} wmetType A value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_watermark_entry_type">WMT_WATERMARK_ENTRY_TYPE</a> enumeration type specifying the type of watermarking system.
     * @param {Integer} dwEntryNum <b>DWORD</b> containing the watermark entry number. This number is between zero and one less than the number of watermark entries returned by <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwatermarkinfo-getwatermarkentrycount">IWMWatermarkInfo::GetWatermarkEntryCount</a>.
     * @returns {WMT_WATERMARK_ENTRY} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_watermark_entry">WMT_WATERMARK_ENTRY</a> structure containing information about the specified watermarking system.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwatermarkinfo-getwatermarkentry
     */
    GetWatermarkEntry(wmetType, dwEntryNum) {
        pEntry := WMT_WATERMARK_ENTRY()
        result := ComCall(4, this, WMT_WATERMARK_ENTRY_TYPE, wmetType, "uint", dwEntryNum, WMT_WATERMARK_ENTRY.Ptr, pEntry, "HRESULT")
        return pEntry
    }

    Query(iid) {
        if (IWMWatermarkInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWatermarkEntryCount := CallbackCreate(GetMethod(implObj, "GetWatermarkEntryCount"), flags, 3)
        this.vtbl.GetWatermarkEntry := CallbackCreate(GetMethod(implObj, "GetWatermarkEntry"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWatermarkEntryCount)
        CallbackFree(this.vtbl.GetWatermarkEntry)
    }
}
