#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDEREGS.ahk" { IDEREGS }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SENDCMDINPARAMS {
    #StructPack 4

    cBufferSize : UInt32

    irDriveRegs : IDEREGS

    bDriveNumber : Int8

    bReserved : Int8[3]

    dwReserved : UInt32[4]

    bBuffer : Int8[1]

}
