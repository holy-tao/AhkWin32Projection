#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPRegistrar interface registers the devices that run in the context of the device host.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpregistrar
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPRegistrar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPRegistrar
     * @type {Guid}
     */
    static IID => Guid("{204810b6-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The class identifier for UPnPRegistrar
     * @type {Guid}
     */
    static CLSID => Guid("{204810b9-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDevice", "RegisterRunningDevice", "RegisterDeviceProvider", "GetUniqueDeviceName", "UnregisterDevice", "UnregisterDeviceProvider"]

    /**
     * 
     * @param {BSTR} bstrXMLDesc 
     * @param {BSTR} bstrProgIDDeviceControlClass 
     * @param {BSTR} bstrInitString 
     * @param {BSTR} bstrContainerId 
     * @param {BSTR} bstrResourcePath 
     * @param {Integer} nLifeTime 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-registerdevice
     */
    RegisterDevice(bstrXMLDesc, bstrProgIDDeviceControlClass, bstrInitString, bstrContainerId, bstrResourcePath, nLifeTime) {
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrProgIDDeviceControlClass := bstrProgIDDeviceControlClass is String ? BSTR.Alloc(bstrProgIDDeviceControlClass).Value : bstrProgIDDeviceControlClass
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrContainerId := bstrContainerId is String ? BSTR.Alloc(bstrContainerId).Value : bstrContainerId
        bstrResourcePath := bstrResourcePath is String ? BSTR.Alloc(bstrResourcePath).Value : bstrResourcePath

        pbstrDeviceIdentifier := BSTR()
        result := ComCall(3, this, "ptr", bstrXMLDesc, "ptr", bstrProgIDDeviceControlClass, "ptr", bstrInitString, "ptr", bstrContainerId, "ptr", bstrResourcePath, "int", nLifeTime, "ptr", pbstrDeviceIdentifier, "HRESULT")
        return pbstrDeviceIdentifier
    }

    /**
     * 
     * @param {BSTR} bstrXMLDesc 
     * @param {IUnknown} punkDeviceControl 
     * @param {BSTR} bstrInitString 
     * @param {BSTR} bstrResourcePath 
     * @param {Integer} nLifeTime 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice
     */
    RegisterRunningDevice(bstrXMLDesc, punkDeviceControl, bstrInitString, bstrResourcePath, nLifeTime) {
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrResourcePath := bstrResourcePath is String ? BSTR.Alloc(bstrResourcePath).Value : bstrResourcePath

        pbstrDeviceIdentifier := BSTR()
        result := ComCall(4, this, "ptr", bstrXMLDesc, "ptr", punkDeviceControl, "ptr", bstrInitString, "ptr", bstrResourcePath, "int", nLifeTime, "ptr", pbstrDeviceIdentifier, "HRESULT")
        return pbstrDeviceIdentifier
    }

    /**
     * 
     * @param {BSTR} bstrProviderName 
     * @param {BSTR} bstrProgIDProviderClass 
     * @param {BSTR} bstrInitString 
     * @param {BSTR} bstrContainerId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-registerdeviceprovider
     */
    RegisterDeviceProvider(bstrProviderName, bstrProgIDProviderClass, bstrInitString, bstrContainerId) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName
        bstrProgIDProviderClass := bstrProgIDProviderClass is String ? BSTR.Alloc(bstrProgIDProviderClass).Value : bstrProgIDProviderClass
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrContainerId := bstrContainerId is String ? BSTR.Alloc(bstrContainerId).Value : bstrContainerId

        result := ComCall(5, this, "ptr", bstrProviderName, "ptr", bstrProgIDProviderClass, "ptr", bstrInitString, "ptr", bstrContainerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceIdentifier 
     * @param {BSTR} bstrTemplateUDN 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-getuniquedevicename
     */
    GetUniqueDeviceName(bstrDeviceIdentifier, bstrTemplateUDN) {
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier
        bstrTemplateUDN := bstrTemplateUDN is String ? BSTR.Alloc(bstrTemplateUDN).Value : bstrTemplateUDN

        pbstrUDN := BSTR()
        result := ComCall(6, this, "ptr", bstrDeviceIdentifier, "ptr", bstrTemplateUDN, "ptr", pbstrUDN, "HRESULT")
        return pbstrUDN
    }

    /**
     * 
     * @param {BSTR} bstrDeviceIdentifier 
     * @param {BOOL} fPermanent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-unregisterdevice
     */
    UnregisterDevice(bstrDeviceIdentifier, fPermanent) {
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier

        result := ComCall(7, this, "ptr", bstrDeviceIdentifier, "int", fPermanent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProviderName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-unregisterdeviceprovider
     */
    UnregisterDeviceProvider(bstrProviderName) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(8, this, "ptr", bstrProviderName, "HRESULT")
        return result
    }
}
