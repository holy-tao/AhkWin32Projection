#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of footprint file in a bundle.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_bundle_footprint_file_type
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class APPX_BUNDLE_FOOTPRINT_FILE_TYPE extends Win32Enum {

    /**
     * The bundle's first footprint file, which is the bundle manifest.
     * Native name: APPX_BUNDLE_FOOTPRINT_FILE_TYPE_FIRST
     * @type {Integer (Int32)}
     */
    static FIRST => 0

    /**
     * The bundle manifest.
     * Native name: APPX_BUNDLE_FOOTPRINT_FILE_TYPE_MANIFEST
     * @type {Integer (Int32)}
     */
    static MANIFEST => 0

    /**
     * The bundle block map.
     * Native name: APPX_BUNDLE_FOOTPRINT_FILE_TYPE_BLOCKMAP
     * @type {Integer (Int32)}
     */
    static BLOCKMAP => 1

    /**
     * The bundle signature.
     * Native name: APPX_BUNDLE_FOOTPRINT_FILE_TYPE_SIGNATURE
     * @type {Integer (Int32)}
     */
    static SIGNATURE => 2

    /**
     * The bundle's last footprint file, which is the bundle signature.
     * Native name: APPX_BUNDLE_FOOTPRINT_FILE_TYPE_LAST
     * @type {Integer (Int32)}
     */
    static LAST => 2
}
