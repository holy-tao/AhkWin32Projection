#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPDeviceFinderAddCallbackWithInterface interface allows the UPnP framework to communicate to an application
 * @remarks
 * 
  * If you implement this interface, you must also implement the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefindercallback">IUPnPDeviceFinderCallback</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdevicefinderaddcallbackwithinterface
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceFinderAddCallbackWithInterface extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceFinderAddCallbackWithInterface
     * @type {Guid}
     */
    static IID => Guid("{983dfc0b-1796-44df-8975-ca545b620ee5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeviceAddedWithInterface"]

    /**
     * 
     * @param {Integer} lFindData 
     * @param {IUPnPDevice} pDevice 
     * @param {Pointer<Guid>} pguidInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevicefinderaddcallbackwithinterface-deviceaddedwithinterface
     */
    DeviceAddedWithInterface(lFindData, pDevice, pguidInterface) {
        result := ComCall(3, this, "int", lFindData, "ptr", pDevice, "ptr", pguidInterface, "HRESULT")
        return result
    }
}
