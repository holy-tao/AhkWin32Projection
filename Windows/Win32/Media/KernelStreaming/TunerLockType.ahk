#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class TunerLockType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static Tuner_LockType_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Tuner_LockType_Within_Scan_Sensing_Range => 1

    /**
     * @type {Integer (Int32)}
     */
    static Tuner_LockType_Locked => 2
}
