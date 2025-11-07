#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how a video stream is interlaced.
 * @remarks
 * 
 * Scan lines in the lower field are 0.5 scan line lower than those in the upper field. In NTSC television, a frame consists of a lower field followed by an upper field. In PAL television, a frame consists of an upper field followed by a lower field.
 * 
 * The upper field is also called the even field, the top field, or field 2. The lower field is also called the odd field, the bottom field, or field 1.
 * 
 * If the interlace mode is MFVideoInterlace_FieldSingleUpper or MFVideoInterlace_FieldSingleLower, each sample contains a single field, so each buffer contains only half the number of field lines given in the media type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mfvideointerlacemode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoInterlaceMode{

    /**
     * The type of interlacing is not known.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_Unknown => 0

    /**
     * Progressive frames.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_Progressive => 2

    /**
     * Interlaced frames. Each frame contains two fields. The field lines are interleaved, with the upper field appearing on the first line.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_FieldInterleavedUpperFirst => 3

    /**
     * Interlaced frames. Each frame contains two fields. The field lines are interleaved, with the lower field appearing on the first line.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_FieldInterleavedLowerFirst => 4

    /**
     * Interlaced frames. Each frame contains one field, with the upper field appearing first.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_FieldSingleUpper => 5

    /**
     * Interlaced frames. Each frame contains one field, with the lower field appearing first.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_FieldSingleLower => 6

    /**
     * The stream contains a mix of interlaced and progressive modes.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_MixedInterlaceOrProgressive => 7

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_Last => 8

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static MFVideoInterlace_ForceDWORD => 2147483647
}
