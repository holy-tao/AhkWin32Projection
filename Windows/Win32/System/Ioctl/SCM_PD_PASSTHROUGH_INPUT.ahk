#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_PASSTHROUGH_INPUT {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    ProtocolGuid : Guid

    DataSize : UInt32

    Data : Int8[1]

}
