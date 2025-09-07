#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_EXCEPTION_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeDivideErrorFault => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeDebugTrapOrFault => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeBreakpointTrap => 3

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeOverflowTrap => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeBoundRangeFault => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeInvalidOpcodeFault => 6

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeDeviceNotAvailableFault => 7

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeDoubleFaultAbort => 8

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeInvalidTaskStateSegmentFault => 10

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeSegmentNotPresentFault => 11

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeStackFault => 12

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeGeneralProtectionFault => 13

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypePageFault => 14

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeFloatingPointErrorFault => 16

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeAlignmentCheckFault => 17

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeMachineCheckAbort => 18

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ExceptionTypeSimdFloatingPointFault => 19
}
