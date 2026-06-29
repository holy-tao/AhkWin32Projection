#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CDROM_SPEED_REQUEST.ahk" { CDROM_SPEED_REQUEST }
#Import ".\WRITE_ROTATION.ahk" { WRITE_ROTATION }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_SET_SPEED {
    #StructPack 4

    RequestType : CDROM_SPEED_REQUEST

    ReadSpeed : UInt16

    WriteSpeed : UInt16

    RotationControl : WRITE_ROTATION

}
