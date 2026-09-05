#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSMETHOD_WAVETABLE extends Win32Enum {

    /**
     * Native name: KSMETHOD_WAVETABLE_WAVE_ALLOC
     * @type {Integer (Int32)}
     */
    static WAVE_ALLOC => 0

    /**
     * Native name: KSMETHOD_WAVETABLE_WAVE_FREE
     * @type {Integer (Int32)}
     */
    static WAVE_FREE => 1

    /**
     * Native name: KSMETHOD_WAVETABLE_WAVE_FIND
     * @type {Integer (Int32)}
     */
    static WAVE_FIND => 2

    /**
     * Native name: KSMETHOD_WAVETABLE_WAVE_WRITE
     * @type {Integer (Int32)}
     */
    static WAVE_WRITE => 3
}
