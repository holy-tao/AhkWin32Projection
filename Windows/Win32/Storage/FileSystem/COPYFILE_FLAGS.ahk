#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class COPYFILE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_FAIL_IF_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_RESTARTABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_OPEN_SOURCE_FOR_WRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_ALLOW_DECRYPTED_DESTINATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_COPY_SYMLINK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_NO_BUFFERING => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_REQUEST_SECURITY_PRIVILEGES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_RESUME_FROM_PAUSE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_NO_OFFLOAD => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_IGNORE_EDP_BLOCK => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_IGNORE_SOURCE_ENCRYPTION => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_DONT_REQUEST_DEST_WRITE_DAC => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_REQUEST_COMPRESSED_TRAFFIC => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_OPEN_AND_COPY_REPARSE_POINT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_DIRECTORY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_SKIP_ALTERNATE_STREAMS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_DISABLE_PRE_ALLOCATION => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_ENABLE_LOW_FREE_SPACE_MODE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_ENABLE_SPARSE_COPY => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE_DISABLE_SPARSE_COPY => 2147483648
}
