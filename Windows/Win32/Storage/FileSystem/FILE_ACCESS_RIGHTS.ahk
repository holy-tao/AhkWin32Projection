#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ACCESS_RIGHTS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_READ_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LIST_DIRECTORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_WRITE_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ADD_FILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_APPEND_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ADD_SUBDIRECTORY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CREATE_PIPE_INSTANCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_READ_EA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_WRITE_EA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EXECUTE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TRAVERSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DELETE_CHILD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_READ_ATTRIBUTES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_WRITE_ATTRIBUTES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DELETE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static READ_CONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_OWNER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_REQUIRED => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_READ => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_WRITE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_EXECUTE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_ALL => 2031616

    /**
     * @type {Integer (UInt32)}
     */
    static SPECIFIC_RIGHTS_ALL => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ALL_ACCESS => 2032127

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_GENERIC_READ => 1179785

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_GENERIC_WRITE => 1179926

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_GENERIC_EXECUTE => 1179808
}
