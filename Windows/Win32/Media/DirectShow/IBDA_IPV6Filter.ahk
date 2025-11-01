#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is not supported.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_IPV6Filter)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_ipv6filter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_IPV6Filter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_IPV6Filter
     * @type {Guid}
     */
    static IID => Guid("{e1785a74-2a23-4fb3-9245-a8f88017ef33}")

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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-getmulticastlistsize
     */
    GetMulticastListSize(pulcbAddresses) {
        result := ComCall(3, this, "uint*", pulcbAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulcbAddresses 
     * @param {Pointer<Integer>} pAddressList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-putmulticastlist
     */
    PutMulticastList(ulcbAddresses, pAddressList) {
        result := ComCall(4, this, "uint", ulcbAddresses, "char*", pAddressList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcbAddresses 
     * @param {Pointer<Integer>} pAddressList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-getmulticastlist
     */
    GetMulticastList(pulcbAddresses, pAddressList) {
        result := ComCall(5, this, "uint*", pulcbAddresses, "char*", pAddressList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulModeMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-putmulticastmode
     */
    PutMulticastMode(ulModeMask) {
        result := ComCall(6, this, "uint", ulModeMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulModeMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipv6filter-getmulticastmode
     */
    GetMulticastMode(pulModeMask) {
        result := ComCall(7, this, "uint*", pulModeMask, "HRESULT")
        return result
    }
}
