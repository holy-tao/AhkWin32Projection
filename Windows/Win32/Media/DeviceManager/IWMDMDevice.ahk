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
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     */
    GetName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(3, this, "ptr", pwszName, "uint", nMaxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     */
    GetManufacturer(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(4, this, "ptr", pwszName, "uint", nMaxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<UInt32>} pdwVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pdwVersion) {
        result := ComCall(5, this, "uint*", pdwVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwType 
     * @returns {HRESULT} 
     */
    GetType(pdwType) {
        result := ComCall(6, this, "uint*", pdwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WMDMID>} pSerialNumber 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    GetSerialNumber(pSerialNumber, abMac) {
        result := ComCall(7, this, "ptr", pSerialNumber, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPowerSource 
     * @param {Pointer<UInt32>} pdwPercentRemaining 
     * @returns {HRESULT} 
     */
    GetPowerSource(pdwPowerSource, pdwPercentRemaining) {
        result := ComCall(8, this, "uint*", pdwPowerSource, "uint*", pdwPercentRemaining, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(9, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} hIcon 
     * @returns {HRESULT} 
     */
    GetDeviceIcon(hIcon) {
        result := ComCall(10, this, "uint*", hIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMEnumStorage>} ppEnumStorage 
     * @returns {HRESULT} 
     */
    EnumStorage(ppEnumStorage) {
        result := ComCall(11, this, "ptr", ppEnumStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} ppFormatEx 
     * @param {Pointer<UInt32>} pnFormatCount 
     * @param {Pointer<PWSTR>} pppwszMimeType 
     * @param {Pointer<UInt32>} pnMimeTypeCount 
     * @returns {HRESULT} 
     */
    GetFormatSupport(ppFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount) {
        result := ComCall(12, this, "ptr", ppFormatEx, "uint*", pnFormatCount, "ptr", pppwszMimeType, "uint*", pnMimeTypeCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OPAQUECOMMAND>} pCommand 
     * @returns {HRESULT} 
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(13, this, "ptr", pCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
