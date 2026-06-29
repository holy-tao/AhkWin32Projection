#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSSTREAM_UVC_METADATATYPE_TIMESTAMP.ahk" { KSSTREAM_UVC_METADATATYPE_TIMESTAMP }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSSTREAM_UVC_METADATA {
    #StructPack 4

    StartOfFrameTimestamp : KSSTREAM_UVC_METADATATYPE_TIMESTAMP

    EndOfFrameTimestamp : KSSTREAM_UVC_METADATATYPE_TIMESTAMP

}
