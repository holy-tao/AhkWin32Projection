#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_CONVERSION_OUTPUT {
    #StructPack 4

    Version : UInt32

    Source : Guid

}
