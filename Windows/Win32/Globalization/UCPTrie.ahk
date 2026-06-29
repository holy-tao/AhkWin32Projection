#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCPTrieData.ahk" { UCPTrieData }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCPTrie {
    #StructPack 8

    index : IntPtr

    data : UCPTrieData

    indexLength : Int32

    dataLength : Int32

    highStart : Int32

    shifted12HighStart : UInt16

    type : Int8

    valueWidth : Int8

    reserved32 : UInt32

    reserved16 : UInt16

    index3NullOffset : UInt16

    dataNullOffset : Int32

    nullValue : UInt32

}
