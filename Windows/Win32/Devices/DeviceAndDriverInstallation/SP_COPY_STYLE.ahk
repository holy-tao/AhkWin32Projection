#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class SP_COPY_STYLE extends Win32BitflagEnum {

    /**
     * Native name: SP_COPY_DELETESOURCE
     * @type {Integer (UInt32)}
     */
    static DELETESOURCE => 1

    /**
     * Native name: SP_COPY_REPLACEONLY
     * @type {Integer (UInt32)}
     */
    static REPLACEONLY => 2

    /**
     * Native name: SP_COPY_NEWER
     * @type {Integer (UInt32)}
     */
    static NEWER => 4

    /**
     * Native name: SP_COPY_NEWER_OR_SAME
     * @type {Integer (UInt32)}
     */
    static NEWER_OR_SAME => 4

    /**
     * Native name: SP_COPY_NOOVERWRITE
     * @type {Integer (UInt32)}
     */
    static NOOVERWRITE => 8

    /**
     * Native name: SP_COPY_NODECOMP
     * @type {Integer (UInt32)}
     */
    static NODECOMP => 16

    /**
     * Native name: SP_COPY_LANGUAGEAWARE
     * @type {Integer (UInt32)}
     */
    static LANGUAGEAWARE => 32

    /**
     * Native name: SP_COPY_SOURCE_ABSOLUTE
     * @type {Integer (UInt32)}
     */
    static SOURCE_ABSOLUTE => 64

    /**
     * Native name: SP_COPY_SOURCEPATH_ABSOLUTE
     * @type {Integer (UInt32)}
     */
    static SOURCEPATH_ABSOLUTE => 128

    /**
     * Native name: SP_COPY_IN_USE_NEEDS_REBOOT
     * @type {Integer (UInt32)}
     */
    static IN_USE_NEEDS_REBOOT => 256

    /**
     * Native name: SP_COPY_FORCE_IN_USE
     * @type {Integer (UInt32)}
     */
    static FORCE_IN_USE => 512

    /**
     * Native name: SP_COPY_NOSKIP
     * @type {Integer (UInt32)}
     */
    static NOSKIP => 1024

    /**
     * Native name: SP_COPY_FORCE_NOOVERWRITE
     * @type {Integer (UInt32)}
     */
    static FORCE_NOOVERWRITE => 4096

    /**
     * Native name: SP_COPY_FORCE_NEWER
     * @type {Integer (UInt32)}
     */
    static FORCE_NEWER => 8192

    /**
     * Native name: SP_COPY_WARNIFSKIP
     * @type {Integer (UInt32)}
     */
    static WARNIFSKIP => 16384

    /**
     * Native name: SP_COPY_NOBROWSE
     * @type {Integer (UInt32)}
     */
    static NOBROWSE => 32768

    /**
     * Native name: SP_COPY_NEWER_ONLY
     * @type {Integer (UInt32)}
     */
    static NEWER_ONLY => 65536

    /**
     * Native name: SP_COPY_RESERVED
     * @type {Integer (UInt32)}
     */
    static RESERVED => 131072

    /**
     * Native name: SP_COPY_OEMINF_CATALOG_ONLY
     * @type {Integer (UInt32)}
     */
    static OEMINF_CATALOG_ONLY => 262144

    /**
     * Native name: SP_COPY_REPLACE_BOOT_FILE
     * @type {Integer (UInt32)}
     */
    static REPLACE_BOOT_FILE => 524288

    /**
     * Native name: SP_COPY_NOPRUNE
     * @type {Integer (UInt32)}
     */
    static NOPRUNE => 1048576

    /**
     * Native name: SP_COPY_OEM_F6_INF
     * @type {Integer (UInt32)}
     */
    static OEM_F6_INF => 2097152

    /**
     * Native name: SP_COPY_ALREADYDECOMP
     * @type {Integer (UInt32)}
     */
    static ALREADYDECOMP => 4194304

    /**
     * Native name: SP_COPY_WINDOWS_SIGNED
     * @type {Integer (UInt32)}
     */
    static WINDOWS_SIGNED => 16777216

    /**
     * Native name: SP_COPY_PNPLOCKED
     * @type {Integer (UInt32)}
     */
    static PNPLOCKED => 33554432

    /**
     * Native name: SP_COPY_IN_USE_TRY_RENAME
     * @type {Integer (UInt32)}
     */
    static IN_USE_TRY_RENAME => 67108864

    /**
     * Native name: SP_COPY_INBOX_INF
     * @type {Integer (UInt32)}
     */
    static INBOX_INF => 134217728

    /**
     * Native name: SP_COPY_HARDLINK
     * @type {Integer (UInt32)}
     */
    static HARDLINK => 268435456
}
