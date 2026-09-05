#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HCS_OPERATION_TYPE
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_OPERATION_TYPE
 * @namespace Windows.Win32.System.HostComputeSystem
 */
class HCS_OPERATION_TYPE extends Win32Enum {

    /**
     * Native name: HcsOperationTypeNone
     * @type {Integer (Int32)}
     */
    static None => -1

    /**
     * Native name: HcsOperationTypeEnumerate
     * @type {Integer (Int32)}
     */
    static Enumerate => 0

    /**
     * Native name: HcsOperationTypeCreate
     * @type {Integer (Int32)}
     */
    static Create => 1

    /**
     * Native name: HcsOperationTypeStart
     * @type {Integer (Int32)}
     */
    static Start => 2

    /**
     * Native name: HcsOperationTypeShutdown
     * @type {Integer (Int32)}
     */
    static Shutdown => 3

    /**
     * Native name: HcsOperationTypePause
     * @type {Integer (Int32)}
     */
    static Pause => 4

    /**
     * Native name: HcsOperationTypeResume
     * @type {Integer (Int32)}
     */
    static Resume => 5

    /**
     * Native name: HcsOperationTypeSave
     * @type {Integer (Int32)}
     */
    static Save => 6

    /**
     * Native name: HcsOperationTypeTerminate
     * @type {Integer (Int32)}
     */
    static Terminate => 7

    /**
     * Native name: HcsOperationTypeModify
     * @type {Integer (Int32)}
     */
    static Modify => 8

    /**
     * Native name: HcsOperationTypeGetProperties
     * @type {Integer (Int32)}
     */
    static GetProperties => 9

    /**
     * Native name: HcsOperationTypeCreateProcess
     * @type {Integer (Int32)}
     */
    static CreateProcess => 10

    /**
     * Native name: HcsOperationTypeSignalProcess
     * @type {Integer (Int32)}
     */
    static SignalProcess => 11

    /**
     * Native name: HcsOperationTypeGetProcessInfo
     * @type {Integer (Int32)}
     */
    static GetProcessInfo => 12

    /**
     * Native name: HcsOperationTypeGetProcessProperties
     * @type {Integer (Int32)}
     */
    static GetProcessProperties => 13

    /**
     * Native name: HcsOperationTypeModifyProcess
     * @type {Integer (Int32)}
     */
    static ModifyProcess => 14

    /**
     * Native name: HcsOperationTypeCrash
     * @type {Integer (Int32)}
     */
    static Crash => 15

    /**
     * Native name: HcsOperationTypeLiveMigration
     * @type {Integer (Int32)}
     */
    static LiveMigration => 19

    /**
     * Native name: HcsOperationTypeReserved1
     * @type {Integer (Int32)}
     */
    static Reserved1 => 16

    /**
     * Native name: HcsOperationTypeReserved2
     * @type {Integer (Int32)}
     */
    static Reserved2 => 17

    /**
     * Native name: HcsOperationTypeReserved3
     * @type {Integer (Int32)}
     */
    static Reserved3 => 18
}
