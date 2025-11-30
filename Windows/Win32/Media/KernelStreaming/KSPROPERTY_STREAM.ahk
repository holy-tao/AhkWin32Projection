#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_STREAM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_ALLOCATOR => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_QUALITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_DEGRADATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_MASTERCLOCK => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_TIMEFORMAT => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_PRESENTATIONTIME => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_PRESENTATIONEXTENT => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_FRAMETIME => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_RATECAPABILITY => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_RATE => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_STREAM_PIPE_ID => 10
}
