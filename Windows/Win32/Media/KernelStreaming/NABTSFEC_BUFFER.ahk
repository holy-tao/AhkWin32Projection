#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct NABTSFEC_BUFFER {
    #StructPack 4

    dataSize : UInt32

    groupID : UInt16

    Reserved : UInt16

    data : Int8[448]

}
