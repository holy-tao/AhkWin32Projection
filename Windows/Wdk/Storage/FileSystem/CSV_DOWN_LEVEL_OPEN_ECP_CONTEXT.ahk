#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\CSV_DOWN_LEVEL_FILE_TYPE.ahk" { CSV_DOWN_LEVEL_FILE_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CSV_DOWN_LEVEL_OPEN_ECP_CONTEXT {
    #StructPack 4

    Version : UInt32

    IsResume : BOOLEAN

    FileType : CSV_DOWN_LEVEL_FILE_TYPE

    SourceNodeId : UInt32

    DestinationNodeId : UInt32

}
