#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class TunerLockType extends Win32Enum {

    /**
     * Native name: Tuner_LockType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: Tuner_LockType_Within_Scan_Sensing_Range
     * @type {Integer (Int32)}
     */
    static Within_Scan_Sensing_Range => 1

    /**
     * Native name: Tuner_LockType_Locked
     * @type {Integer (Int32)}
     */
    static Locked => 2
}
