#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_REGION_INFO.ahk" { FILE_REGION_INFO }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_REGION_OUTPUT {
    #StructPack 8

    Flags : UInt32

    TotalRegionEntryCount : UInt32

    RegionEntryCount : UInt32

    Reserved : UInt32

    Region : FILE_REGION_INFO[1]

}
