#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSCAMERA_METADATA_ITEMHEADER.ahk" { KSCAMERA_METADATA_ITEMHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_METADATA_FRAMEILLUMINATION {
    #StructPack 4

    Header : KSCAMERA_METADATA_ITEMHEADER

    Flags : UInt32

    Reserved : UInt32

}
