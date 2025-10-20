#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INATExternalIPAddressCallback interface is implemented by the NAT application with UPnP technology. It provides a method that the system calls if the external IP address of the NAT computer changes.
 * @see https://docs.microsoft.com/windows/win32/api//natupnp/nn-natupnp-inatexternalipaddresscallback
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INATExternalIPAddressCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INATExternalIPAddressCallback
     * @type {Guid}
     */
    static IID => Guid("{9c416740-a34e-446f-ba06-abd04c3149ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NewExternalIPAddress"]

    /**
     * 
     * @param {BSTR} bstrNewExternalIPAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-inatexternalipaddresscallback-newexternalipaddress
     */
    NewExternalIPAddress(bstrNewExternalIPAddress) {
        bstrNewExternalIPAddress := bstrNewExternalIPAddress is String ? BSTR.Alloc(bstrNewExternalIPAddress).Value : bstrNewExternalIPAddress

        result := ComCall(3, this, "ptr", bstrNewExternalIPAddress, "HRESULT")
        return result
    }
}
