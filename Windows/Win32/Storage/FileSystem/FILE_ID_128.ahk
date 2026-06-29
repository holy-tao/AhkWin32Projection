#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a 128-bit file identifier.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_id_128
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_ID_128 {
    #StructPack 1

    /**
     * A byte array containing  the 128 bit identifier.
     */
    Identifier : Int8[16]

}
