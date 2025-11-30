#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class REPLACE_FILE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static REPLACEFILE_WRITE_THROUGH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REPLACEFILE_IGNORE_MERGE_ERRORS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REPLACEFILE_IGNORE_ACL_ERRORS => 4
}
