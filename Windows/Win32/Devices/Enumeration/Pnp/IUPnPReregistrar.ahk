#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPReregistrar interface allows the application to re-register a UPnP-based device with the device host.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpreregistrar
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPReregistrar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPReregistrar
     * @type {Guid}
     */
    static IID => Guid("{204810b7-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReregisterDevice", "ReregisterRunningDevice"]

    /**
     * 
     * @param {BSTR} bstrDeviceIdentifier 
     * @param {BSTR} bstrXMLDesc 
     * @param {BSTR} bstrProgIDDeviceControlClass 
     * @param {BSTR} bstrInitString 
     * @param {BSTR} bstrContainerId 
     * @param {BSTR} bstrResourcePath 
     * @param {Integer} nLifeTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpreregistrar-reregisterdevice
     */
    ReregisterDevice(bstrDeviceIdentifier, bstrXMLDesc, bstrProgIDDeviceControlClass, bstrInitString, bstrContainerId, bstrResourcePath, nLifeTime) {
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrProgIDDeviceControlClass := bstrProgIDDeviceControlClass is String ? BSTR.Alloc(bstrProgIDDeviceControlClass).Value : bstrProgIDDeviceControlClass
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrContainerId := bstrContainerId is String ? BSTR.Alloc(bstrContainerId).Value : bstrContainerId
        bstrResourcePath := bstrResourcePath is String ? BSTR.Alloc(bstrResourcePath).Value : bstrResourcePath

        result := ComCall(3, this, "ptr", bstrDeviceIdentifier, "ptr", bstrXMLDesc, "ptr", bstrProgIDDeviceControlClass, "ptr", bstrInitString, "ptr", bstrContainerId, "ptr", bstrResourcePath, "int", nLifeTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceIdentifier 
     * @param {BSTR} bstrXMLDesc 
     * @param {IUnknown} punkDeviceControl 
     * @param {BSTR} bstrInitString 
     * @param {BSTR} bstrResourcePath 
     * @param {Integer} nLifeTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpreregistrar-reregisterrunningdevice
     */
    ReregisterRunningDevice(bstrDeviceIdentifier, bstrXMLDesc, punkDeviceControl, bstrInitString, bstrResourcePath, nLifeTime) {
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrResourcePath := bstrResourcePath is String ? BSTR.Alloc(bstrResourcePath).Value : bstrResourcePath

        result := ComCall(4, this, "ptr", bstrDeviceIdentifier, "ptr", bstrXMLDesc, "ptr", punkDeviceControl, "ptr", bstrInitString, "ptr", bstrResourcePath, "int", nLifeTime, "HRESULT")
        return result
    }
}
