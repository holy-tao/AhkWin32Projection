#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_MONITOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_FUNCTION_UNLOADS => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_CLASS_LOADS => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_MODULE_LOADS => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_ASSEMBLY_LOADS => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_APPDOMAIN_LOADS => 16

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_JIT_COMPILATION => 32

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_EXCEPTIONS => 64

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_GC => 128

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_OBJECT_ALLOCATED => 256

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_THREADS => 512

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_REMOTING => 1024

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_CODE_TRANSITIONS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_ENTERLEAVE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_CCW => 8192

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_REMOTING_COOKIE => 17408

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_REMOTING_ASYNC => 33792

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_SUSPENDS => 65536

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_CACHE_SEARCHES => 131072

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ENABLE_REJIT => 262144

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ENABLE_INPROC_DEBUGGING => 524288

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ENABLE_JIT_MAPS => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_DISABLE_INLINING => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_DISABLE_OPTIMIZATIONS => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ENABLE_OBJECT_ALLOCATED => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_CLR_EXCEPTIONS => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_ALL => 17301503

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ENABLE_FUNCTION_ARGS => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ENABLE_FUNCTION_RETVAL => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ENABLE_FRAME_INFO => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ENABLE_STACK_SNAPSHOT => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_USE_PROFILE_IMAGES => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_DISABLE_TRANSPARENCY_CHECKS_UNDER_FULL_TRUST => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_DISABLE_ALL_NGEN_IMAGES => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ALL => -1879048193

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_REQUIRE_PROFILE_IMAGE => 536877056

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ALLOWABLE_AFTER_ATTACH => 268763902

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_ALLOWABLE_NOTIFICATION_PROFILER => -1310512257

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MONITOR_IMMUTABLE => -285684736
}
