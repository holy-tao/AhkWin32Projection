#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FS_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FileFsVolumeInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static FileFsLabelInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static FileFsSizeInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static FileFsDeviceInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static FileFsAttributeInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static FileFsControlInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static FileFsFullSizeInformation => 7

    /**
     * @type {Integer (Int32)}
     */
    static FileFsObjectIdInformation => 8

    /**
     * @type {Integer (Int32)}
     */
    static FileFsDriverPathInformation => 9

    /**
     * @type {Integer (Int32)}
     */
    static FileFsVolumeFlagsInformation => 10

    /**
     * @type {Integer (Int32)}
     */
    static FileFsSectorSizeInformation => 11

    /**
     * @type {Integer (Int32)}
     */
    static FileFsDataCopyInformation => 12

    /**
     * @type {Integer (Int32)}
     */
    static FileFsMetadataSizeInformation => 13

    /**
     * @type {Integer (Int32)}
     */
    static FileFsFullSizeInformationEx => 14

    /**
     * @type {Integer (Int32)}
     */
    static FileFsMaximumInformation => 15
}
