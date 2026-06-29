#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_INTERLEAVED_PD_INFO {
    #StructPack 4

    DeviceHandle : UInt32

    DeviceGuid : Guid

}
