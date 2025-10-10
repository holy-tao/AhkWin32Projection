#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of footprint file in a package.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ne-appxpackaging-appx_footprint_file_type
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_FOOTPRINT_FILE_TYPE{

    /**
     * The package manifest.
     * @type {Integer (Int32)}
     */
    static APPX_FOOTPRINT_FILE_TYPE_MANIFEST => 0

    /**
     * The package block map.
     * @type {Integer (Int32)}
     */
    static APPX_FOOTPRINT_FILE_TYPE_BLOCKMAP => 1

    /**
     * The package signature.
     * @type {Integer (Int32)}
     */
    static APPX_FOOTPRINT_FILE_TYPE_SIGNATURE => 2

    /**
     * The code signing catalog file used for code integrity checks.
     * @type {Integer (Int32)}
     */
    static APPX_FOOTPRINT_FILE_TYPE_CODEINTEGRITY => 3

    /**
     * The content group map used for streaming install.
     * @type {Integer (Int32)}
     */
    static APPX_FOOTPRINT_FILE_TYPE_CONTENTGROUPMAP => 4
}
