#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TIMECODE.ahk" { TIMECODE }
#Import ".\TIMECODE_SAMPLE_FLAGS.ahk" { TIMECODE_SAMPLE_FLAGS }

/**
 * The TIMECODE_SAMPLE structure contains complete timecode information.
 * @remarks
 * The upper 16 bits in <b>dwFlags</b> are reserved; set to zero.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-timecode_sample
 * @namespace Windows.Win32.Media
 */
export default struct TIMECODE_SAMPLE {
    #StructPack 8

    /**
     * Reference time, in 100-nanosecond units.
     */
    qwTick : Int64

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/getting-timecode-from-the-device">TIMECODE</a> structure.
     */
    timecode : TIMECODE

    /**
     * Packed SMPTE userbits.
     */
    dwUser : UInt32

    dwFlags : TIMECODE_SAMPLE_FLAGS

}
