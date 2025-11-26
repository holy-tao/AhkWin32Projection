#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IUPnPDevice.ahk
#Include .\IUPnPDevices.ahk
#Include .\IUPnPServices.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPDevice interface enables an application to retrieve information about a specific device.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdevice
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDevice extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDevice
     * @type {Guid}
     */
    static IID => Guid("{3d44d0d1-98c9-4889-acd1-f9d674bf2221}")

    /**
     * The class identifier for UPnPDevice
     * @type {Guid}
     */
    static CLSID => Guid("{a32552c5-ba61-457a-b59a-a2561e125e33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRootDevice", "get_RootDevice", "get_ParentDevice", "get_HasChildren", "get_Children", "get_UniqueDeviceName", "get_FriendlyName", "get_Type", "get_PresentationURL", "get_ManufacturerName", "get_ManufacturerURL", "get_ModelName", "get_ModelNumber", "get_Description", "get_ModelURL", "get_UPC", "get_SerialNumber", "IconURL", "get_Services"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IsRootDevice {
        get => this.get_IsRootDevice()
    }

    /**
     * @type {IUPnPDevice} 
     */
    RootDevice {
        get => this.get_RootDevice()
    }

    /**
     * @type {IUPnPDevice} 
     */
    ParentDevice {
        get => this.get_ParentDevice()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    HasChildren {
        get => this.get_HasChildren()
    }

    /**
     * @type {IUPnPDevices} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * @type {BSTR} 
     */
    UniqueDeviceName {
        get => this.get_UniqueDeviceName()
    }

    /**
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    PresentationURL {
        get => this.get_PresentationURL()
    }

    /**
     * @type {BSTR} 
     */
    ManufacturerName {
        get => this.get_ManufacturerName()
    }

    /**
     * @type {BSTR} 
     */
    ManufacturerURL {
        get => this.get_ManufacturerURL()
    }

    /**
     * @type {BSTR} 
     */
    ModelName {
        get => this.get_ModelName()
    }

    /**
     * @type {BSTR} 
     */
    ModelNumber {
        get => this.get_ModelNumber()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {BSTR} 
     */
    ModelURL {
        get => this.get_ModelURL()
    }

    /**
     * @type {BSTR} 
     */
    UPC {
        get => this.get_UPC()
    }

    /**
     * @type {BSTR} 
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * @type {IUPnPServices} 
     */
    Services {
        get => this.get_Services()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_isrootdevice
     */
    get_IsRootDevice() {
        result := ComCall(7, this, "short*", &pvarb := 0, "HRESULT")
        return pvarb
    }

    /**
     * 
     * @returns {IUPnPDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_rootdevice
     */
    get_RootDevice() {
        result := ComCall(8, this, "ptr*", &ppudRootDevice := 0, "HRESULT")
        return IUPnPDevice(ppudRootDevice)
    }

    /**
     * 
     * @returns {IUPnPDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_parentdevice
     */
    get_ParentDevice() {
        result := ComCall(9, this, "ptr*", &ppudDeviceParent := 0, "HRESULT")
        return IUPnPDevice(ppudDeviceParent)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_haschildren
     */
    get_HasChildren() {
        result := ComCall(10, this, "short*", &pvarb := 0, "HRESULT")
        return pvarb
    }

    /**
     * 
     * @returns {IUPnPDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_children
     */
    get_Children() {
        result := ComCall(11, this, "ptr*", &ppudChildren := 0, "HRESULT")
        return IUPnPDevices(ppudChildren)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_uniquedevicename
     */
    get_UniqueDeviceName() {
        pbstr := BSTR()
        result := ComCall(12, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_friendlyname
     */
    get_FriendlyName() {
        pbstr := BSTR()
        result := ComCall(13, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_type
     */
    get_Type() {
        pbstr := BSTR()
        result := ComCall(14, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_presentationurl
     */
    get_PresentationURL() {
        pbstr := BSTR()
        result := ComCall(15, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_manufacturername
     */
    get_ManufacturerName() {
        pbstr := BSTR()
        result := ComCall(16, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_manufacturerurl
     */
    get_ManufacturerURL() {
        pbstr := BSTR()
        result := ComCall(17, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelname
     */
    get_ModelName() {
        pbstr := BSTR()
        result := ComCall(18, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelnumber
     */
    get_ModelNumber() {
        pbstr := BSTR()
        result := ComCall(19, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_description
     */
    get_Description() {
        pbstr := BSTR()
        result := ComCall(20, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelurl
     */
    get_ModelURL() {
        pbstr := BSTR()
        result := ComCall(21, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_upc
     */
    get_UPC() {
        pbstr := BSTR()
        result := ComCall(22, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_serialnumber
     */
    get_SerialNumber() {
        pbstr := BSTR()
        result := ComCall(23, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {BSTR} bstrEncodingFormat 
     * @param {Integer} lSizeX 
     * @param {Integer} lSizeY 
     * @param {Integer} lBitDepth 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-iconurl
     */
    IconURL(bstrEncodingFormat, lSizeX, lSizeY, lBitDepth) {
        bstrEncodingFormat := bstrEncodingFormat is String ? BSTR.Alloc(bstrEncodingFormat).Value : bstrEncodingFormat

        pbstrIconURL := BSTR()
        result := ComCall(24, this, "ptr", bstrEncodingFormat, "int", lSizeX, "int", lSizeY, "int", lBitDepth, "ptr", pbstrIconURL, "HRESULT")
        return pbstrIconURL
    }

    /**
     * 
     * @returns {IUPnPServices} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_services
     */
    get_Services() {
        result := ComCall(25, this, "ptr*", &ppusServices := 0, "HRESULT")
        return IUPnPServices(ppusServices)
    }
}
