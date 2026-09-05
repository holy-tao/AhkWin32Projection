#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of footprint file in a package.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_footprint_file_type
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class APPX_FOOTPRINT_FILE_TYPE extends Win32Enum {

    /**
     * The package manifest.
     * Native name: APPX_FOOTPRINT_FILE_TYPE_MANIFEST
     * @type {Integer (Int32)}
     */
    static MANIFEST => 0

    /**
     * The package block map.
     * Native name: APPX_FOOTPRINT_FILE_TYPE_BLOCKMAP
     * @type {Integer (Int32)}
     */
    static BLOCKMAP => 1

    /**
     * The package signature.
     * Native name: APPX_FOOTPRINT_FILE_TYPE_SIGNATURE
     * @type {Integer (Int32)}
     */
    static SIGNATURE => 2

    /**
     * The code signing catalog file used for code integrity checks.
     * Native name: APPX_FOOTPRINT_FILE_TYPE_CODEINTEGRITY
     * @type {Integer (Int32)}
     */
    static CODEINTEGRITY => 3

    /**
     * The content group map used for streaming install.
     * Native name: APPX_FOOTPRINT_FILE_TYPE_CONTENTGROUPMAP
     * @type {Integer (Int32)}
     */
    static CONTENTGROUPMAP => 4
}
