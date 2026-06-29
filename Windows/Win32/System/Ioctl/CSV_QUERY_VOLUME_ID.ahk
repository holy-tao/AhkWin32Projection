#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CSV_QUERY_VOLUME_ID {
    #StructPack 4

    VolumeId : Guid

}
