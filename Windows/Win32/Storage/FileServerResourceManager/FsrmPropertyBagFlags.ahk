#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flag values that provide additional information about the property bag.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertybagflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmPropertyBagFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
