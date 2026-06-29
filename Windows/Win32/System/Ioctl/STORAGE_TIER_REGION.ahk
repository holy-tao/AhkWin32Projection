#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_TIER_REGION {
    #StructPack 8

    TierId : Guid

    Offset : Int64

    Length : Int64

}
