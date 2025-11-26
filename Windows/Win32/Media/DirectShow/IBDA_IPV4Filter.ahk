#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_ IPV4Filter interface is implemented on a Network Provider.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_ IPV4Filter)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_ipv4filter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_IPV4Filter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_IPV4Filter
     * @type {Guid}
     */
    static IID => Guid("{71985f44-1ca1-11d3-9cc8-00c04f7971e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMulticastListSize", "PutMulticastList", "GetMulticastList", "PutMulticastMode", "GetMulticastMode"]

    /**
     * The GetMulticastListSize method retrieves the number of addresses in the list.
     * @param {Pointer<Integer>} pulcbAddresses Pointer that receives the number of addresses multiplied by the size of an IPv4 address.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_ipv4filter-getmulticastlistsize
     */
    GetMulticastListSize(pulcbAddresses) {
        pulcbAddressesMarshal := pulcbAddresses is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulcbAddressesMarshal, pulcbAddresses, "HRESULT")
        return result
    }

    /**
     * The PutMulticastList method sets the list of multicast addresses on the Network Provider.
     * @param {Integer} ulcbAddresses Specifies the number of addresses in the list, times the number of bytes per address.
     * @param {Pointer<Integer>} pAddressList Pointer that receives an array of addresses whose size in bytes is equal to <i>ulcbAddresses</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_ipv4filter-putmulticastlist
     */
    PutMulticastList(ulcbAddresses, pAddressList) {
        pAddressListMarshal := pAddressList is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", ulcbAddresses, pAddressListMarshal, pAddressList, "HRESULT")
        return result
    }

    /**
     * The GetMulticastList method retrieves the list of multicast addresses on the Network Provider.
     * @param {Pointer<Integer>} pulcbAddresses On input, specifies the maximum number of addresses to retrieve, multiplied by the number of bytes per address. On output, receives the actual number of bytes retrieved.
     * @returns {Integer} Pointer that receives an array of addresses whose size in bytes is equal to <i>ulcbAddresses</i>.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_ipv4filter-getmulticastlist
     */
    GetMulticastList(pulcbAddresses) {
        pulcbAddressesMarshal := pulcbAddresses is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulcbAddressesMarshal, pulcbAddresses, "char*", &pAddressList := 0, "HRESULT")
        return pAddressList
    }

    /**
     * The PutMulticastMode method sets the multicast mode.
     * @param {Integer} ulModeMask Specifies the multicast mode.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_ipv4filter-putmulticastmode
     */
    PutMulticastMode(ulModeMask) {
        result := ComCall(6, this, "uint", ulModeMask, "HRESULT")
        return result
    }

    /**
     * The GetMulticastMode method retrieves the multicast mode.
     * @returns {Integer} Pointer that receives the mask. See the Windows DDK for possible values.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_ipv4filter-getmulticastmode
     */
    GetMulticastMode() {
        result := ComCall(7, this, "uint*", &pulModeMask := 0, "HRESULT")
        return pulModeMask
    }
}
