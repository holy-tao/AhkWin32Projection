#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct QUERY_FILE_LAYOUT_OUTPUT {
    #StructPack 4

    FileEntryCount : UInt32

    FirstFileOffset : UInt32

    Flags : UInt32

    Reserved : UInt32

}
