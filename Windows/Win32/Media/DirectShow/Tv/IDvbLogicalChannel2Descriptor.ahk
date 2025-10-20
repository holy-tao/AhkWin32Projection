#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getcountoflists
     */
    GetCountOfLists(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistid
     */
    GetListId(bListIndex, pbVal) {
        result := ComCall(10, this, "char", bListIndex, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistnamew
     */
    GetListNameW(bListIndex, convMode, pbstrName) {
        result := ComCall(11, this, "char", bListIndex, "int", convMode, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Pointer<Integer>} pszCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountrycode
     */
    GetListCountryCode(bListIndex, pszCode) {
        result := ComCall(12, this, "char", bListIndex, "char*", pszCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bChannelListIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistcountofrecords
     */
    GetListCountOfRecords(bChannelListIndex, pbVal) {
        result := ComCall(13, this, "char", bChannelListIndex, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordserviceid
     */
    GetListRecordServiceId(bListIndex, bRecordIndex, pwVal) {
        result := ComCall(14, this, "char", bListIndex, "char", bRecordIndex, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordlogicalchannelnumber
     */
    GetListRecordLogicalChannelNumber(bListIndex, bRecordIndex, pwVal) {
        result := ComCall(15, this, "char", bListIndex, "char", bRecordIndex, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblogicalchannel2descriptor-getlistrecordlogicalchannelandvisibility
     */
    GetListRecordLogicalChannelAndVisibility(bListIndex, bRecordIndex, pwVal) {
        result := ComCall(16, this, "char", bListIndex, "char", bRecordIndex, "ushort*", pwVal, "HRESULT")
        return result
    }
}
