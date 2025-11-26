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
     * The IsRootDevice property specifies whether the device is the topmost device in the device tree.
     * @returns {VARIANT_BOOL} Receives a reference to a <b>VARIANT_BOOL</b> that contains the value VARIANT_TRUE if the device is the topmost device in the device tree; otherwise, it contains the value VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_isrootdevice
     */
    get_IsRootDevice() {
        result := ComCall(7, this, "short*", &pvarb := 0, "HRESULT")
        return pvarb
    }

    /**
     * The RootDevice property specifies the topmost device in the device tree. The root device represents a physical object.
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that describes the root device. This reference must be released when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_rootdevice
     */
    get_RootDevice() {
        result := ComCall(8, this, "ptr*", &ppudRootDevice := 0, "HRESULT")
        return IUPnPDevice(ppudRootDevice)
    }

    /**
     * The ParentDevice property specifies the parent of the device.
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that describes the parent device. This reference must be released when it is no longer required. If the device has no parent, it is a topmost device, and the parameter receives <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_parentdevice
     */
    get_ParentDevice() {
        result := ComCall(9, this, "ptr*", &ppudDeviceParent := 0, "HRESULT")
        return IUPnPDevice(ppudDeviceParent)
    }

    /**
     * The HasChildren property specifies whether the device has any child devices.
     * @returns {VARIANT_BOOL} Receives a reference to a <b>VARIANT_BOOL</b> that contains the value VARIANT_TRUE if the device has one or more child devices; otherwise, it contains the value VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_haschildren
     */
    get_HasChildren() {
        result := ComCall(10, this, "short*", &pvarb := 0, "HRESULT")
        return pvarb
    }

    /**
     * The Children property specifies all the child devices of the device. The devices are stored in an IUPnPDevices collection.
     * @returns {IUPnPDevices} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevices">IUPnPDevices</a> collection that enumerates the child devices of the device. This reference must be released when it is no longer required. 
     * 
     * 
     * 
     * 
     * If the device has no child devices, the collection object has a length of zero.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_children
     */
    get_Children() {
        result := ComCall(11, this, "ptr*", &ppudChildren := 0, "HRESULT")
        return IUPnPDevices(ppudChildren)
    }

    /**
     * The UniqueDeviceName property specifies the unique device name (UDN) of the device. A UDN is unique; no two devices can have the same UDN.
     * @returns {BSTR} Receives a reference to a string that contains the UDN of the device. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_uniquedevicename
     */
    get_UniqueDeviceName() {
        pbstr := BSTR()
        result := ComCall(12, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The FriendlyName property specifies the device display name for the device.
     * @returns {BSTR} Receives a reference to a string that contains the device display name. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_friendlyname
     */
    get_FriendlyName() {
        pbstr := BSTR()
        result := ComCall(13, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The Type method specifies the device type uniform resource identifier (URI) for the device.
     * @returns {BSTR} Receives a reference to a string that contains the device type's URI. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_type
     */
    get_Type() {
        pbstr := BSTR()
        result := ComCall(14, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The PresentationURL property specifies the presentation URL for a Web page that controls the device.
     * @returns {BSTR} Receives a reference to a string that contains the presentation URL for the Web page. This URL is an absolute URL. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer used. If the device does not specify a presentation URL, this parameter receives an empty string.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_presentationurl
     */
    get_PresentationURL() {
        pbstr := BSTR()
        result := ComCall(15, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ManufacturerName property specifies a human-readable form of the manufacturer name of the device.
     * @returns {BSTR} Receives a reference to a string that contains the manufacturer's name. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_manufacturername
     */
    get_ManufacturerName() {
        pbstr := BSTR()
        result := ComCall(16, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ManufacturerURL property specifies the URL for the manufacturer's Web site.
     * @returns {BSTR} Receives a reference to a string that contains the URL. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify this URL, this parameter is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_manufacturerurl
     */
    get_ManufacturerURL() {
        pbstr := BSTR()
        result := ComCall(17, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ModelName property specifies a human-readable form of the model name of the device.
     * @returns {BSTR} Receives a reference to a string that contains the model name. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_modelname
     */
    get_ModelName() {
        pbstr := BSTR()
        result := ComCall(18, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ModelNumber property specifies a human-readable form of the model number of the device.
     * @returns {BSTR} Receives a reference to a string that contains the model number. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify a model number, this parameter is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_modelnumber
     */
    get_ModelNumber() {
        pbstr := BSTR()
        result := ComCall(19, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The Description property specifies a human-readable summary of the device's functionality.
     * @returns {BSTR} Receives a reference to a string that contains a short description of the intended functionality of devices of this type. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify a description, this parameter is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_description
     */
    get_Description() {
        pbstr := BSTR()
        result := ComCall(20, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ModelURL property specifies the URL for a Web page that contains model-specific information for the device.
     * @returns {BSTR} Receives a reference to a string that contains the URL. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify this URL, this parameter is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_modelurl
     */
    get_ModelURL() {
        pbstr := BSTR()
        result := ComCall(21, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The UPC property specifies a human-readable form of the product code.
     * @returns {BSTR} Receives a reference to a string that contains the product code. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify a product code, this parameter receives an empty string.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_upc
     */
    get_UPC() {
        pbstr := BSTR()
        result := ComCall(22, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The SerialNumber property specifies a human-readable form of the serial number of the device.
     * @returns {BSTR} Receives a reference to a string that contains the serial number. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer used. This property is optional and the device may not have a serial number.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_serialnumber
     */
    get_SerialNumber() {
        pbstr := BSTR()
        result := ComCall(23, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The IconURL method returns a URL from which an icon of the specified format can be loaded.
     * @param {BSTR} bstrEncodingFormat Specifies the MIME type of the encoding format that is requested for the icon.
     * @param {Integer} lSizeX Specifies the width of the icon, in pixels. Standard values are 16, 32, or 48.
     * @param {Integer} lSizeY Specifies the height of the icon, in pixels. Standard values are 16, 32, or 48 pixels.
     * @param {Integer} lBitDepth Specifies the bit depth of the icon. Standard values are 8, 16, or 24.
     * @returns {BSTR} Receives a reference to a string that contains the URL from which the icon is to be loaded. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-iconurl
     */
    IconURL(bstrEncodingFormat, lSizeX, lSizeY, lBitDepth) {
        bstrEncodingFormat := bstrEncodingFormat is String ? BSTR.Alloc(bstrEncodingFormat).Value : bstrEncodingFormat

        pbstrIconURL := BSTR()
        result := ComCall(24, this, "ptr", bstrEncodingFormat, "int", lSizeX, "int", lSizeY, "int", lBitDepth, "ptr", pbstrIconURL, "HRESULT")
        return pbstrIconURL
    }

    /**
     * The Services property specifies the list of services provided by the device.
     * @returns {IUPnPServices} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpservices">IUPnPServices</a> collection that enumerates the services provided by the device. This reference must be released when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevice-get_services
     */
    get_Services() {
        result := ComCall(25, this, "ptr*", &ppusServices := 0, "HRESULT")
        return IUPnPServices(ppusServices)
    }
}
