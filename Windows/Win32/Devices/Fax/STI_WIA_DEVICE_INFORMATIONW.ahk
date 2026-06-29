#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\STI_DEV_CAPS.ahk" { STI_DEV_CAPS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct STI_WIA_DEVICE_INFORMATIONW {
    #StructPack 8

    dwSize : UInt32

    DeviceType : UInt32

    szDeviceInternalName : WCHAR[128]

    DeviceCapabilitiesA : STI_DEV_CAPS

    dwHardwareConfiguration : UInt32

    pszVendorDescription : PWSTR

    pszDeviceDescription : PWSTR

    pszPortName : PWSTR

    pszPropProvider : PWSTR

    pszLocalName : PWSTR

    pszUiDll : PWSTR

    pszServer : PWSTR

}
