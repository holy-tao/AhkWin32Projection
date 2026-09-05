#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_STREAM extends Win32Enum {

    /**
     * Native name: KSPROPERTY_STREAM_ALLOCATOR
     * @type {Integer (Int32)}
     */
    static ALLOCATOR => 0

    /**
     * Native name: KSPROPERTY_STREAM_QUALITY
     * @type {Integer (Int32)}
     */
    static QUALITY => 1

    /**
     * Native name: KSPROPERTY_STREAM_DEGRADATION
     * @type {Integer (Int32)}
     */
    static DEGRADATION => 2

    /**
     * Native name: KSPROPERTY_STREAM_MASTERCLOCK
     * @type {Integer (Int32)}
     */
    static MASTERCLOCK => 3

    /**
     * Native name: KSPROPERTY_STREAM_TIMEFORMAT
     * @type {Integer (Int32)}
     */
    static TIMEFORMAT => 4

    /**
     * Native name: KSPROPERTY_STREAM_PRESENTATIONTIME
     * @type {Integer (Int32)}
     */
    static PRESENTATIONTIME => 5

    /**
     * Native name: KSPROPERTY_STREAM_PRESENTATIONEXTENT
     * @type {Integer (Int32)}
     */
    static PRESENTATIONEXTENT => 6

    /**
     * Native name: KSPROPERTY_STREAM_FRAMETIME
     * @type {Integer (Int32)}
     */
    static FRAMETIME => 7

    /**
     * Native name: KSPROPERTY_STREAM_RATECAPABILITY
     * @type {Integer (Int32)}
     */
    static RATECAPABILITY => 8

    /**
     * Native name: KSPROPERTY_STREAM_RATE
     * @type {Integer (Int32)}
     */
    static RATE => 9

    /**
     * Native name: KSPROPERTY_STREAM_PIPE_ID
     * @type {Integer (Int32)}
     */
    static PIPE_ID => 10
}
