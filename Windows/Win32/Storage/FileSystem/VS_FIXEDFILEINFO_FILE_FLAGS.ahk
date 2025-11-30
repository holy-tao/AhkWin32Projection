#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VS_FIXEDFILEINFO_FILE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_DEBUG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_PRERELEASE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_PATCHED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_PRIVATEBUILD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_INFOINFERRED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_SPECIALBUILD => 32
}
