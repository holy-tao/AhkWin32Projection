#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPDeviceControl interface is the central point of management for a device and its service objects.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpdevicecontrol
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceControl
     * @type {Guid}
     */
    static IID => Guid("{204810ba-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetServiceObject"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {BSTR} bstrXMLDesc 
     * @param {BSTR} bstrDeviceIdentifier 
     * @param {BSTR} bstrInitString 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(bstrXMLDesc, bstrDeviceIdentifier, bstrInitString) {
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString

        result := ComCall(3, this, "ptr", bstrXMLDesc, "ptr", bstrDeviceIdentifier, "ptr", bstrInitString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUDN 
     * @param {BSTR} bstrServiceId 
     * @param {Pointer<IDispatch>} ppdispService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpdevicecontrol-getserviceobject
     */
    GetServiceObject(bstrUDN, bstrServiceId, ppdispService) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN
        bstrServiceId := bstrServiceId is String ? BSTR.Alloc(bstrServiceId).Value : bstrServiceId

        result := ComCall(4, this, "ptr", bstrUDN, "ptr", bstrServiceId, "ptr*", ppdispService, "HRESULT")
        return result
    }
}
