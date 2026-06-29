#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB4_STATUS.ahk" { USB4_STATUS }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB4_HRD_DEBUG_READ_CONFIGURATION_SPACE_OUTPUT {
    #StructPack 4

    Usb4Status : USB4_STATUS

    Data : UInt32[60]

}
