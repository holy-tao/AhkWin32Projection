#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPDevice interface provides an instance-based association with a media device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspdevice
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPDevice
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a12-33ed-11d3-8470-00c04f79dbc0}")

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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-getname
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-getmanufacturer
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
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-gettype
     */
    GetType(pdwType) {
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwTypeMarshal, pdwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WMDMID>} pSerialNumber 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-getserialnumber
     */
    GetSerialNumber(pSerialNumber, abMac) {
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pSerialNumber, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPowerSource 
     * @param {Pointer<Integer>} pdwPercentRemaining 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-getpowersource
     */
    GetPowerSource(pdwPowerSource, pdwPercentRemaining) {
        pdwPowerSourceMarshal := pdwPowerSource is VarRef ? "uint*" : "ptr"
        pdwPercentRemainingMarshal := pdwPercentRemaining is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwPowerSourceMarshal, pdwPowerSource, pdwPercentRemainingMarshal, pdwPercentRemaining, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-getstatus
     */
    GetStatus(pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} hIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-getdeviceicon
     */
    GetDeviceIcon(hIcon) {
        hIconMarshal := hIcon is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, hIconMarshal, hIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPEnumStorage>} ppEnumStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-enumstorage
     */
    EnumStorage(ppEnumStorage) {
        result := ComCall(11, this, "ptr*", ppEnumStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} pFormatEx 
     * @param {Pointer<Integer>} pnFormatCount 
     * @param {Pointer<Pointer<PWSTR>>} pppwszMimeType 
     * @param {Pointer<Integer>} pnMimeTypeCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-getformatsupport
     */
    GetFormatSupport(pFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount) {
        pFormatExMarshal := pFormatEx is VarRef ? "ptr*" : "ptr"
        pnFormatCountMarshal := pnFormatCount is VarRef ? "uint*" : "ptr"
        pppwszMimeTypeMarshal := pppwszMimeType is VarRef ? "ptr*" : "ptr"
        pnMimeTypeCountMarshal := pnMimeTypeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pFormatExMarshal, pFormatEx, pnFormatCountMarshal, pnFormatCount, pppwszMimeTypeMarshal, pppwszMimeType, pnMimeTypeCountMarshal, pnMimeTypeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OPAQUECOMMAND>} pCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice-sendopaquecommand
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(13, this, "ptr", pCommand, "HRESULT")
        return result
    }
}
