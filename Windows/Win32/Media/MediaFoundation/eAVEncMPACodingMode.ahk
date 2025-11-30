#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the MPEG audio encoding mode. This enumeration is used with the AVEncMPACodingMode property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencmpacodingmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPACodingMode extends Win32Enum{

    /**
     * Single channel.
     *           This mode corresponds to single_channel mode (bit code '11'), defined in ISO/IEC 11172-3.
     * @type {Integer (Int32)}
     */
    static eAVEncMPACodingMode_Mono => 0

    /**
     * Stereo channels.
     *           This mode corresponds to stereo mode ('00'), defined in ISO/IEC 11172-3.
     * @type {Integer (Int32)}
     */
    static eAVEncMPACodingMode_Stereo => 1

    /**
     * Two mono channels.
     *           This mode corresponds to dual_channel mode ('10'), defined in ISO/IEC 11172-3.
     * @type {Integer (Int32)}
     */
    static eAVEncMPACodingMode_DualChannel => 2

    /**
     * Joint stereo mode. This mode uses similarities between the two channels to achieve greater compression. This mode corresponds to joint_stereo mode ('01'), defined in ISO/IEC 11172-3.
     * @type {Integer (Int32)}
     */
    static eAVEncMPACodingMode_JointStereo => 3

    /**
     * Surround audio (5.1 channels).
     *           This mode applies to MPEG-2 audio (ISO/IEC 13818-3).
     * @type {Integer (Int32)}
     */
    static eAVEncMPACodingMode_Surround => 4
}
