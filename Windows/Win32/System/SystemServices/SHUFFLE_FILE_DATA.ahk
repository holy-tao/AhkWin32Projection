#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SHUFFLE_FILE_DATA {
    #StructPack 8

    StartingOffset : Int64

    Length : Int64

    Flags : UInt32

}
