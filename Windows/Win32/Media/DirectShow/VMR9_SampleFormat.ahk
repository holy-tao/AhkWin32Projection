#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9_SampleFormat enumeration type describes the interlacing of a video stream.
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ne-vmr9-vmr9_sampleformat
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9_SampleFormat extends Win32Enum{

    /**
     * Reserved; do not use.
     * @type {Integer (Int32)}
     */
    static VMR9_SampleReserved => 1

    /**
     * Progressive frame; no interleaving
     * @type {Integer (Int32)}
     */
    static VMR9_SampleProgressiveFrame => 2

    /**
     * Each sample contains two interleaved fields, with the even field first.
     * @type {Integer (Int32)}
     */
    static VMR9_SampleFieldInterleavedEvenFirst => 3

    /**
     * Each sample contains two interleaved fields, with the odd field first.
     * @type {Integer (Int32)}
     */
    static VMR9_SampleFieldInterleavedOddFirst => 4

    /**
     * The sample contains a single field, and each line in the sample corresponds to the even lines in a deinterlaced frame. That is, lines 0, 1, 2,... in the sample correspond to lines 0, 2, 4,... in the deinterlaced frame. The missing lines must be constructed when the frame is deinterlaced.
     * @type {Integer (Int32)}
     */
    static VMR9_SampleFieldSingleEven => 5

    /**
     * The sample contains a single field, and each line in the sample corresponds to the odd lines in a de-interlaced frame.
     * @type {Integer (Int32)}
     */
    static VMR9_SampleFieldSingleOdd => 6
}
