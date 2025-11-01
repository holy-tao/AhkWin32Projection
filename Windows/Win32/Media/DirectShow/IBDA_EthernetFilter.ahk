#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_EthernetFilter interface is implemented on a Network Provider.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_EthernetFilter)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_ethernetfilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_EthernetFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_EthernetFilter
     * @type {Guid}
     */
    static IID => Guid("{71985f43-1ca1-11d3-9cc8-00c04f7971e0}")

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
     * 
     * @param {Pointer<Integer>} pulcbAddresses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ethernetfilter-getmulticastlistsize
     */
    GetMulticastListSize(pulcbAddresses) {
        pulcbAddressesMarshal := pulcbAddresses is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulcbAddressesMarshal, pulcbAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulcbAddresses 
     * @param {Pointer<Integer>} pAddressList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ethernetfilter-putmulticastlist
     */
    PutMulticastList(ulcbAddresses, pAddressList) {
        pAddressListMarshal := pAddressList is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", ulcbAddresses, pAddressListMarshal, pAddressList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcbAddresses 
     * @param {Pointer<Integer>} pAddressList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ethernetfilter-getmulticastlist
     */
    GetMulticastList(pulcbAddresses, pAddressList) {
        pulcbAddressesMarshal := pulcbAddresses is VarRef ? "uint*" : "ptr"
        pAddressListMarshal := pAddressList is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pulcbAddressesMarshal, pulcbAddresses, pAddressListMarshal, pAddressList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulModeMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ethernetfilter-putmulticastmode
     */
    PutMulticastMode(ulModeMask) {
        result := ComCall(6, this, "uint", ulModeMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulModeMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ethernetfilter-getmulticastmode
     */
    GetMulticastMode(pulModeMask) {
        pulModeMaskMarshal := pulModeMask is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulModeMaskMarshal, pulModeMask, "HRESULT")
        return result
    }
}
