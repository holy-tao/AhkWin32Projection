#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class VS_FIXEDFILEINFO_FILE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: VS_FF_DEBUG
     * @type {Integer (UInt32)}
     */
    static FF_DEBUG => 1

    /**
     * Native name: VS_FF_PRERELEASE
     * @type {Integer (UInt32)}
     */
    static FF_PRERELEASE => 2

    /**
     * Native name: VS_FF_PATCHED
     * @type {Integer (UInt32)}
     */
    static FF_PATCHED => 4

    /**
     * Native name: VS_FF_PRIVATEBUILD
     * @type {Integer (UInt32)}
     */
    static FF_PRIVATEBUILD => 8

    /**
     * Native name: VS_FF_INFOINFERRED
     * @type {Integer (UInt32)}
     */
    static FF_INFOINFERRED => 16

    /**
     * Native name: VS_FF_SPECIALBUILD
     * @type {Integer (UInt32)}
     */
    static FF_SPECIALBUILD => 32
}
