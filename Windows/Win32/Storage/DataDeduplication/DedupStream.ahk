#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DedupStream {
    #StructPack 8

    Path : BSTR

    Offset : Int64

    Length : Int64

    ChunkCount : UInt32

}
