#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_SampleFormat extends Win32Enum {

    /**
     * Native name: DXVA_SampleFormatMask
     * @type {Integer (Int32)}
     */
    static Mask => 255

    /**
     * Native name: DXVA_SampleUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DXVA_SamplePreviousFrame
     * @type {Integer (Int32)}
     */
    static PreviousFrame => 1

    /**
     * Native name: DXVA_SampleProgressiveFrame
     * @type {Integer (Int32)}
     */
    static ProgressiveFrame => 2

    /**
     * Native name: DXVA_SampleFieldInterleavedEvenFirst
     * @type {Integer (Int32)}
     */
    static FieldInterleavedEvenFirst => 3

    /**
     * Native name: DXVA_SampleFieldInterleavedOddFirst
     * @type {Integer (Int32)}
     */
    static FieldInterleavedOddFirst => 4

    /**
     * Native name: DXVA_SampleFieldSingleEven
     * @type {Integer (Int32)}
     */
    static FieldSingleEven => 5

    /**
     * Native name: DXVA_SampleFieldSingleOdd
     * @type {Integer (Int32)}
     */
    static FieldSingleOdd => 6

    /**
     * Native name: DXVA_SampleSubStream
     * @type {Integer (Int32)}
     */
    static SubStream => 7
}
