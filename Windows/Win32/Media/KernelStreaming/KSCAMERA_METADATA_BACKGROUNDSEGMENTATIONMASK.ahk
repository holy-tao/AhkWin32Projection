#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\KSCAMERA_METADATA_ITEMHEADER.ahk" { KSCAMERA_METADATA_ITEMHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_METADATA_BACKGROUNDSEGMENTATIONMASK {
    #StructPack 4

    Header : KSCAMERA_METADATA_ITEMHEADER

    MaskCoverageBoundingBox : RECT

    MaskResolution : SIZE

    ForegroundBoundingBox : RECT

    MaskData : Int8[1]

}
