#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUPnPServices.ahk" { IUPnPServices }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IUPnPDevices.ahk" { IUPnPDevices }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IUPnPDevice interface enables an application to retrieve information about a specific device.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpdevice
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDevice extends IDispatch {
    /**
     * The interface identifier for IUPnPDevice
     * @type {Guid}
     */
    static IID := Guid("{3d44d0d1-98c9-4889-acd1-f9d674bf2221}")

    /**
     * The class identifier for UPnPDevice
     * @type {Guid}
     */
    static CLSID := Guid("{a32552c5-ba61-457a-b59a-a2561e125e33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDevice interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_IsRootDevice     : IntPtr
        get_RootDevice       : IntPtr
        get_ParentDevice     : IntPtr
        get_HasChildren      : IntPtr
        get_Children         : IntPtr
        get_UniqueDeviceName : IntPtr
        get_FriendlyName     : IntPtr
        get_Type             : IntPtr
        get_PresentationURL  : IntPtr
        get_ManufacturerName : IntPtr
        get_ManufacturerURL  : IntPtr
        get_ModelName        : IntPtr
        get_ModelNumber      : IntPtr
        get_Description      : IntPtr
        get_ModelURL         : IntPtr
        get_UPC              : IntPtr
        get_SerialNumber     : IntPtr
        IconURL              : IntPtr
        get_Services         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_isrootdevice
     */
    get_IsRootDevice() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pvarb := 0, "HRESULT")
        return pvarb
    }

    /**
     * The RootDevice property specifies the topmost device in the device tree. The root device represents a physical object.
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that describes the root device. This reference must be released when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_rootdevice
     */
    get_RootDevice() {
        result := ComCall(8, this, "ptr*", &ppudRootDevice := 0, "HRESULT")
        return IUPnPDevice(ppudRootDevice)
    }

    /**
     * The ParentDevice property specifies the parent of the device.
     * @remarks
     * To determine if the device has no parent, use <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevice-get_isrootdevice">IUPnPDevice::IsRootDevice</a>.
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that describes the parent device. This reference must be released when it is no longer required. If the device has no parent, it is a topmost device, and the parameter receives <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_parentdevice
     */
    get_ParentDevice() {
        result := ComCall(9, this, "ptr*", &ppudDeviceParent := 0, "HRESULT")
        return IUPnPDevice(ppudDeviceParent)
    }

    /**
     * The HasChildren property specifies whether the device has any child devices.
     * @remarks
     * Use this property to determine whether or not the application should access the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevice-get_children">IUPnPDevice::Children</a> property.
     * @returns {VARIANT_BOOL} Receives a reference to a <b>VARIANT_BOOL</b> that contains the value VARIANT_TRUE if the device has one or more child devices; otherwise, it contains the value VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_haschildren
     */
    get_HasChildren() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pvarb := 0, "HRESULT")
        return pvarb
    }

    /**
     * The Children property specifies all the child devices of the device. The devices are stored in an IUPnPDevices collection.
     * @remarks
     * To determine if a device has any children (but not the actual number of children), use <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevice-get_haschildren">IUPnPDevice::HasChildren</a>.
     * @returns {IUPnPDevices} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevices">IUPnPDevices</a> collection that enumerates the child devices of the device. This reference must be released when it is no longer required. 
     * 
     * 
     * 
     * 
     * If the device has no child devices, the collection object has a length of zero.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_children
     */
    get_Children() {
        result := ComCall(11, this, "ptr*", &ppudChildren := 0, "HRESULT")
        return IUPnPDevices(ppudChildren)
    }

    /**
     * The UniqueDeviceName property specifies the unique device name (UDN) of the device. A UDN is unique; no two devices can have the same UDN.
     * @returns {BSTR} Receives a reference to a string that contains the UDN of the device. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_uniquedevicename
     */
    get_UniqueDeviceName() {
        pbstr := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The FriendlyName property specifies the device display name for the device.
     * @remarks
     * It is possible for multiple devices to have the same display name. To determine if two device objects describe the same device, use the unique device name. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevice-get_uniquedevicename">UniqueDeviceName</a>.
     * @returns {BSTR} Receives a reference to a string that contains the device display name. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_friendlyname
     */
    get_FriendlyName() {
        pbstr := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The Type method specifies the device type uniform resource identifier (URI) for the device.
     * @returns {BSTR} Receives a reference to a string that contains the device type's URI. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_type
     */
    get_Type() {
        pbstr := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The PresentationURL property specifies the presentation URL for a Web page that controls the device.
     * @remarks
     * <div class="alert"><b>Note</b>  This property  must not be empty and must contain a valid URL.</div>
     * <div> </div>
     * @returns {BSTR} Receives a reference to a string that contains the presentation URL for the Web page. This URL is an absolute URL. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer used. If the device does not specify a presentation URL, this parameter receives an empty string.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_presentationurl
     */
    get_PresentationURL() {
        pbstr := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ManufacturerName property specifies a human-readable form of the manufacturer name of the device.
     * @returns {BSTR} Receives a reference to a string that contains the manufacturer's name. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_manufacturername
     */
    get_ManufacturerName() {
        pbstr := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ManufacturerURL property specifies the URL for the manufacturer's Web site.
     * @remarks
     * This property is optional and <i>pbstr</i> can return <b>NULL</b>.
     * @returns {BSTR} Receives a reference to a string that contains the URL. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify this URL, this parameter is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_manufacturerurl
     */
    get_ManufacturerURL() {
        pbstr := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ModelName property specifies a human-readable form of the model name of the device.
     * @returns {BSTR} Receives a reference to a string that contains the model name. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelname
     */
    get_ModelName() {
        pbstr := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ModelNumber property specifies a human-readable form of the model number of the device.
     * @remarks
     * This property is optional and <i>pbstr</i> can return <b>NULL</b>.
     * @returns {BSTR} Receives a reference to a string that contains the model number. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify a model number, this parameter is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelnumber
     */
    get_ModelNumber() {
        pbstr := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The Description property specifies a human-readable summary of the device's functionality.
     * @remarks
     * This property is optional and <i>pbstr</i> can return <b>NULL</b>.
     * @returns {BSTR} Receives a reference to a string that contains a short description of the intended functionality of devices of this type. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify a description, this parameter is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_description
     */
    get_Description() {
        pbstr := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The ModelURL property specifies the URL for a Web page that contains model-specific information for the device.
     * @remarks
     * This property is optional and <i>pbstr</i> can be <b>NULL</b>.
     * @returns {BSTR} Receives a reference to a string that contains the URL. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify this URL, this parameter is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelurl
     */
    get_ModelURL() {
        pbstr := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The UPC property specifies a human-readable form of the product code.
     * @remarks
     * This property is optional and <i>pbstr</i> may be <b>NULL</b>.
     * 
     * It is possible for multiple devices to have the same product code. To determine if two device objects describe the same device, use the unique device name. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevice-get_uniquedevicename">UniqueDeviceName</a>.
     * @returns {BSTR} Receives a reference to a string that contains the product code. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required. If the device does not specify a product code, this parameter receives an empty string.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_upc
     */
    get_UPC() {
        pbstr := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The SerialNumber property specifies a human-readable form of the serial number of the device.
     * @remarks
     * This property is optional and <i>pbstr</i> may be <b>NULL</b>.
     * 
     * It is possible for multiple devices to have the same serial number. To determine if two device objects describe the same device, use the unique device name. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevice-get_uniquedevicename">UniqueDeviceName</a>.
     * @returns {BSTR} Receives a reference to a string that contains the serial number. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer used. This property is optional and the device may not have a serial number.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_serialnumber
     */
    get_SerialNumber() {
        pbstr := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The IconURL method returns a URL from which an icon of the specified format can be loaded.
     * @remarks
     * An application can specify any values for <i>lSizeX</i>, <i>lSizeY</i>, and <i>lBitDepth</i>. However, there is no guarantee that an icon exists with those specifications.
     * 
     * If a matching icon does not exist, the URL for the icon that most closely matches the size and bit depth specified is returned.
     * @param {BSTR} bstrEncodingFormat Specifies the MIME type of the encoding format that is requested for the icon.
     * @param {Integer} lSizeX Specifies the width of the icon, in pixels. Standard values are 16, 32, or 48.
     * @param {Integer} lSizeY Specifies the height of the icon, in pixels. Standard values are 16, 32, or 48 pixels.
     * @param {Integer} lBitDepth Specifies the bit depth of the icon. Standard values are 8, 16, or 24.
     * @returns {BSTR} Receives a reference to a string that contains the URL from which the icon is to be loaded. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-iconurl
     */
    IconURL(bstrEncodingFormat, lSizeX, lSizeY, lBitDepth) {
        bstrEncodingFormat := bstrEncodingFormat is String ? BSTR.Alloc(bstrEncodingFormat).Value : bstrEncodingFormat

        pbstrIconURL := BSTR.Owned()
        result := ComCall(24, this, BSTR, bstrEncodingFormat, "int", lSizeX, "int", lSizeY, "int", lBitDepth, BSTR.Ptr, pbstrIconURL, "HRESULT")
        return pbstrIconURL
    }

    /**
     * The Services property specifies the list of services provided by the device.
     * @returns {IUPnPServices} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpservices">IUPnPServices</a> collection that enumerates the services provided by the device. This reference must be released when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_services
     */
    get_Services() {
        result := ComCall(25, this, "ptr*", &ppusServices := 0, "HRESULT")
        return IUPnPServices(ppusServices)
    }

    Query(iid) {
        if (IUPnPDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IsRootDevice := CallbackCreate(GetMethod(implObj, "get_IsRootDevice"), flags, 2)
        this.vtbl.get_RootDevice := CallbackCreate(GetMethod(implObj, "get_RootDevice"), flags, 2)
        this.vtbl.get_ParentDevice := CallbackCreate(GetMethod(implObj, "get_ParentDevice"), flags, 2)
        this.vtbl.get_HasChildren := CallbackCreate(GetMethod(implObj, "get_HasChildren"), flags, 2)
        this.vtbl.get_Children := CallbackCreate(GetMethod(implObj, "get_Children"), flags, 2)
        this.vtbl.get_UniqueDeviceName := CallbackCreate(GetMethod(implObj, "get_UniqueDeviceName"), flags, 2)
        this.vtbl.get_FriendlyName := CallbackCreate(GetMethod(implObj, "get_FriendlyName"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_PresentationURL := CallbackCreate(GetMethod(implObj, "get_PresentationURL"), flags, 2)
        this.vtbl.get_ManufacturerName := CallbackCreate(GetMethod(implObj, "get_ManufacturerName"), flags, 2)
        this.vtbl.get_ManufacturerURL := CallbackCreate(GetMethod(implObj, "get_ManufacturerURL"), flags, 2)
        this.vtbl.get_ModelName := CallbackCreate(GetMethod(implObj, "get_ModelName"), flags, 2)
        this.vtbl.get_ModelNumber := CallbackCreate(GetMethod(implObj, "get_ModelNumber"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_ModelURL := CallbackCreate(GetMethod(implObj, "get_ModelURL"), flags, 2)
        this.vtbl.get_UPC := CallbackCreate(GetMethod(implObj, "get_UPC"), flags, 2)
        this.vtbl.get_SerialNumber := CallbackCreate(GetMethod(implObj, "get_SerialNumber"), flags, 2)
        this.vtbl.IconURL := CallbackCreate(GetMethod(implObj, "IconURL"), flags, 6)
        this.vtbl.get_Services := CallbackCreate(GetMethod(implObj, "get_Services"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IsRootDevice)
        CallbackFree(this.vtbl.get_RootDevice)
        CallbackFree(this.vtbl.get_ParentDevice)
        CallbackFree(this.vtbl.get_HasChildren)
        CallbackFree(this.vtbl.get_Children)
        CallbackFree(this.vtbl.get_UniqueDeviceName)
        CallbackFree(this.vtbl.get_FriendlyName)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_PresentationURL)
        CallbackFree(this.vtbl.get_ManufacturerName)
        CallbackFree(this.vtbl.get_ManufacturerURL)
        CallbackFree(this.vtbl.get_ModelName)
        CallbackFree(this.vtbl.get_ModelNumber)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_ModelURL)
        CallbackFree(this.vtbl.get_UPC)
        CallbackFree(this.vtbl.get_SerialNumber)
        CallbackFree(this.vtbl.IconURL)
        CallbackFree(this.vtbl.get_Services)
    }
}
