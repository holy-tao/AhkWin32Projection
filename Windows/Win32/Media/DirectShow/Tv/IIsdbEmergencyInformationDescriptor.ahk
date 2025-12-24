#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) emergency information descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbemergencyinformationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbEmergencyInformationDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbEmergencyInformationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{ba6fa681-b973-4da1-9207-ac3e7f0341eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCountOfRecords", "GetServiceId", "GetStartEndFlag", "GetSignalLevel", "GetAreaCode"]

    /**
     * Gets the tag that identifies an emergency information descriptor.
     * @returns {Integer} Receives the tag value. For emergency information descriptors, this value is 0xFC.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an emergency information descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of records in an emergency information descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier for a broadcasting event from an emergency information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the emergency information descriptor that contains the event identifiers. To get the number of emergency information descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords">IIsdbEmergencyInformationDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Receives the broadcasting event identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getserviceid
     */
    GetServiceId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the start_end_flag field from an emergency information descriptor. This field indicates whether the emergency alarm signal has started or finished broadcasting.
     * @param {Integer} bRecordIndex Zero-based index of the service information (SI) descriptor containing the table descriptor. To get the number of SI descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords">IIsdbEmergencyInformationDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Gets the start/end flag from the descriptor. If this value is 1, the emergency signal has started or is being broadcast. If it is 0, the emergency signal broadcast has ended.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getstartendflag
     */
    GetStartEndFlag(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets a flag that indicates the emergency alarm signal type from an emergency information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the emergency information descriptor that contains the emergency alarm signal. To get the number of emergency information descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords">IIsdbEmergencyInformationDescriptor::GetCountOfRecords</a>.
     * @returns {Integer} Receives a boolean value that indicates whether the emergency alarm signal is the first (0) or second (1) type of start signal. Annex D of the document titled <i>SERVICE INFORMATION FOR DIGITAL
     * BROADCASTING SYSTEM,
     * ARIB STANDARD,
     * ARIB STD-B10, Version 4.4</i> describes the two start signal types.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getsignallevel
     */
    GetSignalLevel(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the area codes from an emergency information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the emergency information descriptor that contains the area code records. To get the number of area code records, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords">IIsdbEmergencyInformationDescriptor::GetCountOfRecords</a>.
     * @param {Pointer<Pointer<Integer>>} ppwVal Pointer to a buffer allocated to hold the area codes. The caller is responsible for freeing this memory.
     * @param {Pointer<Integer>} pbNumAreaCodes Receives the number of area codes in the descriptor.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getareacode
     */
    GetAreaCode(bRecordIndex, ppwVal, pbNumAreaCodes) {
        ppwValMarshal := ppwVal is VarRef ? "ptr*" : "ptr"
        pbNumAreaCodesMarshal := pbNumAreaCodes is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "char", bRecordIndex, ppwValMarshal, ppwVal, pbNumAreaCodesMarshal, pbNumAreaCodes, "HRESULT")
        return result
    }
}
