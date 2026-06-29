#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12VideoExtensionCommand.ahk" { ID3D12VideoExtensionCommand }
#Import ".\ID3D12VideoDecodeCommandList1.ahk" { ID3D12VideoDecodeCommandList1 }
#Import "..\..\Graphics\Direct3D12\ID3D12ProtectedResourceSession.ahk" { ID3D12ProtectedResourceSession }

/**
 * Adds support for video extension commands. (ID3D12VideoDecodeCommandList2)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodecodecommandlist2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoDecodeCommandList2 extends ID3D12VideoDecodeCommandList1 {
    /**
     * The interface identifier for ID3D12VideoDecodeCommandList2
     * @type {Guid}
     */
    static IID := Guid("{6e120880-c114-4153-8036-d247051e1729}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoDecodeCommandList2 interfaces
    */
    struct Vtbl extends ID3D12VideoDecodeCommandList1.Vtbl {
        SetProtectedResourceSession : IntPtr
        InitializeExtensionCommand  : IntPtr
        ExecuteExtensionCommand     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoDecodeCommandList2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies whether or not protected resources can be accessed by subsequent commands in the video decode command list.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession An optional pointer to an [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md). You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](../d3d12/nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecodecommandlist2-setprotectedresourcesession
     */
    SetProtectedResourceSession(pProtectedResourceSession) {
        ComCall(24, this, "ptr", pProtectedResourceSession)
    }

    /**
     * Records a command to initializes or re-initializes a video extension command into a video decode command list.
     * @remarks
     * Errors initializing the extension command are reported via debug layers and the return value of the command list's [Close](nf-d3d12video-id3d12videodecodecommandlist-close.md) method.
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to initialize.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Integer} pInitializationParameters A pointer to the creation parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_INITIALIZATION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} InitializationParametersSizeInBytes The size of the *pInitializationParameters* parameter structure, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecodecommandlist2-initializeextensioncommand
     */
    InitializeExtensionCommand(pExtensionCommand, pInitializationParameters, InitializationParametersSizeInBytes) {
        ComCall(25, this, "ptr", pExtensionCommand, "ptr", pInitializationParameters, "ptr", InitializationParametersSizeInBytes)
    }

    /**
     * Records a command to execute a video extension command into a decode command list.
     * @remarks
     * Errors initializing the extension command are reported via debug layers and the return value of the command list's [Close](nf-d3d12video-id3d12videodecodecommandlist-close.md) method.
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to execute.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Integer} pExecutionParameters A pointer to the execution parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_EXECUTION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} ExecutionParametersSizeInBytes The size of the *pExecutionParameters* parameter structure, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecodecommandlist2-executeextensioncommand
     */
    ExecuteExtensionCommand(pExtensionCommand, pExecutionParameters, ExecutionParametersSizeInBytes) {
        ComCall(26, this, "ptr", pExtensionCommand, "ptr", pExecutionParameters, "ptr", ExecutionParametersSizeInBytes)
    }

    Query(iid) {
        if (ID3D12VideoDecodeCommandList2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProtectedResourceSession := CallbackCreate(GetMethod(implObj, "SetProtectedResourceSession"), flags, 2)
        this.vtbl.InitializeExtensionCommand := CallbackCreate(GetMethod(implObj, "InitializeExtensionCommand"), flags, 4)
        this.vtbl.ExecuteExtensionCommand := CallbackCreate(GetMethod(implObj, "ExecuteExtensionCommand"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProtectedResourceSession)
        CallbackFree(this.vtbl.InitializeExtensionCommand)
        CallbackFree(this.vtbl.ExecuteExtensionCommand)
    }
}
