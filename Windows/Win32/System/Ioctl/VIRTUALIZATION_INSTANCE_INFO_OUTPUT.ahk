#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct VIRTUALIZATION_INSTANCE_INFO_OUTPUT {
    #StructPack 4

    VirtualizationInstanceID : Guid

}
