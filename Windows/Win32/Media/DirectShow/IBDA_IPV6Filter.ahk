#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is not supported.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_IPV6Filter)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_ipv6filter
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_IPV6Filter extends IUnknown {
    /**
     * The interface identifier for IBDA_IPV6Filter
     * @type {Guid}
     */
    static IID := Guid("{e1785a74-2a23-4fb3-9245-a8f88017ef33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_IPV6Filter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMulticastListSize : IntPtr
        PutMulticastList     : IntPtr
        GetMulticastList     : IntPtr
        PutMulticastMode     : IntPtr
        GetMulticastMode     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_IPV6Filter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetMulticastListSize method retrieves the size in bytes of the list of multicast addresses.
     * @remarks
     * This method is used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-ip-sink-filter">BDA IP Sink</a> filter to request that a Network Provider make its best effort to tune to the stream(s) on which a list of IPv6 multicast addresses may be transmitted. Addresses in the address list are byte aligned in Network order. <i>UlcbAddresses</i> will always be an integer multiple of the size of an IPv6 address.
     * @param {Pointer<Integer>} pulcbAddresses Pointer that receives the size in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-getmulticastlistsize
     */
    GetMulticastListSize(pulcbAddresses) {
        pulcbAddressesMarshal := pulcbAddresses is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulcbAddressesMarshal, pulcbAddresses, "HRESULT")
        return result
    }

    /**
     * The PutMulticastList method specifies the parameters of the multicast list.
     * @param {Integer} ulcbAddresses Specifies the number of addresses in the list, multiplied by the number of bytes per address.
     * @param {Pointer<Integer>} pAddressList Pointer to an array of addresses whose size in bytes is equal to <i>ulcbAddresses</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-putmulticastlist
     */
    PutMulticastList(ulcbAddresses, pAddressList) {
        pAddressListMarshal := pAddressList is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", ulcbAddresses, pAddressListMarshal, pAddressList, "HRESULT")
        return result
    }

    /**
     * The GetMulticastList method retrieves the list of multicast addresses on the Network Provider.
     * @remarks
     * The declaration of <i>pAddressList</i> is not COM compliant. As a workaround, the client should allocate the <i>pAddressList</i> buffer. The buffer should be the same size as advertised in the <i>pulcbAddresses</i> parameter. The network provider will just fill in the buffer allocated by the caller.
     * @param {Pointer<Integer>} pulcbAddresses On input, specifies the maximum number of addresses to retrieve, multiplied by the number of bytes per address. On output, receives the actual number of bytes retrieved.
     * @returns {Integer} Pointer that receives an array of addresses whose size in bytes is equal to <i>ulcbAddresses</i>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-getmulticastlist
     */
    GetMulticastList(pulcbAddresses) {
        pulcbAddressesMarshal := pulcbAddresses is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulcbAddressesMarshal, pulcbAddresses, "char*", &pAddressList := 0, "HRESULT")
        return pAddressList
    }

    /**
     * The PutMulticastMode method specifies the multicast mode.
     * @param {Integer} ulModeMask Specifies the mode mask.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-putmulticastmode
     */
    PutMulticastMode(ulModeMask) {
        result := ComCall(6, this, "uint", ulModeMask, "HRESULT")
        return result
    }

    /**
     * The GetMulticastMode method retrieves the mode(s) of the multicast.
     * @returns {Integer} Pointer that receives the mode mask.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-getmulticastmode
     */
    GetMulticastMode() {
        result := ComCall(7, this, "uint*", &pulModeMask := 0, "HRESULT")
        return pulModeMask
    }

    Query(iid) {
        if (IBDA_IPV6Filter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMulticastListSize := CallbackCreate(GetMethod(implObj, "GetMulticastListSize"), flags, 2)
        this.vtbl.PutMulticastList := CallbackCreate(GetMethod(implObj, "PutMulticastList"), flags, 3)
        this.vtbl.GetMulticastList := CallbackCreate(GetMethod(implObj, "GetMulticastList"), flags, 3)
        this.vtbl.PutMulticastMode := CallbackCreate(GetMethod(implObj, "PutMulticastMode"), flags, 2)
        this.vtbl.GetMulticastMode := CallbackCreate(GetMethod(implObj, "GetMulticastMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMulticastListSize)
        CallbackFree(this.vtbl.PutMulticastList)
        CallbackFree(this.vtbl.GetMulticastList)
        CallbackFree(this.vtbl.PutMulticastMode)
        CallbackFree(this.vtbl.GetMulticastMode)
    }
}
