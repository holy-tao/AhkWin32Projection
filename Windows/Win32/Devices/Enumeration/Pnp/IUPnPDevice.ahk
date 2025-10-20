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
     * 
     * @param {Pointer<VARIANT_BOOL>} pvarb 
     * @returns {HRESULT} 
     */
    get_IsRootDevice(pvarb) {
        result := ComCall(7, this, "ptr", pvarb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPDevice>} ppudRootDevice 
     * @returns {HRESULT} 
     */
    get_RootDevice(ppudRootDevice) {
        result := ComCall(8, this, "ptr", ppudRootDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPDevice>} ppudDeviceParent 
     * @returns {HRESULT} 
     */
    get_ParentDevice(ppudDeviceParent) {
        result := ComCall(9, this, "ptr", ppudDeviceParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvarb 
     * @returns {HRESULT} 
     */
    get_HasChildren(pvarb) {
        result := ComCall(10, this, "ptr", pvarb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPDevices>} ppudChildren 
     * @returns {HRESULT} 
     */
    get_Children(ppudChildren) {
        result := ComCall(11, this, "ptr", ppudChildren, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_UniqueDeviceName(pbstr) {
        result := ComCall(12, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_FriendlyName(pbstr) {
        result := ComCall(13, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_Type(pbstr) {
        result := ComCall(14, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_PresentationURL(pbstr) {
        result := ComCall(15, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_ManufacturerName(pbstr) {
        result := ComCall(16, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_ManufacturerURL(pbstr) {
        result := ComCall(17, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_ModelName(pbstr) {
        result := ComCall(18, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_ModelNumber(pbstr) {
        result := ComCall(19, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_Description(pbstr) {
        result := ComCall(20, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_ModelURL(pbstr) {
        result := ComCall(21, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_UPC(pbstr) {
        result := ComCall(22, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_SerialNumber(pbstr) {
        result := ComCall(23, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    IconURL(bstrEncodingFormat, lSizeX, lSizeY, lBitDepth, pbstrIconURL) {
        bstrEncodingFormat := bstrEncodingFormat is String ? BSTR.Alloc(bstrEncodingFormat).Value : bstrEncodingFormat

        result := ComCall(24, this, "ptr", bstrEncodingFormat, "int", lSizeX, "int", lSizeY, "int", lBitDepth, "ptr", pbstrIconURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPServices>} ppusServices 
     * @returns {HRESULT} 
     */
    get_Services(ppusServices) {
        result := ComCall(25, this, "ptr", ppusServices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
