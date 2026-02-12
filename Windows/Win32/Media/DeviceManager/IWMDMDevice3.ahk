#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\WMDM_FORMAT_CAPABILITY.ahk
#Include .\IWMDMStorage.ahk
#Include .\IWMDMDevice2.ahk

/**
 * The IWMDMDevice3 interface extends IWMDMDevice2 by providing methods to query a device for properties, send device I/O control codes, and also providing upgraded methods to search for storages and retrieve device format capabilities.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-iwmdmdevice3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDevice3 extends IWMDMDevice2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMDevice3
     * @type {Guid}
     */
    static IID => Guid("{6c03e4fe-05db-4dda-9e3c-06233a6d5d65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty", "SetProperty", "GetFormatCapability", "DeviceIoControl", "FindStorage"]

    /**
     * The GetProperty method retrieves a specific device metadata property.
     * @remarks
     * To obtain the list of supported device properties, the client call this function and specify <b>g_wszWMDMSupportedDeviceProperties</b>. For the list of standard device property names, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * 
     * The client should pass in a pointer to an empty <b>PROPVARIANT</b> in the <i>pValue</i> parameter. On return, <i>pValue</i> will contain the value of the property.
     * 
     * This method is similar to the <b>GetMetadata</b> and <b>GetSpecifiedMetadata</b> methods for storages, but this method can get only one property at a time.
     * @param {PWSTR} pwszPropName A wide character, null-terminated string name of the property to retrieve. A list of standard property name constants is given in <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * @returns {PROPVARIANT} Returned value for the property. The application must free this memory using <b>PropVariantClear</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmdevice3-getproperty
     */
    GetProperty(pwszPropName) {
        pwszPropName := pwszPropName is String ? StrPtr(pwszPropName) : pwszPropName

        pValue := PROPVARIANT()
        result := ComCall(18, this, "ptr", pwszPropName, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * The SetProperty method sets a specific device property, if it is writable.
     * @remarks
     * This method sets the specified device property. To obtain the list of supported device properties, the client should query the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-getproperty">IWMDMDevice3::GetProperty</a> method for the <b>g_wszWMDMSupportedDeviceProperties</b> property.
     * 
     * For the list of device property names, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * 
     * This method is similar to the <b>SetMetadata</b> method for storages, but this method can set only one property at one time.
     * 
     * Not all properties of the device can be set.
     * @param {PWSTR} pwszPropName A wide character, null-terminated string name of the property to set. This overwrites any existing property with the same name. Once the application has made this call, it should free any dynamic memory using <b>PropVariantClear</b>. A list of standard property name constants is given in <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * @param {Pointer<PROPVARIANT>} pValue Value of the property being set.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmdevice3-setproperty
     */
    SetProperty(pwszPropName, pValue) {
        pwszPropName := pwszPropName is String ? StrPtr(pwszPropName) : pwszPropName

        result := ComCall(19, this, "ptr", pwszPropName, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetFormatCapability method retrieves device support for files of a specified format. The capabilities are expressed as supported properties and their allowed values.
     * @remarks
     * The client can obtain the list of supported formats by using the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-getproperty">IWMDMDevice3::GetProperty</a> method to query the <b>g_wszWMDMFormatsSupported</b> device property.
     * 
     * For a particular format, a client can call this function to obtain the supported properties and get information about configurations of supported properties (for example, combinations of bit rate and sample rate). This information is expressed as a format capability.
     * @param {Integer} format Value from the <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-formatcode">WMDM_FORMATCODE</a> enumeration representing the queried format.
     * @returns {WMDM_FORMAT_CAPABILITY} Pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-format-capability">WMDM_FORMAT_CAPABILITY</a> structure containing supported properties and their allowed values. These values must be released by the application as described in <a href="https://docs.microsoft.com/windows/desktop/WMDM/getting-format-capabilities-on-devices-that-support-iwmdmdevice3">Getting Format Capabilities on Devices That Support IWMDMDevice3</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmdevice3-getformatcapability
     */
    GetFormatCapability(format) {
        pFormatSupport := WMDM_FORMAT_CAPABILITY()
        result := ComCall(20, this, "int", format, "ptr", pFormatSupport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFormatSupport
    }

    /**
     * The DeviceIoControl method sends a Device I/O Control (IOCTL) code to the device. This is a pass-through method; Windows Media Device Manager just forwards the call to the service provider after validating the parameters.
     * @remarks
     * This method provides a private mode of communication between the application and the service provider. The service provider can then process this IOCTL, optionally modify it, and pass it to the kernel mode driver.
     * 
     * Compared to <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice-sendopaquecommand">IWMDMDevice::SendOpaqueCommand</a>, this method better aligns with the <b>DeviceIoControl</b> Windows API because the output buffer is supplied by the caller. Also, unlike <b>IWMDMDevice::SendOpaqueCommand</b>, this method does not involve any MAC check and is more efficient.
     * 
     * This method can be used, for example, to send custom Media Transport Protocol (MTP) commands to an MTP device.
     * @param {Integer} dwIoControlCode Control code to send to the device. When calling this method on an MTP device, use the value IOCTL_MTP_CUSTOM_COMMAND defined in MtpExt.h included with the SDK.
     * @param {Pointer<Integer>} lpInBuffer Optional pointer to an input buffer supplied by the caller. It can be <b>NULL</b> if <i>nInBufferSize</i> is zero. When calling this method on an MTP device, you can pass in the <a href="https://docs.microsoft.com/windows/desktop/api/mtpext/ns-mtpext-mtp_command_data_in">MTP_COMMAND_DATA_IN</a> structure.
     * @param {Integer} nInBufferSize Size of the input buffer, in bytes. When calling this method on an MTP device, you can use the macro <b>SIZEOF_REQUIRED_COMMAND_DATA_IN</b> to specify the size.
     * @param {Pointer<Integer>} pnOutBufferSize Size of the output buffer, in bytes. When the call returns, it specifies the number of bytes actually returned. When calling this method on an MTP device, you can use the macro <b>SIZEOF_REQUIRED_COMMAND_DATA_OUT</b> defined in MtpExt.h to specify the size.This parameter cannot be <b>NULL</b>.
     * @returns {Integer} Optional pointer to the output buffer supplied by the caller. It can be <b>NULL</b> if <i>pnOutBufferSize</i> points to a value of zero. When calling this method on an MTP device, you can pass in the <a href="https://docs.microsoft.com/windows/desktop/api/mtpext/ns-mtpext-mtp_command_data_out">MTP_COMMAND_DATA_OUT</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmdevice3-deviceiocontrol
     */
    DeviceIoControl(dwIoControlCode, lpInBuffer, nInBufferSize, pnOutBufferSize) {
        lpInBufferMarshal := lpInBuffer is VarRef ? "char*" : "ptr"
        pnOutBufferSizeMarshal := pnOutBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", dwIoControlCode, lpInBufferMarshal, lpInBuffer, "uint", nInBufferSize, "char*", &lpOutBuffer := 0, pnOutBufferSizeMarshal, pnOutBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpOutBuffer
    }

    /**
     * The FindStorage method finds a storage by its persistent unique identifier. Unlike other methods, this method can search recursively from the root storage.
     * @remarks
     * A persistent unique identifier is used to uniquely identify content stored on a particular device. It does not represent a content-specific globally unique identifier that remains identical across all devices. Thus, the same content stored in different storages will have different persistent unique identifiers. Similarly, different content can have same persistent unique identifier when it is stored on different devices. Using the analogy of content on a device being similar to rows in a database, this property serves the same purpose as the identity column serves in a database.
     * 
     * Because it is generated by the device, the format of the persistent unique identifier is device-dependent. The application should get the persistent unique identifier by querying the <b>g_wszWMDMPersistentUniqueID</b> property of the storage. An application can use the <b>GetSpecifiedMetadata</b> or <b>GetMetadata</b> methods to query this property.
     * @param {Integer} findScope A <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-find-scope">WMDM_FIND_SCOPE</a> enumeration specifying the scope of the find operation.
     * @param {PWSTR} pwszUniqueID A wide character, null-terminated string representing a persistent unique identifier of the storage, which can be retrieved by querying for the <b>g_wszWMDMPersistentUniqueID</b> property of the storage.
     * @returns {IWMDMStorage} Pointer to the returned storage. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmdevice3-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(22, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMDMStorage(ppStorage)
    }
}
