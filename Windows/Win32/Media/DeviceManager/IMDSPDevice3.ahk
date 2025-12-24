#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\WMDM_FORMAT_CAPABILITY.ahk
#Include .\IMDSPStorage.ahk
#Include .\IMDSPDevice2.ahk

/**
 * The IMDSPDevice3 interface must be supported for devices that expect to synchronize with Windows Media Player.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspdevice3
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
     * @param {PWSTR} pwszPropName Name of property being retrieved from the device.
     * @returns {PROPVARIANT} Returned value for the property.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice3-getproperty
     */
    GetProperty(pwszPropName) {
        pwszPropName := pwszPropName is String ? StrPtr(pwszPropName) : pwszPropName

        pValue := PROPVARIANT()
        result := ComCall(18, this, "ptr", pwszPropName, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * The SetProperty method sets a specific device property that is writable.
     * @param {PWSTR} pwszPropName Name of device property being set.
     * @param {Pointer<PROPVARIANT>} pValue Value of device property being set.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice3-setproperty
     */
    SetProperty(pwszPropName, pValue) {
        pwszPropName := pwszPropName is String ? StrPtr(pwszPropName) : pwszPropName

        result := ComCall(19, this, "ptr", pwszPropName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The GetFormatCapability method retrieves information from a device about the values or ranges of values supported by the device for each aspect of a particular object format.
     * @param {Integer} format <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-formatcode">WMDM_FORMATCODE</a>
     * 
     * 
     * Enumerated value representing inquired format.
     * @returns {WMDM_FORMAT_CAPABILITY} Returned <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-format-capability">WMDM_FORMAT_CAPABILITY</a> structure containing the values or ranges of values supported for each aspect of a particular object format.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice3-getformatcapability
     */
    GetFormatCapability(format) {
        pFormatSupport := WMDM_FORMAT_CAPABILITY()
        result := ComCall(20, this, "int", format, "ptr", pFormatSupport, "HRESULT")
        return pFormatSupport
    }

    /**
     * The DeviceIoControl method calls the device I/O control.
     * @param {Integer} dwIoControlCode I/O control code being sent to the device.
     * @param {Pointer<Integer>} lpInBuffer Input buffer supplied by the calling application. This can be <b>NULL</b> if <i>nInBufferSize</i> is zero.
     * @param {Integer} nInBufferSize Size of <i>lpInBuffer</i>, in bytes.
     * @param {Pointer<Integer>} pnOutBufferSize Size of <i>lpOutBuffer</i>, in bytes.
     * @returns {Integer} Output buffer, supplied by the calling application.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice3-deviceiocontrol
     */
    DeviceIoControl(dwIoControlCode, lpInBuffer, nInBufferSize, pnOutBufferSize) {
        lpInBufferMarshal := lpInBuffer is VarRef ? "char*" : "ptr"
        pnOutBufferSizeMarshal := pnOutBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", dwIoControlCode, lpInBufferMarshal, lpInBuffer, "uint", nInBufferSize, "char*", &lpOutBuffer := 0, pnOutBufferSizeMarshal, pnOutBufferSize, "HRESULT")
        return lpOutBuffer
    }

    /**
     * The FindStorage method finds a storage with the given persistent unique identifier. The persistent unique identifier of a storage is described by the g_wszWMDMPersistentUniqueID property of that storage.
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID Persistent unique identifier of the storage.
     * @returns {IMDSPStorage} Pointer to the returned storage specified by the <i>pwszUniqueID</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice3-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(22, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "HRESULT")
        return IMDSPStorage(ppStorage)
    }
}
