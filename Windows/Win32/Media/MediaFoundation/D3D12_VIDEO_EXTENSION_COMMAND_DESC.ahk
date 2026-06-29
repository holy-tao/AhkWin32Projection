#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a video extension command. (D3D12_VIDEO_EXTENSION_COMMAND_DESC)
 * @remarks
 * Pass this structure to [ID3D12VideoDevice2::CreateVideoExtensionCommand](nf-d3d12video-id3d12videodevice2-createvideoextensioncommand.md) to create an instance of [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_extension_command_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_EXTENSION_COMMAND_DESC {
    #StructPack 4

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeMask : UInt32

    /**
     * The unique identifier for the video extension command.
     */
    CommandId : Guid

}
