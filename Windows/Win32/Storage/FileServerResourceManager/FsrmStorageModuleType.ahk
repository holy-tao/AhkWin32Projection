#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible storage module types.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmstoragemoduletype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmStorageModuleType extends Win32Enum {

    /**
     * The module type is unknown. Do not use this value.
     * Native name: FsrmStorageModuleType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The storage module caches classification properties for quick access. This type is reserved for use by FSRM 
     *       and should not be used by any third party providers.
     * Native name: FsrmStorageModuleType_Cache
     * @type {Integer (Int32)}
     */
    static Cache => 1

    /**
     * The storage module stores classification properties within the file itself.
     * Native name: FsrmStorageModuleType_InFile
     * @type {Integer (Int32)}
     */
    static InFile => 2

    /**
     * The storage module stores classification properties in a database.
     * Native name: FsrmStorageModuleType_Database
     * @type {Integer (Int32)}
     */
    static Database => 3

    /**
     * The storage module stores classification properties in system data store. This type is reserved for use by 
     *        FSRM and should not be used by any third party providers.
     * 
     * <b>Windows Server 2008 R2:  </b>This storage module type is not supported before Windows Server 2012.
     * Native name: FsrmStorageModuleType_System
     * @type {Integer (Int32)}
     */
    static System => 100
}
