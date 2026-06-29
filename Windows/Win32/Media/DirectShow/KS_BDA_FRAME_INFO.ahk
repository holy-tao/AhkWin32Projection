#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct KS_BDA_FRAME_INFO {
    #StructPack 4

    ExtendedHeaderSize : UInt32

    dwFrameFlags : UInt32

    ulEvent : UInt32

    ulChannelNumber : UInt32

    ulSubchannelNumber : UInt32

    ulReason : UInt32

}
