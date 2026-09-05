#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines flag values that provide additional information about the property bag.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertybagflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmPropertyBagFlags extends Win32Enum {

    /**
     * The properties in the property bag were updated by a classifier.
     * Native name: FsrmPropertyBagFlags_UpdatedByClassifier
     * @type {Integer (Int32)}
     */
    static UpdatedByClassifier => 1

    /**
     * The properties in the property bag may only be partially classified because a failure occurred while loading properties from storage.
     * Native name: FsrmPropertyBagFlags_FailedLoadingProperties
     * @type {Integer (Int32)}
     */
    static FailedLoadingProperties => 2

    /**
     * The properties in the property bag failed to be saved by the storage module with the highest precedence.
     * Native name: FsrmPropertyBagFlags_FailedSavingProperties
     * @type {Integer (Int32)}
     */
    static FailedSavingProperties => 4

    /**
     * The properties in the property bag may only be partially classified because a failure occurred while classifying properties.
     * Native name: FsrmPropertyBagFlags_FailedClassifyingProperties
     * @type {Integer (Int32)}
     */
    static FailedClassifyingProperties => 8
}
