#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible storage module types.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmstoragemoduletype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmStorageModuleType{

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
