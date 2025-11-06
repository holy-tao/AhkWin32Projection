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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists
     */
    GetCountOfLists() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistid
     */
    GetListId(bListIndex) {
        result := ComCall(10, this, "char", bListIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistnamew
     */
    GetListNameW(bListIndex, convMode) {
        pbstrName := BSTR()
        result := ComCall(11, this, "char", bListIndex, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountrycode
     */
    GetListCountryCode(bListIndex) {
        result := ComCall(12, this, "char", bListIndex, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * 
     * @param {Integer} bChannelListIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords
     */
    GetListCountOfRecords(bChannelListIndex) {
        result := ComCall(13, this, "char", bChannelListIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordserviceid
     */
    GetListRecordServiceId(bListIndex, bRecordIndex) {
        result := ComCall(14, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordlogicalchannelnumber
     */
    GetListRecordLogicalChannelNumber(bListIndex, bRecordIndex) {
        result := ComCall(15, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordlogicalchannelandvisibility
     */
    GetListRecordLogicalChannelAndVisibility(bListIndex, bRecordIndex) {
        result := ComCall(16, this, "char", bListIndex, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }
}
