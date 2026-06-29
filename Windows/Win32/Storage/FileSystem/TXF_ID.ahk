#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a unique identifier within the context of the Resource Manager.
 * @see https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_id
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TXF_ID {
    #StructPack 8

    LowPart : Int64

    HighPart : Int64

}
