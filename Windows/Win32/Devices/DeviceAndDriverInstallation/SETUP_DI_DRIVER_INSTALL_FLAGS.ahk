#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_DRIVER_INSTALL_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_DUPDESC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_OLDDRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_EXCLUDEFROMLIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_NODRIVER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_LEGACYINF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_CLASS_DRIVER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_COMPATIBLE_DRIVER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_INET_DRIVER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED1 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED2 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_OLD_INET_DRIVER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_BAD_DRIVER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_DUPPROVIDER => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_INF_IS_SIGNED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_OEM_F6_INF => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_DUPDRIVERVER => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_BASIC_DRIVER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_AUTHENTICODE_SIGNED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_INSTALLEDDRIVER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_ALWAYSEXCLUDEFROMLIST => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_INBOX_DRIVER => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_REQUESTADDITIONALSOFTWARE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_22 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_23 => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_24 => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_25 => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_26 => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_27 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_28 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_29 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_30 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DNF_UNUSED_31 => 2147483648
}
