#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enables the caller to specify additional HTTP headers sent in HTTP requests to a device.
 * @remarks
 * 
  * This interface is obtained by calling QueryInterface on the same object that provides an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefinder">IUPnPDeviceFinder</a> or <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdescriptiondocument">IUPnPDescriptionDocument</a> interfaces, after which <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnphttpheadercontrol-addrequestheaders">AddRequestHeaders</a> can be called on it.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnphttpheadercontrol
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPHttpHeaderControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPHttpHeaderControl
     * @type {Guid}
     */
    static IID => Guid("{0405af4f-8b5c-447c-80f2-b75984a31f3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRequestHeaders"]

    /**
     * 
     * @param {BSTR} bstrHttpHeaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnphttpheadercontrol-addrequestheaders
     */
    AddRequestHeaders(bstrHttpHeaders) {
        bstrHttpHeaders := bstrHttpHeaders is String ? BSTR.Alloc(bstrHttpHeaders).Value : bstrHttpHeaders

        result := ComCall(3, this, "ptr", bstrHttpHeaders, "HRESULT")
        return result
    }
}
