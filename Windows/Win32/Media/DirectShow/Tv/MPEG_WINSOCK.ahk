#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPEG_WINSOCK structure is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_winsock
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_WINSOCK {
    #StructPack 4

    /**
     * Reserved.
     */
    AVMGraphId : UInt32

}
