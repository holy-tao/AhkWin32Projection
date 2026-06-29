#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_DISEQC_RESPONSE {
    #StructPack 4

    ulRequestId : UInt32

    ulPacketLength : UInt32

    argbPacketData : Int8[8]

}
