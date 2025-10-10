#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the file management job types.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmfilemanagementtype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileManagementType{

    /**
     * The file management type is unknown; do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmFileManagementType_Unknown => 0

    /**
     * The file management job expires files meeting the specified criteria.
     * @type {Integer (Int32)}
     */
    static FsrmFileManagementType_Expiration => 1

    /**
     * This file management job runs a custom action on files meeting the specified criteria.
     * @type {Integer (Int32)}
     */
    static FsrmFileManagementType_Custom => 2

    /**
     * The file management jobs runs an RMS action on files meeting the specified criteria.
 * 
 * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmFileManagementType_Rms => 3
}
