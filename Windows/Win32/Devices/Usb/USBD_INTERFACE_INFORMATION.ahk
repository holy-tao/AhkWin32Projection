#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USBD_PIPE_INFORMATION.ahk" { USBD_PIPE_INFORMATION }
#Import ".\USBD_PIPE_TYPE.ahk" { USBD_PIPE_TYPE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBD_INTERFACE_INFORMATION {
    #StructPack 8

    Length : UInt16

    InterfaceNumber : Int8

    AlternateSetting : Int8

    Class : Int8

    SubClass : Int8

    Protocol : Int8

    Reserved : Int8

    InterfaceHandle : IntPtr

    NumberOfPipes : UInt32

    Pipes : USBD_PIPE_INFORMATION[1]

}
