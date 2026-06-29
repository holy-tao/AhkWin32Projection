#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumBstr.ahk" { IEnumBstr }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IMcastLeaseInfo interface exposes methods that can get or set information concerning a multicast address allocation. The IMcastLease object is created by calling IMcastAddressAllocation::CreateLeaseInfo.
 * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nn-mdhcp-imcastleaseinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct IMcastLeaseInfo extends IDispatch {
    /**
     * The interface identifier for IMcastLeaseInfo
     * @type {Guid}
     */
    static IID := Guid("{df0daefd-a289-11d1-8697-006008b0e5d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMcastLeaseInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RequestID      : IntPtr
        get_LeaseStartTime : IntPtr
        put_LeaseStartTime : IntPtr
        get_LeaseStopTime  : IntPtr
        put_LeaseStopTime  : IntPtr
        get_AddressCount   : IntPtr
        get_ServerAddress  : IntPtr
        get_TTL            : IntPtr
        get_Addresses      : IntPtr
        EnumerateAddresses : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMcastLeaseInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppRequestID</i> parameter.
     * 			
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive the request ID for this lease. The request ID uniquely identifies this lease request to the server.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_requestid
     */
    get_RequestID() {
        ppRequestID := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, ppRequestID, "HRESULT")
        return ppRequestID
    }

    /**
     * The get_LeaseStartTime method obtains the start time of the lease.
     * @remarks
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @returns {Float} Pointer to a <b>DATE</b> that will receive the start time of the lease.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_leasestarttime
     */
    get_LeaseStartTime() {
        result := ComCall(8, this, "double*", &pTime := 0, "HRESULT")
        return pTime
    }

    /**
     * The put_LeaseStartTime method sets the start time of the lease. This method, along with put_LeaseStopTime, allows renewal of a lease without calling IMcastAddressAllocation::CreateLeaseInfo.
     * @remarks
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-put_leasestarttime
     */
    put_LeaseStartTime(time) {
        result := ComCall(9, this, "double", time, "HRESULT")
        return result
    }

    /**
     * The get_LeaseStopTime method obtains the stop time of the lease.
     * @remarks
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @returns {Float} Pointer to a <b>DATE</b> that will receive the stop time of the lease.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_leasestoptime
     */
    get_LeaseStopTime() {
        result := ComCall(10, this, "double*", &pTime := 0, "HRESULT")
        return pTime
    }

    /**
     * The put_LeaseStopTime method sets the stop time of the lease. This method, along with put_LeaseStartTime, allows you to renew a lease without calling IMcastAddressAllocation::CreateLeaseInfo.
     * @remarks
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-put_leasestoptime
     */
    put_LeaseStopTime(time) {
        result := ComCall(11, this, "double", time, "HRESULT")
        return result
    }

    /**
     * The get_AddressCount method obtains the number of addresses requested or granted in this lease.
     * @remarks
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the number of addresses requested or granted in this lease.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_addresscount
     */
    get_AddressCount() {
        result := ComCall(12, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The get_ServerAddress method obtains a string representing the address of the multicast server granting this lease.
     * @remarks
     * The <b>BSTR</b> string <i>ppAddress</i> is an IP version 4 address in dotted quad notation (for example, 10.111.222.111). If a lease information object does not describe a granted lease (for example, it was not returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-requestaddress">IMcastAddressAllocation::RequestAddress</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-renewaddress">IMcastAddressAllocation::RenewAddress</a>), the address is reported as the string "Unspecified".
     * 
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppAddress</i> parameter.
     * 			
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive a string representation of the address of the server granting this request or renewal.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_serveraddress
     */
    get_ServerAddress() {
        ppAddress := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, ppAddress, "HRESULT")
        return ppAddress
    }

    /**
     * The get_TTL method obtains the time to live (TTL) value associated with this lease.
     * @remarks
     * The TTL is more or less significant in the implementation of multicast routing. Generally, the higher the TTL value, the "larger" or more inclusive the multicast scope. Most applications need not address the TTL.
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the TTL value associated with this lease.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_ttl
     */
    get_TTL() {
        result := ComCall(14, this, "int*", &pTTL := 0, "HRESULT")
        return pTTL
    }

    /**
     * The get_Addresses method obtains the collection of multicast addresses that are the subject of this lease or lease request. This method is primarily for Visual Basic and other scripting languages; C++ programmers use EnumerateAddresses instead.
     * @remarks
     * Each address is an IP version 4 address represented as a <b>BSTR</b> in dotted quad notation (for example, 10.111.222.111).
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>IMcastLeaseInfo::get_Addresses</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> receiving an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of <b>BSTR</b> strings. Each string is an IP version 4 address in dotted quad notation (for example, 10.111.222.111).
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_addresses
     */
    get_Addresses() {
        pVariant := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateAddresses method obtains the collection of multicast addresses that are the subject of this lease or lease request. This method is primarily for C++ programmers. Visual Basic and other scripting languages use get_Addresses instead.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumbstr">IEnumBstr</a> interface returned by <b>IMcastLeaseInfo::EnumerateAddresses</b>. The application must call <b>Release</b> on the 
     * <b>IEnumBstr</b> interface to free resources associated with it.
     * @returns {IEnumBstr} Returns a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumbstr">IEnumBstr</a> object. 
     * <b>IEnumBstr</b> is a standard enumerator interface that enumerates BSTR strings. Each string is an IP version 4 address in dotted quad notation (for example, 10.111.222.111).
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastleaseinfo-enumerateaddresses
     */
    EnumerateAddresses() {
        result := ComCall(16, this, "ptr*", &ppEnumAddresses := 0, "HRESULT")
        return IEnumBstr(ppEnumAddresses)
    }

    Query(iid) {
        if (IMcastLeaseInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RequestID := CallbackCreate(GetMethod(implObj, "get_RequestID"), flags, 2)
        this.vtbl.get_LeaseStartTime := CallbackCreate(GetMethod(implObj, "get_LeaseStartTime"), flags, 2)
        this.vtbl.put_LeaseStartTime := CallbackCreate(GetMethod(implObj, "put_LeaseStartTime"), flags, 2)
        this.vtbl.get_LeaseStopTime := CallbackCreate(GetMethod(implObj, "get_LeaseStopTime"), flags, 2)
        this.vtbl.put_LeaseStopTime := CallbackCreate(GetMethod(implObj, "put_LeaseStopTime"), flags, 2)
        this.vtbl.get_AddressCount := CallbackCreate(GetMethod(implObj, "get_AddressCount"), flags, 2)
        this.vtbl.get_ServerAddress := CallbackCreate(GetMethod(implObj, "get_ServerAddress"), flags, 2)
        this.vtbl.get_TTL := CallbackCreate(GetMethod(implObj, "get_TTL"), flags, 2)
        this.vtbl.get_Addresses := CallbackCreate(GetMethod(implObj, "get_Addresses"), flags, 2)
        this.vtbl.EnumerateAddresses := CallbackCreate(GetMethod(implObj, "EnumerateAddresses"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RequestID)
        CallbackFree(this.vtbl.get_LeaseStartTime)
        CallbackFree(this.vtbl.put_LeaseStartTime)
        CallbackFree(this.vtbl.get_LeaseStopTime)
        CallbackFree(this.vtbl.put_LeaseStopTime)
        CallbackFree(this.vtbl.get_AddressCount)
        CallbackFree(this.vtbl.get_ServerAddress)
        CallbackFree(this.vtbl.get_TTL)
        CallbackFree(this.vtbl.get_Addresses)
        CallbackFree(this.vtbl.EnumerateAddresses)
    }
}
