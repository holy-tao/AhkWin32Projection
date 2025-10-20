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
     * 
     * @param {Pointer<UInt32>} pulcbAddresses 
     * @returns {HRESULT} 
     */
    GetMulticastListSize(pulcbAddresses) {
        result := ComCall(3, this, "uint*", pulcbAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulcbAddresses 
     * @param {Pointer<Byte>} pAddressList 
     * @returns {HRESULT} 
     */
    PutMulticastList(ulcbAddresses, pAddressList) {
        result := ComCall(4, this, "uint", ulcbAddresses, "char*", pAddressList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulcbAddresses 
     * @param {Pointer<Byte>} pAddressList 
     * @returns {HRESULT} 
     */
    GetMulticastList(pulcbAddresses, pAddressList) {
        result := ComCall(5, this, "uint*", pulcbAddresses, "char*", pAddressList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulModeMask 
     * @returns {HRESULT} 
     */
    PutMulticastMode(ulModeMask) {
        result := ComCall(6, this, "uint", ulModeMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulModeMask 
     * @returns {HRESULT} 
     */
    GetMulticastMode(pulModeMask) {
        result := ComCall(7, this, "uint*", pulModeMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
