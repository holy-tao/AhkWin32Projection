#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12VideoEncodeCommandList.ahk" { ID3D12VideoEncodeCommandList }
#Import ".\ID3D12VideoExtensionCommand.ahk" { ID3D12VideoExtensionCommand }

/**
 * This interface inherits from ID3D12VideoEncodeCommandList and adds support for video extension commands.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoencodecommandlist1
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoEncodeCommandList1 extends ID3D12VideoEncodeCommandList {
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList1
     * @type {Guid}
     */
    static IID := Guid("{94971eca-2bdb-4769-88cf-3675ea757ebc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoEncodeCommandList1 interfaces
    */
    struct Vtbl extends ID3D12VideoEncodeCommandList.Vtbl {
        InitializeExtensionCommand : IntPtr
        ExecuteExtensionCommand    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoEncodeCommandList1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Records a command to initializes or re-initializes a video extension command into a video encode command list.
     * @remarks
     * Errors initializing the extension command are reported via debug layers and the return value of the command list's [Close](nf-d3d12video-id3d12videodecodecommandlist-close.md) method.
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to initialize.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Integer} pInitializationParameters A pointer to the creation parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_INITIALIZATION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} InitializationParametersSizeInBytes The size of the *pInitializationParameters* parameter structure, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencodecommandlist1-initializeextensioncommand
     */
    InitializeExtensionCommand(pExtensionCommand, pInitializationParameters, InitializationParametersSizeInBytes) {
        ComCall(25, this, "ptr", pExtensionCommand, "ptr", pInitializationParameters, "ptr", InitializationParametersSizeInBytes)
    }

    /**
     * Records a command to execute a video extension command into an encode command list.
     * @remarks
     * Errors initializing the extension command are reported via debug layers and the return value of the command list's [Close](nf-d3d12video-id3d12videodecodecommandlist-close.md) method.
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to execute.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Integer} pExecutionParameters A pointer to the execution parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_EXECUTION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} ExecutionParametersSizeInBytes The size of the *pExecutionParameters* parameter structure, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencodecommandlist1-executeextensioncommand
     */
    ExecuteExtensionCommand(pExtensionCommand, pExecutionParameters, ExecutionParametersSizeInBytes) {
        ComCall(26, this, "ptr", pExtensionCommand, "ptr", pExecutionParameters, "ptr", ExecutionParametersSizeInBytes)
    }

    Query(iid) {
        if (ID3D12VideoEncodeCommandList1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeExtensionCommand := CallbackCreate(GetMethod(implObj, "InitializeExtensionCommand"), flags, 4)
        this.vtbl.ExecuteExtensionCommand := CallbackCreate(GetMethod(implObj, "ExecuteExtensionCommand"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeExtensionCommand)
        CallbackFree(this.vtbl.ExecuteExtensionCommand)
    }
}
