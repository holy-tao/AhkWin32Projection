#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a factory that can instantiate a WPD Automation Device object.
 * @remarks
 * 
  * The <b>IPortableDeviceDispatchFactory</b> interface can be CoCreated directly using <b>CLSID_PortableDeviceDispatchFactory</b> as in the following code.
  * 
  * 
  * ```cpp
  * IPortableDeviceDispatchFactgory* pDeviceDispatchFactory = NULL;
  * HRESULT hr = CoCreateInstance(CLSID_PortableDeviceDispatchFactory, NULL, CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&pDeviceDispatchFactory));   
  * 
  * ```
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicedispatchfactory
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceDispatchFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceDispatchFactory
     * @type {Guid}
     */
    static IID => Guid("{5e1eafc3-e3d7-4132-96fa-759c0f9d1e0f}")

    /**
     * The class identifier for PortableDeviceDispatchFactory
     * @type {Guid}
     */
    static CLSID => Guid("{43232233-8338-4658-ae01-0b4ae830b6b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceDispatch"]

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {Pointer<IDispatch>} ppDeviceDispatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicedispatchfactory-getdevicedispatch
     */
    GetDeviceDispatch(pszPnPDeviceID, ppDeviceDispatch) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID

        result := ComCall(3, this, "ptr", pszPnPDeviceID, "ptr*", ppDeviceDispatch, "HRESULT")
        return result
    }
}
