#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CONNECTION_DES.ahk" { CONNECTION_DES }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CONNECTION_RESOURCE {
    #StructPack 8

    Connection_Header : CONNECTION_DES

}
