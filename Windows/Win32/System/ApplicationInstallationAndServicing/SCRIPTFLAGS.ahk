#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class SCRIPTFLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_CACHEINFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_SHORTCUTS => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_MACHINEASSIGN => 8

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA_CNFGINFO => 32

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_VALIDATE_TRANSFORMS_LIST => 64

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA_CLASSINFO => 128

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA_EXTENSIONINFO => 256

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA_APPINFO => 384

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA => 416
}
