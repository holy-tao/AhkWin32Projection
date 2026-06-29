#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMpeg2Stream.ahk" { IMpeg2Stream }
#Import ".\MPEG2_FILTER.ahk" { MPEG2_FILTER }

/**
 * IMpeg2Data is no longer available for use as of Windows 7.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMpeg2Data)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nn-mpeg2data-impeg2data
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMpeg2Data extends IUnknown {
    /**
     * The interface identifier for IMpeg2Data
     * @type {Guid}
     */
    static IID := Guid("{9b396d40-f380-4e3c-a514-1a82bf6ebfe6}")

    /**
     * The class identifier for Mpeg2Data
     * @type {Guid}
     */
    static CLSID := Guid("{c666e115-bb62-4027-a113-82d643fe2d99}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMpeg2Data interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSection          : IntPtr
        GetTable            : IntPtr
        GetStreamOfSections : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMpeg2Data.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * GetSection is no longer available for use as of Windows 7.
     * @param {Integer} pid Specifies the packet identifier (PID) of the transport stream packets to examine.
     * @param {Integer} tid Specifies the table identifier (TID) of the section to retrieve.
     * @param {Pointer<MPEG2_FILTER>} pFilter Optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter">MPEG2_FILTER</a> structure. The caller can use this parameter to exclude packets based on additional MPEG-2 header fields. This parameter can be <b>NULL</b>.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive a matching section within the time-out period, the method fails.
     * @returns {ISectionList} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface pointer. Use this interface to retrieve the section data. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2data-getsection
     */
    GetSection(pid, tid, pFilter, dwTimeout) {
        result := ComCall(3, this, "ushort", pid, "char", tid, MPEG2_FILTER.Ptr, pFilter, "uint", dwTimeout, "ptr*", &ppSectionList := 0, "HRESULT")
        return ISectionList(ppSectionList)
    }

    /**
     * GetTable is no longer available for use as of Windows 7.
     * @remarks
     * You can use the <i>pFilter</i> parameter to specify the Table_ID_extension field or the version number field. Otherwise, the filter caches these values from the first section that matches the search criteria. It uses those values to match subsequent sections.
     * @param {Integer} pid Specifies the packet identifier (PID) of the transport stream packets to examine.
     * @param {Integer} tid Specifies the table identifier (TID) of the section to retrieve.
     * @param {Pointer<MPEG2_FILTER>} pFilter Optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter">MPEG2_FILTER</a> structure. The caller can use this parameter to exclude packets based on additional MPEG-2 header fields. This parameter can be <b>NULL</b>.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive a matching section within the time-out period, the method fails.
     * @returns {ISectionList} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface pointer. Use this interface to retrieve the section data. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2data-gettable
     */
    GetTable(pid, tid, pFilter, dwTimeout) {
        result := ComCall(4, this, "ushort", pid, "char", tid, MPEG2_FILTER.Ptr, pFilter, "uint", dwTimeout, "ptr*", &ppSectionList := 0, "HRESULT")
        return ISectionList(ppSectionList)
    }

    /**
     * GetStreamOfSections is no longer available for use as of Windows 7.
     * @param {Integer} pid Specifies the packet identifier (PID) of the transport stream packets to examine.
     * @param {Integer} tid Specifies the table identifier (TID) of the section to retrieve.
     * @param {Pointer<MPEG2_FILTER>} pFilter Optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter">MPEG2_FILTER</a> structure. The caller can use this parameter to exclude packets based on additional MPEG-2 header fields. This parameter can be <b>NULL</b>.
     * @param {HANDLE} hDataReadyEvent Handle to an event created by the caller. The filter signals this event whenever it receives new data.
     * @returns {IMpeg2Stream} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2stream">IMpeg2Stream</a> interface pointer. The caller must release the interface. Use this interface to retrieve the data when it arrives.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2data-getstreamofsections
     */
    GetStreamOfSections(pid, tid, pFilter, hDataReadyEvent) {
        result := ComCall(5, this, "ushort", pid, "char", tid, MPEG2_FILTER.Ptr, pFilter, HANDLE, hDataReadyEvent, "ptr*", &ppMpegStream := 0, "HRESULT")
        return IMpeg2Stream(ppMpegStream)
    }

    Query(iid) {
        if (IMpeg2Data.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSection := CallbackCreate(GetMethod(implObj, "GetSection"), flags, 6)
        this.vtbl.GetTable := CallbackCreate(GetMethod(implObj, "GetTable"), flags, 6)
        this.vtbl.GetStreamOfSections := CallbackCreate(GetMethod(implObj, "GetStreamOfSections"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSection)
        CallbackFree(this.vtbl.GetTable)
        CallbackFree(this.vtbl.GetStreamOfSections)
    }
}
