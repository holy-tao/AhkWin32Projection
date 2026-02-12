#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoEncodeCommandList.ahk

/**
 * This interface inherits from ID3D12VideoEncodeCommandList and adds support for video extension commands.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videoencodecommandlist1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncodeCommandList1 extends ID3D12VideoEncodeCommandList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList1
     * @type {Guid}
     */
    static IID => Guid("{94971eca-2bdb-4769-88cf-3675ea757ebc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeExtensionCommand", "ExecuteExtensionCommand"]

    /**
     * Records a command to initializes or re-initializes a video extension command into a video encode command list.
     * @remarks
     * Errors initializing the extension command are reported via debug layers and the return value of the command list's [Close](nf-d3d12video-id3d12videodecodecommandlist-close.md) method.
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to initialize.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Pointer} pInitializationParameters A pointer to the creation parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_INITIALIZATION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} InitializationParametersSizeInBytes The size of the *pInitializationParameters* parameter structure, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencodecommandlist1-initializeextensioncommand
     */
    InitializeExtensionCommand(pExtensionCommand, pInitializationParameters, InitializationParametersSizeInBytes) {
        ComCall(25, this, "ptr", pExtensionCommand, "ptr", pInitializationParameters, "ptr", InitializationParametersSizeInBytes)
    }

    /**
     * Records a command to execute a video extension command into an encode command list.
     * @remarks
     * Errors initializing the extension command are reported via debug layers and the return value of the command list's [Close](nf-d3d12video-id3d12videodecodecommandlist-close.md) method.
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to execute.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Pointer} pExecutionParameters A pointer to the execution parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_EXECUTION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} ExecutionParametersSizeInBytes The size of the *pExecutionParameters* parameter structure, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencodecommandlist1-executeextensioncommand
     */
    ExecuteExtensionCommand(pExtensionCommand, pExecutionParameters, ExecutionParametersSizeInBytes) {
        ComCall(26, this, "ptr", pExtensionCommand, "ptr", pExecutionParameters, "ptr", ExecutionParametersSizeInBytes)
    }
}
