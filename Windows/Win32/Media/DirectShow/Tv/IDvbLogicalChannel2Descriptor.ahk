#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }
#Import ".\IDvbLogicalChannelDescriptor2.ahk" { IDvbLogicalChannelDescriptor2 }

/**
 * Implements methods that get data from a logical channel descriptor (LCD) in a Digital Video Broadcast (DVB) MPEG-2 stream that uses the format defined in the Nordig specification used in Scandinavian countries.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvblogicalchannel2descriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbLogicalChannel2Descriptor extends IDvbLogicalChannelDescriptor2 {
    /**
     * The interface identifier for IDvbLogicalChannel2Descriptor
     * @type {Guid}
     */
    static IID := Guid("{f69c3747-8a30-4980-998c-01fe7f0ba35a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbLogicalChannel2Descriptor interfaces
    */
    struct Vtbl extends IDvbLogicalChannelDescriptor2.Vtbl {
        GetCountOfLists                          : IntPtr
        GetListId                                : IntPtr
        GetListNameW                             : IntPtr
        GetListCountryCode                       : IntPtr
        GetListCountOfRecords                    : IntPtr
        GetListRecordServiceId                   : IntPtr
        GetListRecordLogicalChannelNumber        : IntPtr
        GetListRecordLogicalChannelAndVisibility : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbLogicalChannel2Descriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of channel lists in a Digital Video Broadcast (DVB) logical channel descriptor.
     * @returns {Integer} Receives the number of channel lists.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists
     */
    GetCountOfLists() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier for a channel list from a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a> method to get the number of channel list records in the logical channel descriptor.
     * @returns {Integer} Pointer to a byte that receives the channel list identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistid
     */
    GetListId(bListIndex) {
        result := ComCall(10, this, "char", bListIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the name of a channel list from a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a> method to get the number of channel list records in the logical channel descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to the memory block that receives the channel name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistnamew
     */
    GetListNameW(bListIndex, convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(11, this, "char", bListIndex, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the three-character ISO 3166 country code for a channel list in a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a> method to get the number of channel list records in the logical channel descriptor.
     * @returns {Integer} Pointer to a buffer that receives the country code. This code is a 3-character, null-terminated string, so the buffer must be at least four bytes long. The caller is responsible for releasing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountrycode
     */
    GetListCountryCode(bListIndex) {
        result := ComCall(12, this, "char", bListIndex, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets an indexed count of records for a channel list in a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bChannelListIndex Specifies the channel list number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchanneldescriptor-getcountofrecords">IDvbLogicalChannel2Descriptor::GetCountOfLists</a> method to get the number of channel lists in the logical channel descriptor.
     * @returns {Integer} Receives the number of channels in the list.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords
     */
    GetListCountOfRecords(bChannelListIndex) {
        result := ComCall(13, this, "char", bChannelListIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service identifier from a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists">IDvbLogicalChannel2Descriptor::GetCountOfLists</a> method to get the number of channel list records in the logical channel descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a> method to get the number of service records in the logical channel descriptor.
     * @returns {Integer} Receives the service identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordserviceid
     */
    GetListRecordServiceId(bListIndex, bRecordIndex) {
        result := ComCall(14, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the logical_channel_number field from a Digital Video Broadcast (DVB) logical channel descriptor. The logical_channel_number field gives the ordinal position of the service record in the descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists">IDvbLogicalChannel2Descriptor::GetCountOfLists</a> method to get the number of channel list records in the logical channel descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a> method to get the number of service records in the logical channel descriptor.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordlogicalchannelnumber
     */
    GetListRecordLogicalChannelNumber(bListIndex, bRecordIndex) {
        result := ComCall(15, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the visible_service_flag and logical_channel_number fields from a Digital Video Broadcast (DVB) logical channel descriptor.
     * @remarks
     * The combinations of visible_service_flag and local_channel_number field values have the following meanings.
     * 
     * <table>
     * <tr>
     * <th>visible_service_flag</th>
     * <th>logical_channel_number</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>0</td>
     * <td>  Service not suitable for selection by the user. For example, the value zero may
     * be used for data services intended only for selection from interactive
     * applications or for firmware download services.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>0</td>
     * <td>Reserved for future use.</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>1-1024</td>
     * <td>Reserved for future use.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>1-999</td>
     * <td>Service is displayed in service lists and Event Schedule Guide (ESG). Service is accessible via P+/- keys or from
     * numeric keys (same value as decimal value of logical_channel_number).</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>&gt; 999</td>
     * <td>Reserved.</td>
     * </tr>
     * </table>
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists">GetCountOfLists</a> method to get the number of channel list records in the logical channel descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">GetListCountOfRecords</a> method to get the number of service records in the logical channel descriptor.
     * @returns {Integer} Receives the visible_service_flag (defined by bit 15) and logical_channel_number (defined by bits 0 - 9) field values.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordlogicalchannelandvisibility
     */
    GetListRecordLogicalChannelAndVisibility(bListIndex, bRecordIndex) {
        result := ComCall(16, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    Query(iid) {
        if (IDvbLogicalChannel2Descriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCountOfLists := CallbackCreate(GetMethod(implObj, "GetCountOfLists"), flags, 2)
        this.vtbl.GetListId := CallbackCreate(GetMethod(implObj, "GetListId"), flags, 3)
        this.vtbl.GetListNameW := CallbackCreate(GetMethod(implObj, "GetListNameW"), flags, 4)
        this.vtbl.GetListCountryCode := CallbackCreate(GetMethod(implObj, "GetListCountryCode"), flags, 3)
        this.vtbl.GetListCountOfRecords := CallbackCreate(GetMethod(implObj, "GetListCountOfRecords"), flags, 3)
        this.vtbl.GetListRecordServiceId := CallbackCreate(GetMethod(implObj, "GetListRecordServiceId"), flags, 4)
        this.vtbl.GetListRecordLogicalChannelNumber := CallbackCreate(GetMethod(implObj, "GetListRecordLogicalChannelNumber"), flags, 4)
        this.vtbl.GetListRecordLogicalChannelAndVisibility := CallbackCreate(GetMethod(implObj, "GetListRecordLogicalChannelAndVisibility"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCountOfLists)
        CallbackFree(this.vtbl.GetListId)
        CallbackFree(this.vtbl.GetListNameW)
        CallbackFree(this.vtbl.GetListCountryCode)
        CallbackFree(this.vtbl.GetListCountOfRecords)
        CallbackFree(this.vtbl.GetListRecordServiceId)
        CallbackFree(this.vtbl.GetListRecordLogicalChannelNumber)
        CallbackFree(this.vtbl.GetListRecordLogicalChannelAndVisibility)
    }
}
