#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminFileFlags extends Win32Enum {

    /**
     * Native name: COMAdminFileFlagLoadable
     * @type {Integer (Int32)}
     */
    static FlagLoadable => 1

    /**
     * Native name: COMAdminFileFlagCOM
     * @type {Integer (Int32)}
     */
    static FlagCOM => 2

    /**
     * Native name: COMAdminFileFlagContainsPS
     * @type {Integer (Int32)}
     */
    static FlagContainsPS => 4

    /**
     * Native name: COMAdminFileFlagContainsComp
     * @type {Integer (Int32)}
     */
    static FlagContainsComp => 8

    /**
     * Native name: COMAdminFileFlagContainsTLB
     * @type {Integer (Int32)}
     */
    static FlagContainsTLB => 16

    /**
     * Native name: COMAdminFileFlagSelfReg
     * @type {Integer (Int32)}
     */
    static FlagSelfReg => 32

    /**
     * Native name: COMAdminFileFlagSelfUnReg
     * @type {Integer (Int32)}
     */
    static FlagSelfUnReg => 64

    /**
     * Native name: COMAdminFileFlagUnloadableDLL
     * @type {Integer (Int32)}
     */
    static FlagUnloadableDLL => 128

    /**
     * Native name: COMAdminFileFlagDoesNotExist
     * @type {Integer (Int32)}
     */
    static FlagDoesNotExist => 256

    /**
     * Native name: COMAdminFileFlagAlreadyInstalled
     * @type {Integer (Int32)}
     */
    static FlagAlreadyInstalled => 512

    /**
     * Native name: COMAdminFileFlagBadTLB
     * @type {Integer (Int32)}
     */
    static FlagBadTLB => 1024

    /**
     * Native name: COMAdminFileFlagGetClassObjFailed
     * @type {Integer (Int32)}
     */
    static FlagGetClassObjFailed => 2048

    /**
     * Native name: COMAdminFileFlagClassNotAvailable
     * @type {Integer (Int32)}
     */
    static FlagClassNotAvailable => 4096

    /**
     * Native name: COMAdminFileFlagRegistrar
     * @type {Integer (Int32)}
     */
    static FlagRegistrar => 8192

    /**
     * Native name: COMAdminFileFlagNoRegistrar
     * @type {Integer (Int32)}
     */
    static FlagNoRegistrar => 16384

    /**
     * Native name: COMAdminFileFlagDLLRegsvrFailed
     * @type {Integer (Int32)}
     */
    static FlagDLLRegsvrFailed => 32768

    /**
     * Native name: COMAdminFileFlagRegTLBFailed
     * @type {Integer (Int32)}
     */
    static FlagRegTLBFailed => 65536

    /**
     * Native name: COMAdminFileFlagRegistrarFailed
     * @type {Integer (Int32)}
     */
    static FlagRegistrarFailed => 131072

    /**
     * Native name: COMAdminFileFlagError
     * @type {Integer (Int32)}
     */
    static FlagError => 262144
}
