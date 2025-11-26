#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbtsinformationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbTSInformationDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbTSInformationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{d7ad183e-38f5-4210-b55f-ec8d601bbd47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetRemoteControlKeyId", "GetTSNameW", "GetCountOfRecords", "GetRecordTransmissionTypeInfo", "GetRecordNumberOfServices", "GetRecordServiceIdByIndex"]

    /**
     * Receives the tag that identifies an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @returns {Integer} Receives the tag value. For ISDB TS information descriptors, this value is 0xCD.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @returns {Integer} Receives the body length of the descriptor, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the remote_control_key_id field value from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @returns {Integer} Receives the remote_control_key_id field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getremotecontrolkeyid
     */
    GetRemoteControlKeyId() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the transport stream name from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor, in Unicode string format.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the transport stream name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-gettsnamew
     */
    GetTSNameW(convMode) {
        pbstrName := BSTR()
        result := ComCall(6, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @returns {Integer} Receives the number of descriptor records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the transmission_type_info field from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbTSInformationDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Receives the transmission_type_info field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordtransmissiontypeinfo
     */
    GetRecordTransmissionTypeInfo(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of service records from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getcountofrecords">IIsdbTSInformationDescriptor::GetCountOfRecords</a>.
     * @returns {Integer} Receives the number of service records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordnumberofservices
     */
    GetRecordNumberOfServices(bRecordIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a service identifier from a specified service record in an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbTSInformationDescriptor::GetCountOfRecords</a>.
     * @param {Integer} bServiceIndex Zero-based index of the service identifier to return. To get the number of identifiers, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordnumberofservices">IIsdbTSInformationDescriptor::GetRecordNumberOfServices</a>.
     * @returns {Integer} Receives the service identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordserviceidbyindex
     */
    GetRecordServiceIdByIndex(bRecordIndex, bServiceIndex) {
        result := ComCall(10, this, "char", bRecordIndex, "char", bServiceIndex, "ushort*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }
}
