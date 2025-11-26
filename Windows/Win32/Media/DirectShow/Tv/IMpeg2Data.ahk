#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISectionList.ahk
#Include .\IMpeg2Stream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * IMpeg2Data is no longer available for use as of Windows 7.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMpeg2Data)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nn-mpeg2data-impeg2data
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMpeg2Data extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMpeg2Data
     * @type {Guid}
     */
    static IID => Guid("{9b396d40-f380-4e3c-a514-1a82bf6ebfe6}")

    /**
     * The class identifier for Mpeg2Data
     * @type {Guid}
     */
    static CLSID => Guid("{c666e115-bb62-4027-a113-82d643fe2d99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSection", "GetTable", "GetStreamOfSections"]

    /**
     * GetSection is no longer available for use as of Windows 7.
     * @param {Integer} pid Specifies the packet identifier (PID) of the transport stream packets to examine.
     * @param {Integer} tid Specifies the table identifier (TID) of the section to retrieve.
     * @param {Pointer<MPEG2_FILTER>} pFilter Optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter">MPEG2_FILTER</a> structure. The caller can use this parameter to exclude packets based on additional MPEG-2 header fields. This parameter can be <b>NULL</b>.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive a matching section within the time-out period, the method fails.
     * @returns {ISectionList} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface pointer. Use this interface to retrieve the section data. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2data-getsection
     */
    GetSection(pid, tid, pFilter, dwTimeout) {
        result := ComCall(3, this, "ushort", pid, "char", tid, "ptr", pFilter, "uint", dwTimeout, "ptr*", &ppSectionList := 0, "HRESULT")
        return ISectionList(ppSectionList)
    }

    /**
     * GetTable is no longer available for use as of Windows 7.
     * @param {Integer} pid Specifies the packet identifier (PID) of the transport stream packets to examine.
     * @param {Integer} tid Specifies the table identifier (TID) of the section to retrieve.
     * @param {Pointer<MPEG2_FILTER>} pFilter Optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter">MPEG2_FILTER</a> structure. The caller can use this parameter to exclude packets based on additional MPEG-2 header fields. This parameter can be <b>NULL</b>.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive a matching section within the time-out period, the method fails.
     * @returns {ISectionList} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface pointer. Use this interface to retrieve the section data. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2data-gettable
     */
    GetTable(pid, tid, pFilter, dwTimeout) {
        result := ComCall(4, this, "ushort", pid, "char", tid, "ptr", pFilter, "uint", dwTimeout, "ptr*", &ppSectionList := 0, "HRESULT")
        return ISectionList(ppSectionList)
    }

    /**
     * GetStreamOfSections is no longer available for use as of Windows 7.
     * @param {Integer} pid Specifies the packet identifier (PID) of the transport stream packets to examine.
     * @param {Integer} tid Specifies the table identifier (TID) of the section to retrieve.
     * @param {Pointer<MPEG2_FILTER>} pFilter Optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter">MPEG2_FILTER</a> structure. The caller can use this parameter to exclude packets based on additional MPEG-2 header fields. This parameter can be <b>NULL</b>.
     * @param {HANDLE} hDataReadyEvent Handle to an event created by the caller. The filter signals this event whenever it receives new data.
     * @returns {IMpeg2Stream} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2stream">IMpeg2Stream</a> interface pointer. The caller must release the interface. Use this interface to retrieve the data when it arrives.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2data-getstreamofsections
     */
    GetStreamOfSections(pid, tid, pFilter, hDataReadyEvent) {
        hDataReadyEvent := hDataReadyEvent is Win32Handle ? NumGet(hDataReadyEvent, "ptr") : hDataReadyEvent

        result := ComCall(5, this, "ushort", pid, "char", tid, "ptr", pFilter, "ptr", hDataReadyEvent, "ptr*", &ppMpegStream := 0, "HRESULT")
        return IMpeg2Stream(ppMpegStream)
    }
}
