#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminFileFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagLoadable => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagCOM => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagContainsPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagContainsComp => 8

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagContainsTLB => 16

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagSelfReg => 32

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagSelfUnReg => 64

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagUnloadableDLL => 128

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagDoesNotExist => 256

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagAlreadyInstalled => 512

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagBadTLB => 1024

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagGetClassObjFailed => 2048

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagClassNotAvailable => 4096

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagRegistrar => 8192

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagNoRegistrar => 16384

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagDLLRegsvrFailed => 32768

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagRegTLBFailed => 65536

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagRegistrarFailed => 131072

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminFileFlagError => 262144
}
