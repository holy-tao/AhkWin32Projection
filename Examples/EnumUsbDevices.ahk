#Include <AhkWin32Projection\Windows\Win32\Devices\DeviceAndDriverInstallation\Apis>
#Include <AhkWin32Projection\Windows\Win32\Devices\DeviceAndDriverInstallation\SP_DEVICE_INTERFACE_DATA>
#Include <AhkWin32Projection\Windows\Win32\Devices\DeviceAndDriverInstallation\SP_DEVINFO_DATA>
#Include <AhkWin32Projection\Windows\Win32\Devices\DeviceAndDriverInstallation\SETUP_DI_GET_CLASS_DEVS_FLAGS>
#Include <AhkWin32Projection\Windows\Win32\Devices\DeviceAndDriverInstallation\SETUP_DI_REGISTRY_PROPERTY>

#Include <AhkWin32Projection\Windows\Win32\Devices\Usb\Apis>
#Include <AhkWin32Projection\Windows\Win32\Devices\Usb\USB_DEVICE_DESCRIPTOR>

#DllLoad setupapi.dll

/**
 * Enumerates USB decices. Mostly follows https://cdn.velleman.eu/images/tmp/usbfind.c. There's probably some 
 * optimization to be had in the flags to avoid enumerating unnecessary devices.
 * 
 * Prints a series of device paths to the console with friendly name and manufacturer (if available), like:
 * \\?\usb#vid_0bda&pid_8153#10136c6e0722237a#{a5dcbf10-6530-11d2-901f-00c04fb951ed}
 *      Friendly Name: 'Realtek USB GbE Family Controller'
 *      Manufacturer: 'Realtek'
 * The path can be parsed for vid and guid, or you can use GetDeviceProperty
 */

; GUID_DEVINTERFACE_USB_DEVICE means enumerate all devices
; devInfo is an HDEVINFO handle; will clean itself up
devInfo := DeviceAndDriverInstallation.SetupDiGetClassDevsW(Usb.GUID_DEVINTERFACE_USB_DEVICE, 0, 0, 
    SETUP_DI_GET_CLASS_DEVS_FLAGS.DIGCF_DEVICEINTERFACE | SETUP_DI_GET_CLASS_DEVS_FLAGS.DIGCF_PRESENT)

; Allocate structs to receive device data
devInterfaceData := SP_DEVICE_INTERFACE_DATA()
devData := SP_DEVINFO_DATA()

; Despite the name, SetupDiEnumDeviceInterfaces enumerates interfaces and returns false and throws when its out of
; data. Obnoxious pattern, but older and lower-level APIs often work like this.
idx := 0
while(true) {
    try {
        DeviceAndDriverInstallation.SetupDiEnumDeviceInterfaces(devInfo, 0, Usb.GUID_DEVINTERFACE_USB_DEVICE, idx, devInterfaceData)
        DeviceAndDriverInstallation.SetupDiEnumDeviceInfo(devInfo, idx, devData)

        idx++
    }
    catch OSError as err {
        if(err.Number == 259)
            break   ; No more data available
        throw err
    }

    ; Get PATH - if all you need is vid and guid, this'll do ya (though you'll have to parse it)

    ; SP_DEVICE_INTERFACE_DETAIL_DATA_W is a variable-size struct with two members, a cbSize and a string
    ; Note - will throw (Sets LastError) if size is too small, but populates dwSize. More robust check would be to
    ; catch OSErrors and ignore if Number = 122 (See GetDeviceProperty)
    try DeviceAndDriverInstallation.SetupDiGetDeviceInterfaceDetailW(devInfo, devInterfaceData, 0, 0, &dwSize := -1, 0)

    devDetailData := Buffer(dwSize, 0)
    NumPut("uint", 8, devDetailData, 0)

    DeviceAndDriverInstallation.SetupDiGetDeviceInterfaceDetailW(devInfo, devInterfaceData, devDetailData, dwSize, 0, 0)
    devicePath := StrGet(devDetailData.Ptr + 4, , "UTF-16")

    ; Alternately, pull registry properties:
    friendlyName := GetDeviceProperty(devInfo, devData, SETUP_DI_REGISTRY_PROPERTY.SPDRP_FRIENDLYNAME)
    mfg := GetDeviceProperty(devInfo, devData, SETUP_DI_REGISTRY_PROPERTY.SPDRP_MFG)


    FileAppend(devicePath . "`n", "*")
    FileAppend(Format("`tFriendly Name: '{1}'`n", friendlyName), "*")
    FileAppend(Format("`tManufacturer: '{1}'`n", mfg), "*")
}

GetDeviceProperty(devInfo, devData, prop) {
    try {
        DeviceAndDriverInstallation.SetupDiGetDeviceRegistryPropertyW(devInfo, devData, prop, 0, 0, 0, &dwSize := 0)
    }
    catch OSError as err {
        ; 13 is ERR_INVALID_DATA, indicates that the property doesn't exist for this device
        if(err.Number == 13)
            return ""

        ; 122 is buffer too small, expected since we're querying for the required size. All others are true errors
        if(err.Number != 122)
            throw err  
    }

    propBuf := Buffer(dwSize, 0)
    DeviceAndDriverInstallation.SetupDiGetDeviceRegistryPropertyW(devInfo, devData, prop, 0, propBuf, dwSize, 0)
    return StrGet(propBuf, , "UTF-16")
}
