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
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @returns {Integer} Receives the tag value. For ISDB event group descriptors, this value is 0xD6.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) event group descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code that describes the event group type from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getgrouptype
     */
    GetGroupType() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of event records from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets data from an event record in an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the event record containing the data. To get the number of components, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbEventGrouptDescriptor::GetCountOfRecords</a>.
     * @param {Pointer<Integer>} pwServiceId Receives the value of the sevice_id field from the event record. This value identifies the information service and appears in the program_number field of the corresponding program map section.
     * @param {Pointer<Integer>} pwEventId Receives the value of  the event_id field from the related event record. This value identifies the event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getrecordevent
     */
    GetRecordEvent(bRecordIndex, pwServiceId, pwEventId) {
        pwServiceIdMarshal := pwServiceId is VarRef ? "ushort*" : "ptr"
        pwEventIdMarshal := pwEventId is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "char", bRecordIndex, pwServiceIdMarshal, pwServiceId, pwEventIdMarshal, pwEventId, "HRESULT")
        return result
    }

    /**
     * Gets the number of related event records from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @returns {Integer} Receives the number of related event records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getcountofrefrecords
     */
    GetCountOfRefRecords() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets data from a related event record in an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the related event record containing the data. To get the number of components, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbEventGrouptDescriptor::GetCountOfRecords</a>.
     * @param {Pointer<Integer>} pwOriginalNetworkId Receives the value of the original_network_id field from the related
     * event record. This value is transmitted at the time of event relay or event move across networks.
     * @param {Pointer<Integer>} pwTransportStreamId Receives the value of the transport_stream_id field from the related
     * event record. This value that is transmitted at the time of event relay or event move across networks.
     * @param {Pointer<Integer>} pwServiceId Receives the value of the sevice_id field from the related event record. This value identifies the related information service and appears in the program_number field of the corresponding program map section.
     * @param {Pointer<Integer>} pwEventId Receives the value of  the event_id field from the related event record. This value identifies the related event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getrefrecordevent
     */
    GetRefRecordEvent(bRecordIndex, pwOriginalNetworkId, pwTransportStreamId, pwServiceId, pwEventId) {
        pwOriginalNetworkIdMarshal := pwOriginalNetworkId is VarRef ? "ushort*" : "ptr"
        pwTransportStreamIdMarshal := pwTransportStreamId is VarRef ? "ushort*" : "ptr"
        pwServiceIdMarshal := pwServiceId is VarRef ? "ushort*" : "ptr"
        pwEventIdMarshal := pwEventId is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, "char", bRecordIndex, pwOriginalNetworkIdMarshal, pwOriginalNetworkId, pwTransportStreamIdMarshal, pwTransportStreamId, pwServiceIdMarshal, pwServiceId, pwEventIdMarshal, pwEventId, "HRESULT")
        return result
    }
}
