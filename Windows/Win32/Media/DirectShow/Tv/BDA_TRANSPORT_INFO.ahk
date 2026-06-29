#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BDA_TRANSPORT_INFO {
    #StructPack 8

    ulcbPhyiscalPacket : UInt32

    ulcbPhyiscalFrame : UInt32

    ulcbPhyiscalFrameAlignment : UInt32

    AvgTimePerFrame : Int64

}
