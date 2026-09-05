#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9_SampleFormat enumeration type describes the interlacing of a video stream.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9_sampleformat
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMR9_SampleFormat extends Win32Enum {

    /**
     * Reserved; do not use.
     * Native name: VMR9_SampleReserved
     * @type {Integer (Int32)}
     */
    static Reserved => 1

    /**
     * Progressive frame; no interleaving
     * Native name: VMR9_SampleProgressiveFrame
     * @type {Integer (Int32)}
     */
    static ProgressiveFrame => 2

    /**
     * Each sample contains two interleaved fields, with the even field first.
     * Native name: VMR9_SampleFieldInterleavedEvenFirst
     * @type {Integer (Int32)}
     */
    static FieldInterleavedEvenFirst => 3

    /**
     * Each sample contains two interleaved fields, with the odd field first.
     * Native name: VMR9_SampleFieldInterleavedOddFirst
     * @type {Integer (Int32)}
     */
    static FieldInterleavedOddFirst => 4

    /**
     * The sample contains a single field, and each line in the sample corresponds to the even lines in a deinterlaced frame. That is, lines 0, 1, 2,... in the sample correspond to lines 0, 2, 4,... in the deinterlaced frame. The missing lines must be constructed when the frame is deinterlaced.
     * Native name: VMR9_SampleFieldSingleEven
     * @type {Integer (Int32)}
     */
    static FieldSingleEven => 5

    /**
     * The sample contains a single field, and each line in the sample corresponds to the odd lines in a de-interlaced frame.
     * Native name: VMR9_SampleFieldSingleOdd
     * @type {Integer (Int32)}
     */
    static FieldSingleOdd => 6
}
