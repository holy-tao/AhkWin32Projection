#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_QUERY_VOLUME_DEDUP_INFO_OUTPUT_BUFFER {
    #StructPack 1

    Enabled : BOOLEAN

}
