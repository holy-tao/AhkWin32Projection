#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) service descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbcaservicedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbCAServiceDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbCAServiceDescriptor
     * @type {Guid}
     */
    static IID => Guid("{39cbeb97-ff0b-42a7-9ab9-7b9cfe70a77a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCASystemId", "GetCABroadcasterGroupId", "GetMessageControl", "GetServiceIds"]

    /**
     * Gets the tag that identifies a conditional access (CA) service descriptor.
     * @returns {Integer} Receives the tag value. For conditional access service descriptors, this value is 0xCC.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of conditional access (CA) service descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the conditional access (CA) system identifier from a CA service descriptor.
     * @returns {Integer} Receives the conditional access system identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getcasystemid
     */
    GetCASystemId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the conditional access (CA) broadcaster group identifier from a CA service descriptor.
     * @returns {Integer} Receives the conditional access broadcaster group identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getcabroadcastergroupid
     */
    GetCABroadcasterGroupId() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the delay time, in days, before the automatic entitlement management message (EMM) is displayed from a conditional access (CA) service descriptor.
     * @returns {Integer} Receives the number of days before the EMM message is displayed. A value of 0xFF indicates that the delay time is
     * disabled (that the start of the delay time has been put on hold).
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getmessagecontrol
     */
    GetMessageControl() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service identifier (ID) records from a conditional access (CA) service descriptor.
     * @param {Pointer<Integer>} pbNumServiceIds On input specifies the expected number of service ID records. On output returns the actual number of records.
     * @returns {Integer} Receives the service ID records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getserviceids
     */
    GetServiceIds(pbNumServiceIds) {
        pbNumServiceIdsMarshal := pbNumServiceIds is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbNumServiceIdsMarshal, pbNumServiceIds, "ushort*", &pwServiceIds := 0, "HRESULT")
        return pwServiceIds
    }
}
