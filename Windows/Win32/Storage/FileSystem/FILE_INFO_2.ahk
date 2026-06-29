#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the identification number for a file, device, or pipe.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-file_info_2
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_INFO_2 {
    #StructPack 4

    /**
     * Specifies a DWORD value that contains the identification number assigned to the resource when it is opened.
     */
    fi2_id : UInt32

}
