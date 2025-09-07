#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VER_INSTALL_FILE_STATUS{

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_TEMPFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_MISMATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_SRCOLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_DIFFLANG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_DIFFCODEPG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_DIFFTYPE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_WRITEPROT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_FILEINUSE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_OUTOFSPACE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_ACCESSVIOLATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_SHARINGVIOLATION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_CANNOTCREATE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_CANNOTDELETE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_CANNOTRENAME => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_CANNOTDELETECUR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_OUTOFMEMORY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_CANNOTREADSRC => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_CANNOTREADDST => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_BUFFTOOSMALL => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_CANNOTLOADLZ32 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static VIF_CANNOTLOADCABINET => 1048576
}
