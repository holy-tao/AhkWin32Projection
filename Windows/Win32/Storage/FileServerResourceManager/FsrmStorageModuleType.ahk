#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible storage module types.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmstoragemoduletype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmStorageModuleType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The module type is unknown. Do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleType_Unknown => 0

    /**
     * The storage module caches classification properties for quick access. This type is reserved for use by FSRM 
     *       and should not be used by any third party providers.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleType_Cache => 1

    /**
     * The storage module stores classification properties within the file itself.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleType_InFile => 2

    /**
     * The storage module stores classification properties in a database.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleType_Database => 3

    /**
     * The storage module stores classification properties in system data store. This type is reserved for use by 
     *        FSRM and should not be used by any third party providers.
     * 
     * <b>Windows Server 2008 R2:  </b>This storage module type is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleType_System => 100
}
