#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_COPY_STYLE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_DELETESOURCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_REPLACEONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_NEWER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_NEWER_OR_SAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_NOOVERWRITE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_NODECOMP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_LANGUAGEAWARE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_SOURCE_ABSOLUTE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_SOURCEPATH_ABSOLUTE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_IN_USE_NEEDS_REBOOT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_FORCE_IN_USE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_NOSKIP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_FORCE_NOOVERWRITE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_FORCE_NEWER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_WARNIFSKIP => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_NOBROWSE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_NEWER_ONLY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_RESERVED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_OEMINF_CATALOG_ONLY => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_REPLACE_BOOT_FILE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_NOPRUNE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_OEM_F6_INF => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_ALREADYDECOMP => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_WINDOWS_SIGNED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_PNPLOCKED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_IN_USE_TRY_RENAME => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_INBOX_INF => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SP_COPY_HARDLINK => 268435456
}
