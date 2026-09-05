#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how a video stream is interlaced.
 * @remarks
 * Scan lines in the lower field are 0.5 scan line lower than those in the upper field. In NTSC television, a frame consists of a lower field followed by an upper field. In PAL television, a frame consists of an upper field followed by a lower field.
 * 
 * The upper field is also called the even field, the top field, or field 2. The lower field is also called the odd field, the bottom field, or field 1.
 * 
 * If the interlace mode is MFVideoInterlace_FieldSingleUpper or MFVideoInterlace_FieldSingleLower, each sample contains a single field, so each buffer contains only half the number of field lines given in the media type.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfvideointerlacemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoInterlaceMode extends Win32Enum {

    /**
     * The type of interlacing is not known.
     * Native name: MFVideoInterlace_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Progressive frames.
     * Native name: MFVideoInterlace_Progressive
     * @type {Integer (Int32)}
     */
    static Progressive => 2

    /**
     * Interlaced frames. Each frame contains two fields. The field lines are interleaved, with the upper field appearing on the first line.
     * Native name: MFVideoInterlace_FieldInterleavedUpperFirst
     * @type {Integer (Int32)}
     */
    static FieldInterleavedUpperFirst => 3

    /**
     * Interlaced frames. Each frame contains two fields. The field lines are interleaved, with the lower field appearing on the first line.
     * Native name: MFVideoInterlace_FieldInterleavedLowerFirst
     * @type {Integer (Int32)}
     */
    static FieldInterleavedLowerFirst => 4

    /**
     * Interlaced frames. Each frame contains one field, with the upper field appearing first.
     * Native name: MFVideoInterlace_FieldSingleUpper
     * @type {Integer (Int32)}
     */
    static FieldSingleUpper => 5

    /**
     * Interlaced frames. Each frame contains one field, with the lower field appearing first.
     * Native name: MFVideoInterlace_FieldSingleLower
     * @type {Integer (Int32)}
     */
    static FieldSingleLower => 6

    /**
     * The stream contains a mix of interlaced and progressive modes.
     * Native name: MFVideoInterlace_MixedInterlaceOrProgressive
     * @type {Integer (Int32)}
     */
    static MixedInterlaceOrProgressive => 7

    /**
     * Reserved.
     * Native name: MFVideoInterlace_Last
     * @type {Integer (Int32)}
     */
    static Last => 8

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * Native name: MFVideoInterlace_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
