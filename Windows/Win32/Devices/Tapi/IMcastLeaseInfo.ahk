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
     * @type {BSTR} 
     */
    RequestID {
        get => this.get_RequestID()
    }

    /**
     * @type {Float} 
     */
    LeaseStartTime {
        get => this.get_LeaseStartTime()
        set => this.put_LeaseStartTime(value)
    }

    /**
     * @type {Float} 
     */
    LeaseStopTime {
        get => this.get_LeaseStopTime()
        set => this.put_LeaseStopTime(value)
    }

    /**
     * @type {Integer} 
     */
    AddressCount {
        get => this.get_AddressCount()
    }

    /**
     * @type {BSTR} 
     */
    ServerAddress {
        get => this.get_ServerAddress()
    }

    /**
     * @type {Integer} 
     */
    TTL {
        get => this.get_TTL()
    }

    /**
     * @type {VARIANT} 
     */
    Addresses {
        get => this.get_Addresses()
    }

    /**
     * The get_RequestID method obtains the request ID for a lease.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive the request ID for this lease. The request ID uniquely identifies this lease request to the server.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-get_requestid
     */
    get_RequestID() {
        ppRequestID := BSTR()
        result := ComCall(7, this, "ptr", ppRequestID, "HRESULT")
        return ppRequestID
    }

    /**
     * The get_LeaseStartTime method obtains the start time of the lease.
     * @returns {Float} Pointer to a <b>DATE</b> that will receive the start time of the lease.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-get_leasestarttime
     */
    get_LeaseStartTime() {
        result := ComCall(8, this, "double*", &pTime := 0, "HRESULT")
        return pTime
    }

    /**
     * The put_LeaseStartTime method sets the start time of the lease. This method, along with put_LeaseStopTime, allows renewal of a lease without calling IMcastAddressAllocation::CreateLeaseInfo.
     * @param {Float} time A <b>DATE</b> specifying the start time of the lease.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Format conversion failed for the start time or stop time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-put_leasestarttime
     */
    put_LeaseStartTime(time) {
        result := ComCall(9, this, "double", time, "HRESULT")
        return result
    }

    /**
     * The get_LeaseStopTime method obtains the stop time of the lease.
     * @returns {Float} Pointer to a <b>DATE</b> that will receive the stop time of the lease.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-get_leasestoptime
     */
    get_LeaseStopTime() {
        result := ComCall(10, this, "double*", &pTime := 0, "HRESULT")
        return pTime
    }

    /**
     * The put_LeaseStopTime method sets the stop time of the lease. This method, along with put_LeaseStartTime, allows you to renew a lease without calling IMcastAddressAllocation::CreateLeaseInfo.
     * @param {Float} time A <b>DATE</b> specifying the stop time of the lease.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Format conversion failed for the start time or stop time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-put_leasestoptime
     */
    put_LeaseStopTime(time) {
        result := ComCall(11, this, "double", time, "HRESULT")
        return result
    }

    /**
     * The get_AddressCount method obtains the number of addresses requested or granted in this lease.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the number of addresses requested or granted in this lease.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-get_addresscount
     */
    get_AddressCount() {
        result := ComCall(12, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The get_ServerAddress method obtains a string representing the address of the multicast server granting this lease.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive a string representation of the address of the server granting this request or renewal.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-get_serveraddress
     */
    get_ServerAddress() {
        ppAddress := BSTR()
        result := ComCall(13, this, "ptr", ppAddress, "HRESULT")
        return ppAddress
    }

    /**
     * The get_TTL method obtains the time to live (TTL) value associated with this lease.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the TTL value associated with this lease.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-get_ttl
     */
    get_TTL() {
        result := ComCall(14, this, "int*", &pTTL := 0, "HRESULT")
        return pTTL
    }

    /**
     * The get_Addresses method obtains the collection of multicast addresses that are the subject of this lease or lease request. This method is primarily for Visual Basic and other scripting languages; C++ programmers use EnumerateAddresses instead.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> receiving an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of <b>BSTR</b> strings. Each string is an IP version 4 address in dotted quad notation (for example, 10.111.222.111).
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-get_addresses
     */
    get_Addresses() {
        pVariant := VARIANT()
        result := ComCall(15, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateAddresses method obtains the collection of multicast addresses that are the subject of this lease or lease request. This method is primarily for C++ programmers. Visual Basic and other scripting languages use get_Addresses instead.
     * @returns {IEnumBstr} Returns a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumbstr">IEnumBstr</a> object. 
     * <b>IEnumBstr</b> is a standard enumerator interface that enumerates BSTR strings. Each string is an IP version 4 address in dotted quad notation (for example, 10.111.222.111).
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastleaseinfo-enumerateaddresses
     */
    EnumerateAddresses() {
        result := ComCall(16, this, "ptr*", &ppEnumAddresses := 0, "HRESULT")
        return IEnumBstr(ppEnumAddresses)
    }
}
