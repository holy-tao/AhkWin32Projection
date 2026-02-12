#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\WMDM_FORMAT_CAPABILITY.ahk
#Include .\IMDSPStorage.ahk
#Include .\IMDSPDevice2.ahk

/**
 * The IMDSPDevice3 interface must be supported for devices that expect to synchronize with Windows Media Player.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-imdspdevice3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDevice3 extends IMDSPDevice2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPDevice3
     * @type {Guid}
     */
    static IID => Guid("{1a839845-fc55-487c-976f-ee38ac0e8c4e}")

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
     * The GetProperty method retrieves a specific device property.
     * @remarks
     * The variant that <i>pValue</i> points to is set to an empty <b>PROPVARIANT</b>, that is, its VT is set to VT_EMPTY.
     * 
     * Service provider should set this variant to the appropriate property value for the property <i>pwszPropName</i>.
     * 
     * If <i>pwszPropName</i> is <b>g_wszWMDMSupportedDeviceProperties</b>, service provider should return an array of the supported device properties. In such case, the VT of variant should be VT_BSTR | VT_ARRAY.
     * 
     * For a list of standard device property names, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * 
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspstorage3-getmetadata">IMDSPStorage3::GetMetadata</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspstorage4-getspecifiedmetadata">IMDSPStorage4::GetSpecifiedMetadata</a> methods for storages, but this method can get only one property at a time.
     * @param {PWSTR} pwszPropName Name of property being retrieved from the device.
     * @returns {PROPVARIANT} Returned value for the property.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice3-getproperty
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
     * The SetProperty method sets a specific device property that is writable.
     * @remarks
     * This method sets the specified device property.
     * 
     * For a list of device property names, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * 
     * This method is similar to the <b>SetMetadata</b> method for storages, but this method can set only one property at a time.
     * @param {PWSTR} pwszPropName Name of device property being set.
     * @param {Pointer<PROPVARIANT>} pValue Value of device property being set.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice3-setproperty
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
     * The GetFormatCapability method retrieves information from a device about the values or ranges of values supported by the device for each aspect of a particular object format.
     * @remarks
     * This method can be called for any of the supported formats. The list of supported formats are represented by <b>g_wszWMDMFormatsSupported</b> device property.
     * 
     * For a particular format, this method should return all configurations of supported properties (for example, combinations of bit rate and sample rate). This information is expressed as a format capability. For detailed information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-format-capability">WMDM_FORMAT_CAPABILITY</a>.
     * @param {Integer} format <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-formatcode">WMDM_FORMATCODE</a>
     * 
     * 
     * Enumerated value representing inquired format.
     * @returns {WMDM_FORMAT_CAPABILITY} Returned <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-format-capability">WMDM_FORMAT_CAPABILITY</a> structure containing the values or ranges of values supported for each aspect of a particular object format.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice3-getformatcapability
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
     * The DeviceIoControl method calls the device I/O control.
     * @remarks
     * This method provides a private mode of communication between the application and the service provider. The service provider can then process this IOCTL, optionally modify it, and pass it to the kernel-mode driver.
     * 
     * Compared to <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspdevice-sendopaquecommand">IMDSPDevice::SendOpaqueCommand</a>, this method better aligns with the <b>DeviceIoControl</b> Windows API because the output buffer is supplied by the caller. Also, unlike <b>IMDSPDevice::SendOpaqueCommand</b>, this method does not involve any MAC check and is more efficient.
     * @param {Integer} dwIoControlCode I/O control code being sent to the device.
     * @param {Pointer<Integer>} lpInBuffer Input buffer supplied by the calling application. This can be <b>NULL</b> if <i>nInBufferSize</i> is zero.
     * @param {Integer} nInBufferSize Size of <i>lpInBuffer</i>, in bytes.
     * @param {Pointer<Integer>} pnOutBufferSize Size of <i>lpOutBuffer</i>, in bytes.
     * @returns {Integer} Output buffer, supplied by the calling application.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice3-deviceiocontrol
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
     * The FindStorage method finds a storage with the given persistent unique identifier. The persistent unique identifier of a storage is described by the g_wszWMDMPersistentUniqueID property of that storage. (IMDSPDevice3.FindStorage)
     * @remarks
     * The service provider returns a persistent unique identifier through the <b>g_wszWMDMPersistentUniqueID</b> property of the storage. For a specific storage, the persistent unique identifier supplied by service provider should be same across different device connect sessions.
     * 
     * The application may call <b>FindStorage</b> with this persistent unique identifier at a later point. In response, Windows Media Device Manager calls this method on the service provider (SP).
     * 
     * A persistent unique identifier is used to uniquely identify content stored on a particular device. It does not represent a content-specific globally unique identifier that remains identical across all devices. Thus, the same content stored in different storages will have different persistent unique identifiers.
     * 
     * Windows Media Device Manager calls this method only for devices that are registered to enable synchronization with Windows Media Player. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/enabling-synchronization-with-windows-media-player">Enabling Synchronization with Windows Media Player</a>.
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID Persistent unique identifier of the storage.
     * @returns {IMDSPStorage} Pointer to the returned storage specified by the <i>pwszUniqueID</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice3-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(22, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPStorage(ppStorage)
    }
}
