#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGE_DLL_CHARACTERISTICS extends Win32BitflagEnum {

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_HIGH_ENTROPY_VA => 32

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_DYNAMIC_BASE => 64

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_FORCE_INTEGRITY => 128

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_NX_COMPAT
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_NX_COMPAT => 256

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_NO_ISOLATION
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_NO_ISOLATION => 512

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_NO_SEH
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_NO_SEH => 1024

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_NO_BIND
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_NO_BIND => 2048

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_APPCONTAINER
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_APPCONTAINER => 4096

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_WDM_DRIVER
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_WDM_DRIVER => 8192

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_GUARD_CF
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_GUARD_CF => 16384

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE => 32768

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_EX_CET_COMPAT => 1

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT_STRICT_MODE
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_EX_CET_COMPAT_STRICT_MODE => 2

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_EX_CET_SET_CONTEXT_IP_VALIDATION_RELAXED_MODE
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_EX_CET_SET_CONTEXT_IP_VALIDATION_RELAXED_MODE => 4

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_EX_CET_DYNAMIC_APIS_ALLOW_IN_PROC
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_EX_CET_DYNAMIC_APIS_ALLOW_IN_PROC => 8

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_EX_CET_RESERVED_1
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_EX_CET_RESERVED_1 => 16

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_EX_CET_RESERVED_2
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_EX_CET_RESERVED_2 => 32

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT => 64

    /**
     * Native name: IMAGE_DLLCHARACTERISTICS_EX_HOTPATCH_COMPATIBLE
     * @type {Integer (UInt16)}
     */
    static DLLCHARACTERISTICS_EX_HOTPATCH_COMPATIBLE => 128
}
