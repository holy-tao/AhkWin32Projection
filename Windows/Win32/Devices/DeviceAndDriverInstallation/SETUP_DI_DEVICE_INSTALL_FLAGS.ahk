#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_DEVICE_INSTALL_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DI_SHOWOEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI_SHOWCOMPAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI_SHOWCLASS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI_SHOWALL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NOVCP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DI_DIDCOMPAT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DI_DIDCLASS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DI_AUTOASSIGNRES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NEEDRESTART => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NEEDREBOOT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NOBROWSE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DI_MULTMFGS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DI_DISABLED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DI_GENERALPAGE_ADDED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DI_RESOURCEPAGE_ADDED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DI_PROPERTIES_CHANGE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DI_INF_IS_SORTED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DI_ENUMSINGLEINF => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DI_DONOTCALLCONFIGMG => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DI_INSTALLDISABLED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DI_COMPAT_FROM_CLASS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DI_CLASSINSTALLPARAMS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NODI_DEFAULTACTION => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DI_QUIETINSTALL => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NOFILECOPY => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FORCECOPY => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DI_DRIVERPAGE_ADDED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DI_USECI_SELECTSTRINGS => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DI_OVERRIDE_INFFLAGS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DI_PROPS_NOCHANGEUSAGE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NOSELECTICONS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NOWRITE_IDS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DI_UNREMOVEDEVICE_CONFIGSPECIFIC => 2
}
