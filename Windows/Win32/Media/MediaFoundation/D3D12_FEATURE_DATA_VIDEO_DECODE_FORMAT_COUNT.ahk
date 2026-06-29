#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk" { D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE }
#Import ".\D3D12_VIDEO_DECODE_CONFIGURATION.ahk" { D3D12_VIDEO_DECODE_CONFIGURATION }
#Import ".\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk" { D3D12_BITSTREAM_ENCRYPTION_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_DECODE_FORMAT_COUNT {
    #StructPack 4

    NodeIndex : UInt32

    Configuration : D3D12_VIDEO_DECODE_CONFIGURATION

    FormatCount : UInt32

}
