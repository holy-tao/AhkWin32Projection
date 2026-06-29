#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the GOP structure for HEVC video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_sequence_gop_structure_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC {
    #StructPack 4

    /**
     * The distance between I-frames in the sequence, or the number of pictures on a GOP. If set to 0, only the first frame will be an I frame (infinite GOP).
     */
    GOPLength : UInt32

    /**
     * The period for P-frames to be inserted within the GOP. Note that if GOPLength is set to 0 for infinite GOP, this value must be greater than zero.
     * 
     * Example usage; Let A=GOPLength; B=PPictureInterval
     * 
     * - A=0; B=1 => IPPPPPPPP...
     * - A=0; B=2 => IBPBPBPBP...
     * - A=0; B=3 => IBBPBBPBB...
     * - A=1; B=0 => IIIIIIIII...
     * - A=2; B=1 => IPIPIPIPI...
     * - A=3; B=1 => IPPIPPIPP...
     * - A=3; B=2 => IBPIBPIBP...
     * - A=4; B=3 => IBBPIBBPIBBP...
     */
    PPicturePeriod : UInt32

    /**
     * The value of the variable MaxPicOrderCntLsb that is used in the decoding process for picture order count as specified in clause 8.2.1 as follows:
     * 
     * MaxPicOrderCntLsb = 2^ (log2_max_pic_order_cnt_lsb_minus4 + 4)
     * 
     * The value of log2_max_pic_order_cnt_lsb_minus4 shall be in the range of 0 to 12, inclusive.
     */
    log2_max_pic_order_cnt_lsb_minus4 : Int8

}
