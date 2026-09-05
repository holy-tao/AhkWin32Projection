#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class SCRIPTFLAGS extends Win32Enum {

    /**
     * Native name: SCRIPTFLAGS_CACHEINFO
     * @type {Integer (Int32)}
     */
    static CACHEINFO => 1

    /**
     * Native name: SCRIPTFLAGS_SHORTCUTS
     * @type {Integer (Int32)}
     */
    static SHORTCUTS => 4

    /**
     * Native name: SCRIPTFLAGS_MACHINEASSIGN
     * @type {Integer (Int32)}
     */
    static MACHINEASSIGN => 8

    /**
     * Native name: SCRIPTFLAGS_REGDATA_CNFGINFO
     * @type {Integer (Int32)}
     */
    static REGDATA_CNFGINFO => 32

    /**
     * Native name: SCRIPTFLAGS_VALIDATE_TRANSFORMS_LIST
     * @type {Integer (Int32)}
     */
    static VALIDATE_TRANSFORMS_LIST => 64

    /**
     * Native name: SCRIPTFLAGS_REGDATA_CLASSINFO
     * @type {Integer (Int32)}
     */
    static REGDATA_CLASSINFO => 128

    /**
     * Native name: SCRIPTFLAGS_REGDATA_EXTENSIONINFO
     * @type {Integer (Int32)}
     */
    static REGDATA_EXTENSIONINFO => 256

    /**
     * Native name: SCRIPTFLAGS_REGDATA_APPINFO
     * @type {Integer (Int32)}
     */
    static REGDATA_APPINFO => 384

    /**
     * Native name: SCRIPTFLAGS_REGDATA
     * @type {Integer (Int32)}
     */
    static REGDATA => 416
}
