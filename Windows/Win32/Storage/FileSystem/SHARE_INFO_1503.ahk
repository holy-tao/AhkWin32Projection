#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_1503 {
    #StructPack 4

    shi1503_sharefilter : Guid

}
