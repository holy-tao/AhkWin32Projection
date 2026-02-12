#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoProcessCommandList1.ahk

/**
 * Adds support for video extension commands. (ID3D12VideoProcessCommandList2)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videoprocesscommandlist2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoProcessCommandList2 extends ID3D12VideoProcessCommandList1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoProcessCommandList2
     * @type {Guid}
     */
    static IID => Guid("{db525ae4-6ad6-473c-baa7-59b2e37082e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProtectedResourceSession", "InitializeExtensionCommand", "ExecuteExtensionCommand"]

    /**
     * Specifies whether or not protected resources can be accessed by subsequent commands in the video process command list.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession An optional pointer to an [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md). You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](../d3d12/nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist2-setprotectedresourcesession
     */
    SetProtectedResourceSession(pProtectedResourceSession) {
        ComCall(24, this, "ptr", pProtectedResourceSession)
    }

    /**
     * Records a command to initializes or re-initializes a video extension command into a video processor command list.
     * @remarks
     * Errors initializing the extension command are reported via debug layers and the return value of the command list's [Close](nf-d3d12video-id3d12videoprocesscommandlist-close.md) method.
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to initialize.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Pointer} pInitializationParameters A pointer to the creation parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_INITIALIZATION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} InitializationParametersSizeInBytes The size of the *pInitializationParameters* parameter structure, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist2-initializeextensioncommand
     */
    InitializeExtensionCommand(pExtensionCommand, pInitializationParameters, InitializationParametersSizeInBytes) {
        ComCall(25, this, "ptr", pExtensionCommand, "ptr", pInitializationParameters, "ptr", InitializationParametersSizeInBytes)
    }

    /**
     * Records a command to execute a video extension command into a video process command list.
     * @remarks
     * Errors initializing the extension command are reported via debug layers and the return value of the command list's [Close](nf-d3d12video-id3d12videoprocesscommandlist-close.md) method.
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to execute.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Pointer} pExecutionParameters A pointer to the execution parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_EXECUTION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} ExecutionParametersSizeInBytes The size of the *pExecutionParameters* parameter structure, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist2-executeextensioncommand
     */
    ExecuteExtensionCommand(pExtensionCommand, pExecutionParameters, ExecutionParametersSizeInBytes) {
        ComCall(26, this, "ptr", pExtensionCommand, "ptr", pExecutionParameters, "ptr", ExecutionParametersSizeInBytes)
    }
}
