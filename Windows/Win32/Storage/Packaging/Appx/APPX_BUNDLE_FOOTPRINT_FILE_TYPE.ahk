#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of footprint file in a bundle.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ne-appxpackaging-appx_bundle_footprint_file_type
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_BUNDLE_FOOTPRINT_FILE_TYPE extends Win32Enum{

    /**
     * The bundle's first footprint file, which is the bundle manifest.
     * @type {Integer (Int32)}
     */
    static APPX_BUNDLE_FOOTPRINT_FILE_TYPE_FIRST => 0

    /**
     * The bundle manifest.
     * @type {Integer (Int32)}
     */
    static APPX_BUNDLE_FOOTPRINT_FILE_TYPE_MANIFEST => 0

    /**
     * The bundle block map.
     * @type {Integer (Int32)}
     */
    static APPX_BUNDLE_FOOTPRINT_FILE_TYPE_BLOCKMAP => 1

    /**
     * The bundle signature.
     * @type {Integer (Int32)}
     */
    static APPX_BUNDLE_FOOTPRINT_FILE_TYPE_SIGNATURE => 2

    /**
     * The bundle's last footprint file, which is the bundle signature.
     * @type {Integer (Int32)}
     */
    static APPX_BUNDLE_FOOTPRINT_FILE_TYPE_LAST => 2
}
