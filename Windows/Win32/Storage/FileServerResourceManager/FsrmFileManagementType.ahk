#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the file management job types.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmfilemanagementtype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmFileManagementType extends Win32Enum {

    /**
     * The file management type is unknown; do not use this value.
     * Native name: FsrmFileManagementType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The file management job expires files meeting the specified criteria.
     * Native name: FsrmFileManagementType_Expiration
     * @type {Integer (Int32)}
     */
    static Expiration => 1

    /**
     * This file management job runs a custom action on files meeting the specified criteria.
     * Native name: FsrmFileManagementType_Custom
     * @type {Integer (Int32)}
     */
    static Custom => 2

    /**
     * The file management jobs runs an RMS action on files meeting the specified criteria.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmFileManagementType_Rms
     * @type {Integer (Int32)}
     */
    static Rms => 3
}
