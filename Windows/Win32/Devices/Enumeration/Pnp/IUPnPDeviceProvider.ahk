#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPDeviceProvider interface allows a device provider to start and stop its processing.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpdeviceprovider
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceProvider
     * @type {Guid}
     */
    static IID => Guid("{204810b8-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop"]

    /**
     * 
     * @param {BSTR} bstrInitString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpdeviceprovider-start
     */
    Start(bstrInitString) {
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString

        result := ComCall(3, this, "ptr", bstrInitString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpdeviceprovider-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
