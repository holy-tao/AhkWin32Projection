#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_METADATAINFO {
    #StructPack 4

    BufferAlignment : Int32

    MaxMetadataBufferSize : UInt32

}
