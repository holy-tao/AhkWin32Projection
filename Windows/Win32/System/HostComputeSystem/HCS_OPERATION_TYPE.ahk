#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HCS_OPERATION_TYPE
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_OPERATION_TYPE
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_OPERATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeNone => -1

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeEnumerate => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeCreate => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeStart => 2

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeShutdown => 3

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypePause => 4

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeResume => 5

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeSave => 6

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeTerminate => 7

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeModify => 8

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeGetProperties => 9

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeCreateProcess => 10

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeSignalProcess => 11

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeGetProcessInfo => 12

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeGetProcessProperties => 13

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeModifyProcess => 14

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeCrash => 15

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeLiveMigration => 19

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeReserved1 => 16

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeReserved2 => 17

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationTypeReserved3 => 18
}
