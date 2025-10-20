#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<VARIANT_BOOL>} pvarb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_isrootdevice
     */
    get_IsRootDevice(pvarb) {
        result := ComCall(7, this, "ptr", pvarb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPDevice>} ppudRootDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_rootdevice
     */
    get_RootDevice(ppudRootDevice) {
        result := ComCall(8, this, "ptr*", ppudRootDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPDevice>} ppudDeviceParent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_parentdevice
     */
    get_ParentDevice(ppudDeviceParent) {
        result := ComCall(9, this, "ptr*", ppudDeviceParent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvarb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_haschildren
     */
    get_HasChildren(pvarb) {
        result := ComCall(10, this, "ptr", pvarb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPDevices>} ppudChildren 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_children
     */
    get_Children(ppudChildren) {
        result := ComCall(11, this, "ptr*", ppudChildren, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_uniquedevicename
     */
    get_UniqueDeviceName(pbstr) {
        result := ComCall(12, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_friendlyname
     */
    get_FriendlyName(pbstr) {
        result := ComCall(13, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_type
     */
    get_Type(pbstr) {
        result := ComCall(14, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_presentationurl
     */
    get_PresentationURL(pbstr) {
        result := ComCall(15, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_manufacturername
     */
    get_ManufacturerName(pbstr) {
        result := ComCall(16, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_manufacturerurl
     */
    get_ManufacturerURL(pbstr) {
        result := ComCall(17, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelname
     */
    get_ModelName(pbstr) {
        result := ComCall(18, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelnumber
     */
    get_ModelNumber(pbstr) {
        result := ComCall(19, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_description
     */
    get_Description(pbstr) {
        result := ComCall(20, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_modelurl
     */
    get_ModelURL(pbstr) {
        result := ComCall(21, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_upc
     */
    get_UPC(pbstr) {
        result := ComCall(22, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_serialnumber
     */
    get_SerialNumber(pbstr) {
        result := ComCall(23, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrEncodingFormat 
     * @param {Integer} lSizeX 
     * @param {Integer} lSizeY 
     * @param {Integer} lBitDepth 
     * @param {Pointer<BSTR>} pbstrIconURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-iconurl
     */
    IconURL(bstrEncodingFormat, lSizeX, lSizeY, lBitDepth, pbstrIconURL) {
        bstrEncodingFormat := bstrEncodingFormat is String ? BSTR.Alloc(bstrEncodingFormat).Value : bstrEncodingFormat

        result := ComCall(24, this, "ptr", bstrEncodingFormat, "int", lSizeX, "int", lSizeY, "int", lBitDepth, "ptr", pbstrIconURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPServices>} ppusServices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevice-get_services
     */
    get_Services(ppusServices) {
        result := ComCall(25, this, "ptr*", ppusServices, "HRESULT")
        return result
    }
}
