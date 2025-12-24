#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IDvbLogicalChannelDescriptor2.ahk

/**
 * Implements methods that get data from a logical channel descriptor (LCD) in a Digital Video Broadcast (DVB) MPEG-2 stream that uses the format defined in the Nordig specification used in Scandinavian countries.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvblogicalchannel2descriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbLogicalChannel2Descriptor extends IDvbLogicalChannelDescriptor2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbLogicalChannel2Descriptor
     * @type {Guid}
     */
    static IID => Guid("{f69c3747-8a30-4980-998c-01fe7f0ba35a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCountOfLists", "GetListId", "GetListNameW", "GetListCountryCode", "GetListCountOfRecords", "GetListRecordServiceId", "GetListRecordLogicalChannelNumber", "GetListRecordLogicalChannelAndVisibility"]

    /**
     * Gets the number of channel lists in a Digital Video Broadcast (DVB) logical channel descriptor.
     * @returns {Integer} Receives the number of channel lists.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists
     */
    GetCountOfLists() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier for a channel list from a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a>method to get the number of channel list records in the logical channel descriptor.
     * @returns {Integer} Pointer to a byte that receives the channel list identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistid
     */
    GetListId(bListIndex) {
        result := ComCall(10, this, "char", bListIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the name of a channel list from a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a>method to get the number of channel list records in the logical channel descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to the memory block that receives the channel name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistnamew
     */
    GetListNameW(bListIndex, convMode) {
        pbstrName := BSTR()
        result := ComCall(11, this, "char", bListIndex, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the three-character ISO 3166 country code for a channel list in a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a>method to get the number of channel list records in the logical channel descriptor.
     * @returns {Integer} Pointer to a buffer that receives the country code. This code is a 3-character, null-terminated string, so the buffer must be at least four bytes long. The caller is responsible for releasing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountrycode
     */
    GetListCountryCode(bListIndex) {
        result := ComCall(12, this, "char", bListIndex, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets an indexed count of records for a channel list in a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bChannelListIndex Specifies the channel list number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchanneldescriptor-getcountofrecords">IDvbLogicalChannel2Descriptor::GetCountOfLists</a>method to get the number of channel lists in the logical channel descriptor.
     * @returns {Integer} Receives the number of channels in the list.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords
     */
    GetListCountOfRecords(bChannelListIndex) {
        result := ComCall(13, this, "char", bChannelListIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service identifier from a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists">IDvbLogicalChannel2Descriptor::GetCountOfLists</a>method to get the number of channel list records in the logical channel descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a>method to get the number of service records in the logical channel descriptor.
     * @returns {Integer} Receives the service identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordserviceid
     */
    GetListRecordServiceId(bListIndex, bRecordIndex) {
        result := ComCall(14, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the logical_channel_number field from a Digital Video Broadcast (DVB) logical channel descriptor. The logical_channel_number field gives the ordinal position of the service record in the descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists">IDvbLogicalChannel2Descriptor::GetCountOfLists</a>method to get the number of channel list records in the logical channel descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">IDvbLogicalChannel2Descriptor::GetListCountOfRecords</a>method to get the number of service records in the logical channel descriptor.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordlogicalchannelnumber
     */
    GetListRecordLogicalChannelNumber(bListIndex, bRecordIndex) {
        result := ComCall(15, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the visible_service_flag and logical_channel_number fields from a Digital Video Broadcast (DVB) logical channel descriptor.
     * @param {Integer} bListIndex Specifies the channel list record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists">GetCountOfLists</a>method to get the number of channel list records in the logical channel descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords">GetListCountOfRecords</a>method to get the number of service records in the logical channel descriptor.
     * @returns {Integer} Receives the visible_service_flag (defined by bit 15) and logical_channel_number (defined by bits 0 - 9) field values.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordlogicalchannelandvisibility
     */
    GetListRecordLogicalChannelAndVisibility(bListIndex, bRecordIndex) {
        result := ComCall(16, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }
}
