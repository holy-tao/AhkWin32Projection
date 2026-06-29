#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRIVERSTATUS.ahk" { DRIVERSTATUS }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SENDCMDOUTPARAMS {
    #StructPack 4

    cBufferSize : UInt32

    DriverStatus : DRIVERSTATUS

    bBuffer : Int8[1]

}
