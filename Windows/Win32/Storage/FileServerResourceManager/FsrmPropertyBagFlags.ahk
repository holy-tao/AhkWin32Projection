#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines flag values that provide additional information about the property bag.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertybagflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPropertyBagFlags extends Win32Enum{

    /**
     * The properties in the property bag were updated by a classifier.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyBagFlags_UpdatedByClassifier => 1

    /**
     * The properties in the property bag may only be partially classified because a failure occurred while loading properties from storage.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyBagFlags_FailedLoadingProperties => 2

    /**
     * The properties in the property bag failed to be saved by the storage module with the highest precedence.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyBagFlags_FailedSavingProperties => 4

    /**
     * The properties in the property bag may only be partially classified because a failure occurred while classifying properties.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyBagFlags_FailedClassifyingProperties => 8
}
