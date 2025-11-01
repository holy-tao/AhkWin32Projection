#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMcastLeaseInfo interface exposes methods that can get or set information concerning a multicast address allocation. The IMcastLease object is created by calling IMcastAddressAllocation::CreateLeaseInfo.
 * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nn-mdhcp-imcastleaseinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IMcastLeaseInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcastLeaseInfo
     * @type {Guid}
     */
    static IID => Guid("{df0daefd-a289-11d1-8697-006008b0e5d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestID", "get_LeaseStartTime", "put_LeaseStartTime", "get_LeaseStopTime", "put_LeaseStopTime", "get_AddressCount", "get_ServerAddress", "get_TTL", "get_Addresses", "EnumerateAddresses"]

    /**
     * 
     * @param {Pointer<BSTR>} ppRequestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_requestid
     */
    get_RequestID(ppRequestID) {
        result := ComCall(7, this, "ptr", ppRequestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_leasestarttime
     */
    get_LeaseStartTime(pTime) {
        pTimeMarshal := pTime is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, pTimeMarshal, pTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-put_leasestarttime
     */
    put_LeaseStartTime(time) {
        result := ComCall(9, this, "double", time, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_leasestoptime
     */
    get_LeaseStopTime(pTime) {
        pTimeMarshal := pTime is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, pTimeMarshal, pTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-put_leasestoptime
     */
    put_LeaseStopTime(time) {
        result := ComCall(11, this, "double", time, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_addresscount
     */
    get_AddressCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_serveraddress
     */
    get_ServerAddress(ppAddress) {
        result := ComCall(13, this, "ptr", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTTL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_ttl
     */
    get_TTL(pTTL) {
        pTTLMarshal := pTTL is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pTTLMarshal, pTTL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_addresses
     */
    get_Addresses(pVariant) {
        result := ComCall(15, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBstr>} ppEnumAddresses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-enumerateaddresses
     */
    EnumerateAddresses(ppEnumAddresses) {
        result := ComCall(16, this, "ptr*", ppEnumAddresses, "HRESULT")
        return result
    }
}
