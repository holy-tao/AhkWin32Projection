#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class SETUP_DI_DEVICE_INSTALL_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DI_SHOWOEM
     * @type {Integer (UInt32)}
     */
    static SHOWOEM => 1

    /**
     * Native name: DI_SHOWCOMPAT
     * @type {Integer (UInt32)}
     */
    static SHOWCOMPAT => 2

    /**
     * Native name: DI_SHOWCLASS
     * @type {Integer (UInt32)}
     */
    static SHOWCLASS => 4

    /**
     * Native name: DI_SHOWALL
     * @type {Integer (UInt32)}
     */
    static SHOWALL => 7

    /**
     * Native name: DI_NOVCP
     * @type {Integer (UInt32)}
     */
    static NOVCP => 8

    /**
     * Native name: DI_DIDCOMPAT
     * @type {Integer (UInt32)}
     */
    static DIDCOMPAT => 16

    /**
     * Native name: DI_DIDCLASS
     * @type {Integer (UInt32)}
     */
    static DIDCLASS => 32

    /**
     * Native name: DI_AUTOASSIGNRES
     * @type {Integer (UInt32)}
     */
    static AUTOASSIGNRES => 64

    /**
     * Native name: DI_NEEDRESTART
     * @type {Integer (UInt32)}
     */
    static NEEDRESTART => 128

    /**
     * Native name: DI_NEEDREBOOT
     * @type {Integer (UInt32)}
     */
    static NEEDREBOOT => 256

    /**
     * Native name: DI_NOBROWSE
     * @type {Integer (UInt32)}
     */
    static NOBROWSE => 512

    /**
     * Native name: DI_MULTMFGS
     * @type {Integer (UInt32)}
     */
    static MULTMFGS => 1024

    /**
     * Native name: DI_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISABLED => 2048

    /**
     * Native name: DI_GENERALPAGE_ADDED
     * @type {Integer (UInt32)}
     */
    static GENERALPAGE_ADDED => 4096

    /**
     * Native name: DI_RESOURCEPAGE_ADDED
     * @type {Integer (UInt32)}
     */
    static RESOURCEPAGE_ADDED => 8192

    /**
     * Native name: DI_PROPERTIES_CHANGE
     * @type {Integer (UInt32)}
     */
    static PROPERTIES_CHANGE => 16384

    /**
     * Native name: DI_INF_IS_SORTED
     * @type {Integer (UInt32)}
     */
    static INF_IS_SORTED => 32768

    /**
     * Native name: DI_ENUMSINGLEINF
     * @type {Integer (UInt32)}
     */
    static ENUMSINGLEINF => 65536

    /**
     * Native name: DI_DONOTCALLCONFIGMG
     * @type {Integer (UInt32)}
     */
    static DONOTCALLCONFIGMG => 131072

    /**
     * Native name: DI_INSTALLDISABLED
     * @type {Integer (UInt32)}
     */
    static INSTALLDISABLED => 262144

    /**
     * Native name: DI_COMPAT_FROM_CLASS
     * @type {Integer (UInt32)}
     */
    static COMPAT_FROM_CLASS => 524288

    /**
     * Native name: DI_CLASSINSTALLPARAMS
     * @type {Integer (UInt32)}
     */
    static CLASSINSTALLPARAMS => 1048576

    /**
     * Native name: DI_NODI_DEFAULTACTION
     * @type {Integer (UInt32)}
     */
    static NODI_DEFAULTACTION => 2097152

    /**
     * Native name: DI_QUIETINSTALL
     * @type {Integer (UInt32)}
     */
    static QUIETINSTALL => 8388608

    /**
     * Native name: DI_NOFILECOPY
     * @type {Integer (UInt32)}
     */
    static NOFILECOPY => 16777216

    /**
     * Native name: DI_FORCECOPY
     * @type {Integer (UInt32)}
     */
    static FORCECOPY => 33554432

    /**
     * Native name: DI_DRIVERPAGE_ADDED
     * @type {Integer (UInt32)}
     */
    static DRIVERPAGE_ADDED => 67108864

    /**
     * Native name: DI_USECI_SELECTSTRINGS
     * @type {Integer (UInt32)}
     */
    static USECI_SELECTSTRINGS => 134217728

    /**
     * Native name: DI_OVERRIDE_INFFLAGS
     * @type {Integer (UInt32)}
     */
    static OVERRIDE_INFFLAGS => 268435456

    /**
     * Native name: DI_PROPS_NOCHANGEUSAGE
     * @type {Integer (UInt32)}
     */
    static PROPS_NOCHANGEUSAGE => 536870912

    /**
     * Native name: DI_NOSELECTICONS
     * @type {Integer (UInt32)}
     */
    static NOSELECTICONS => 1073741824

    /**
     * Native name: DI_NOWRITE_IDS
     * @type {Integer (UInt32)}
     */
    static NOWRITE_IDS => 2147483648

    /**
     * Native name: DI_UNREMOVEDEVICE_CONFIGSPECIFIC
     * @type {Integer (UInt32)}
     */
    static UNREMOVEDEVICE_CONFIGSPECIFIC => 2
}
