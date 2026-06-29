#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RAW_PIPE_TYPE.ahk" { RAW_PIPE_TYPE }
#Import ".\USBSCAN_PIPE_INFORMATION.ahk" { USBSCAN_PIPE_INFORMATION }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBSCAN_PIPE_CONFIGURATION {
    #StructPack 4

    NumberOfPipes : UInt32

    PipeInfo : USBSCAN_PIPE_INFORMATION[8]

}
