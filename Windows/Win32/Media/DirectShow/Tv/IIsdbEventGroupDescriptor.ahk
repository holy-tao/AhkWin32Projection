#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbeventgroupdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbEventGroupDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbEventGroupDescriptor
     * @type {Guid}
     */
    static IID => Guid("{94b06780-2e2a-44dc-a966-cc56fdabc6c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetGroupType", "GetCountOfRecords", "GetRecordEvent", "GetCountOfRefRecords", "GetRefRecordEvent"]

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-gettag
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getlength
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getgrouptype
     */
    GetGroupType(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getcountofrecords
     */
    GetCountOfRecords(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pwServiceId 
     * @param {Pointer<Integer>} pwEventId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getrecordevent
     */
    GetRecordEvent(bRecordIndex, pwServiceId, pwEventId) {
        result := ComCall(7, this, "char", bRecordIndex, "ushort*", pwServiceId, "ushort*", pwEventId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getcountofrefrecords
     */
    GetCountOfRefRecords(pbVal) {
        result := ComCall(8, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pwOriginalNetworkId 
     * @param {Pointer<Integer>} pwTransportStreamId 
     * @param {Pointer<Integer>} pwServiceId 
     * @param {Pointer<Integer>} pwEventId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getrefrecordevent
     */
    GetRefRecordEvent(bRecordIndex, pwOriginalNetworkId, pwTransportStreamId, pwServiceId, pwEventId) {
        result := ComCall(9, this, "char", bRecordIndex, "ushort*", pwOriginalNetworkId, "ushort*", pwTransportStreamId, "ushort*", pwServiceId, "ushort*", pwEventId, "HRESULT")
        return result
    }
}
