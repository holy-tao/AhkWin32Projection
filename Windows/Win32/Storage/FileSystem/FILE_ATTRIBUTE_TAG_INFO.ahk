#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Receives the requested file attribute information. Used for any handles.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_attribute_tag_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_ATTRIBUTE_TAG_INFO {
    #StructPack 4

    /**
     * The file attribute information.
     */
    FileAttributes : UInt32

    /**
     * The reparse tag.
     */
    ReparseTag : UInt32

}
