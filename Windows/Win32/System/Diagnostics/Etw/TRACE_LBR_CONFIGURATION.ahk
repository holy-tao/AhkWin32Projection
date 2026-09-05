#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class TRACE_LBR_CONFIGURATION extends Win32BitflagEnum {

    /**
     * Native name: TRACE_LBR_CONFIGURATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_KERNEL
     * @type {Integer (Int32)}
     */
    static EXCLUDE_KERNEL => 1

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_USER
     * @type {Integer (Int32)}
     */
    static EXCLUDE_USER => 2

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_JCC
     * @type {Integer (Int32)}
     */
    static EXCLUDE_JCC => 4

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_REL_CALL
     * @type {Integer (Int32)}
     */
    static EXCLUDE_NEAR_REL_CALL => 8

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_IND_CALL
     * @type {Integer (Int32)}
     */
    static EXCLUDE_NEAR_IND_CALL => 16

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_RET
     * @type {Integer (Int32)}
     */
    static EXCLUDE_NEAR_RET => 32

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_IND_JMP
     * @type {Integer (Int32)}
     */
    static EXCLUDE_NEAR_IND_JMP => 64

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_REL_JMP
     * @type {Integer (Int32)}
     */
    static EXCLUDE_NEAR_REL_JMP => 128

    /**
     * Native name: TRACE_LBR_CONFIGURATION_EXCLUDE_FAR_BRANCH
     * @type {Integer (Int32)}
     */
    static EXCLUDE_FAR_BRANCH => 256

    /**
     * Native name: TRACE_LBR_CONFIGURATION_CALLSTACK_ENABLE
     * @type {Integer (Int32)}
     */
    static CALLSTACK_ENABLE => 512

    /**
     * Native name: TRACE_LBR_CONFIGURATION_SAMPLED
     * @type {Integer (Int32)}
     */
    static SAMPLED => 1024
}
