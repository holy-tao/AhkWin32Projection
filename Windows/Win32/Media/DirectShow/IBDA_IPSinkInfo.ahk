#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_IPSinkInfo)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_ipsinkinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_IPSinkInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_IPSinkInfo
     * @type {Guid}
     */
    static IID => Guid("{a750108f-492e-4d51-95f7-649b23ff7ad7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MulticastList", "get_AdapterIPAddress", "get_AdapterDescription"]

    /**
     * @type {BSTR} 
     */
    AdapterIPAddress {
        get => this.get_AdapterIPAddress()
    }

    /**
     * @type {BSTR} 
     */
    AdapterDescription {
        get => this.get_AdapterDescription()
    }

    /**
     * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems. It may be altered or unavailable in subsequent versions.
     * @param {Pointer<Integer>} pulcbAddresses Receives the number of bytes in the returned array.
     * @returns {Pointer<Integer>} Pointer to variable that receives an array of bytes, of size *<i>pulcbAddresses</i>. Each IP address is 6 consecutive bytes.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_ipsinkinfo-get_multicastlist
     */
    get_MulticastList(pulcbAddresses) {
        pulcbAddressesMarshal := pulcbAddresses is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulcbAddressesMarshal, pulcbAddresses, "ptr*", &ppbAddressList := 0, "HRESULT")
        return ppbAddressList
    }

    /**
     * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems. It may be altered or unavailable in subsequent versions.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the IP address. The returned string has the form <c>N.N.N.N</code>; for example, <code>3.0.0.0</c>.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_ipsinkinfo-get_adapteripaddress
     */
    get_AdapterIPAddress() {
        pbstrBuffer := BSTR()
        result := ComCall(4, this, "ptr", pbstrBuffer, "HRESULT")
        return pbstrBuffer
    }

    /**
     * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems. It may be altered or unavailable in subsequent versions.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the description.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_ipsinkinfo-get_adapterdescription
     */
    get_AdapterDescription() {
        pbstrBuffer := BSTR()
        result := ComCall(5, this, "ptr", pbstrBuffer, "HRESULT")
        return pbstrBuffer
    }
}
