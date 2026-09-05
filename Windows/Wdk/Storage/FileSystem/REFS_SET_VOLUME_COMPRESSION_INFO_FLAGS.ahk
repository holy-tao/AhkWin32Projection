#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_SET_VOLUME_COMPRESSION_INFO_FLAGS extends Win32Enum {

    /**
     * Native name: REFS_SET_VOLUME_COMPRESSION_INFO_FLAG_COMPRESS_SYNC
     * @type {Integer (Int32)}
     */
    static FLAG_COMPRESS_SYNC => 1

    /**
     * Native name: REFS_SET_VOLUME_COMPRESSION_INFO_FLAG_MAX
     * @type {Integer (Int32)}
     */
    static FLAG_MAX => 1
}
