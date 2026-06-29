#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CDROM_SPEED_REQUEST.ahk" { CDROM_SPEED_REQUEST }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WRITE_ROTATION.ahk" { WRITE_ROTATION }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_SET_STREAMING {
    #StructPack 4

    RequestType : CDROM_SPEED_REQUEST

    ReadSize : UInt32

    ReadTime : UInt32

    WriteSize : UInt32

    WriteTime : UInt32

    StartLba : UInt32

    EndLba : UInt32

    RotationControl : WRITE_ROTATION

    RestoreDefaults : BOOLEAN

    SetExact : BOOLEAN

    RandomAccess : BOOLEAN

    Persistent : BOOLEAN

}
