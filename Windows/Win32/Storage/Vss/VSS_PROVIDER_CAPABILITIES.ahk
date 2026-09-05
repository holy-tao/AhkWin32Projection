#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_provider_capabilities
 * @namespace Windows.Win32.Storage.Vss
 */
class VSS_PROVIDER_CAPABILITIES extends Win32Enum {

    /**
     * Native name: VSS_PRV_CAPABILITY_LEGACY
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_LEGACY => 1

    /**
     * Native name: VSS_PRV_CAPABILITY_COMPLIANT
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_COMPLIANT => 2

    /**
     * Native name: VSS_PRV_CAPABILITY_LUN_REPOINT
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_LUN_REPOINT => 4

    /**
     * Native name: VSS_PRV_CAPABILITY_LUN_RESYNC
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_LUN_RESYNC => 8

    /**
     * Native name: VSS_PRV_CAPABILITY_OFFLINE_CREATION
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_OFFLINE_CREATION => 16

    /**
     * Native name: VSS_PRV_CAPABILITY_MULTIPLE_IMPORT
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_MULTIPLE_IMPORT => 32

    /**
     * Native name: VSS_PRV_CAPABILITY_RECYCLING
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_RECYCLING => 64

    /**
     * Native name: VSS_PRV_CAPABILITY_PLEX
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_PLEX => 128

    /**
     * Native name: VSS_PRV_CAPABILITY_DIFFERENTIAL
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_DIFFERENTIAL => 256

    /**
     * Native name: VSS_PRV_CAPABILITY_CLUSTERED
     * @type {Integer (Int32)}
     */
    static PRV_CAPABILITY_CLUSTERED => 512
}
