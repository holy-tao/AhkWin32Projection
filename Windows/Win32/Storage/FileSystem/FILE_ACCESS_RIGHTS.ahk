#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_ACCESS_RIGHTS extends Win32BitflagEnum {

    /**
     * Native name: FILE_READ_DATA
     * @type {Integer (UInt32)}
     */
    static READ_DATA => 1

    /**
     * Native name: FILE_LIST_DIRECTORY
     * @type {Integer (UInt32)}
     */
    static LIST_DIRECTORY => 1

    /**
     * Native name: FILE_WRITE_DATA
     * @type {Integer (UInt32)}
     */
    static WRITE_DATA => 2

    /**
     * Native name: FILE_ADD_FILE
     * @type {Integer (UInt32)}
     */
    static ADD_FILE => 2

    /**
     * Native name: FILE_APPEND_DATA
     * @type {Integer (UInt32)}
     */
    static APPEND_DATA => 4

    /**
     * Native name: FILE_ADD_SUBDIRECTORY
     * @type {Integer (UInt32)}
     */
    static ADD_SUBDIRECTORY => 4

    /**
     * Native name: FILE_CREATE_PIPE_INSTANCE
     * @type {Integer (UInt32)}
     */
    static CREATE_PIPE_INSTANCE => 4

    /**
     * Native name: FILE_READ_EA
     * @type {Integer (UInt32)}
     */
    static READ_EA => 8

    /**
     * Native name: FILE_WRITE_EA
     * @type {Integer (UInt32)}
     */
    static WRITE_EA => 16

    /**
     * Native name: FILE_EXECUTE
     * @type {Integer (UInt32)}
     */
    static EXECUTE => 32

    /**
     * Native name: FILE_TRAVERSE
     * @type {Integer (UInt32)}
     */
    static TRAVERSE => 32

    /**
     * Native name: FILE_DELETE_CHILD
     * @type {Integer (UInt32)}
     */
    static DELETE_CHILD => 64

    /**
     * Native name: FILE_READ_ATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static READ_ATTRIBUTES => 128

    /**
     * Native name: FILE_WRITE_ATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static WRITE_ATTRIBUTES => 256

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
     * Native name: FILE_ALL_ACCESS
     * @type {Integer (UInt32)}
     */
    static ALL_ACCESS => 2032127

    /**
     * Native name: FILE_GENERIC_READ
     * @type {Integer (UInt32)}
     */
    static GENERIC_READ => 1179785

    /**
     * Native name: FILE_GENERIC_WRITE
     * @type {Integer (UInt32)}
     */
    static GENERIC_WRITE => 1179926

    /**
     * Native name: FILE_GENERIC_EXECUTE
     * @type {Integer (UInt32)}
     */
    static GENERIC_EXECUTE => 1179808
}
