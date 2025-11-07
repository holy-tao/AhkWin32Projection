#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumBstr.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_requestid
     */
    get_RequestID() {
        ppRequestID := BSTR()
        result := ComCall(7, this, "ptr", ppRequestID, "HRESULT")
        return ppRequestID
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_leasestarttime
     */
    get_LeaseStartTime() {
        result := ComCall(8, this, "double*", &pTime := 0, "HRESULT")
        return pTime
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_leasestoptime
     */
    get_LeaseStopTime() {
        result := ComCall(10, this, "double*", &pTime := 0, "HRESULT")
        return pTime
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_addresscount
     */
    get_AddressCount() {
        result := ComCall(12, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_serveraddress
     */
    get_ServerAddress() {
        ppAddress := BSTR()
        result := ComCall(13, this, "ptr", ppAddress, "HRESULT")
        return ppAddress
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_ttl
     */
    get_TTL() {
        result := ComCall(14, this, "int*", &pTTL := 0, "HRESULT")
        return pTTL
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_addresses
     */
    get_Addresses() {
        pVariant := VARIANT()
        result := ComCall(15, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @returns {IEnumBstr} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-enumerateaddresses
     */
    EnumerateAddresses() {
        result := ComCall(16, this, "ptr*", &ppEnumAddresses := 0, "HRESULT")
        return IEnumBstr(ppEnumAddresses)
    }
}
