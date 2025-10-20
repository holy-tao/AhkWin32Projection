#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMDevice interface provides methods to examine and explore a single portable device. The interface can be used to get information about a device and enumerate its storages. IWMDMDevice2 extends the capabilities of this interface.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmdevice
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMDevice
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a02-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The class identifier for WMDMDevice
     * @type {Guid}
     */
    static CLSID => Guid("{807b3cdf-357a-11d3-8471-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetManufacturer", "GetVersion", "GetType", "GetSerialNumber", "GetPowerSource", "GetStatus", "GetDeviceIcon", "EnumStorage", "GetFormatSupport", "SendOpaqueCommand"]

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-getname
     */
    GetName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(3, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-getmanufacturer
     */
    GetManufacturer(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(4, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<Integer>} pdwVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pdwVersion) {
        result := ComCall(5, this, "uint*", pdwVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-gettype
     */
    GetType(pdwType) {
        result := ComCall(6, this, "uint*", pdwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WMDMID>} pSerialNumber 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-getserialnumber
     */
    GetSerialNumber(pSerialNumber, abMac) {
        result := ComCall(7, this, "ptr", pSerialNumber, "char*", abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPowerSource 
     * @param {Pointer<Integer>} pdwPercentRemaining 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-getpowersource
     */
    GetPowerSource(pdwPowerSource, pdwPercentRemaining) {
        result := ComCall(8, this, "uint*", pdwPowerSource, "uint*", pdwPercentRemaining, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-getstatus
     */
    GetStatus(pdwStatus) {
        result := ComCall(9, this, "uint*", pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} hIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-getdeviceicon
     */
    GetDeviceIcon(hIcon) {
        result := ComCall(10, this, "uint*", hIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMEnumStorage>} ppEnumStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-enumstorage
     */
    EnumStorage(ppEnumStorage) {
        result := ComCall(11, this, "ptr*", ppEnumStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppFormatEx 
     * @param {Pointer<Integer>} pnFormatCount 
     * @param {Pointer<Pointer<PWSTR>>} pppwszMimeType 
     * @param {Pointer<Integer>} pnMimeTypeCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-getformatsupport
     */
    GetFormatSupport(ppFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount) {
        result := ComCall(12, this, "ptr*", ppFormatEx, "uint*", pnFormatCount, "ptr*", pppwszMimeType, "uint*", pnMimeTypeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OPAQUECOMMAND>} pCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice-sendopaquecommand
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(13, this, "ptr", pCommand, "HRESULT")
        return result
    }
}
