#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoProcessCommandList1.ahk

/**
 * Adds support for video extension commands.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videoprocesscommandlist2
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
     * 
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist2-setprotectedresourcesession
     */
    SetProtectedResourceSession(pProtectedResourceSession) {
        ComCall(24, this, "ptr", pProtectedResourceSession)
    }

    /**
     * 
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand 
     * @param {Pointer} pInitializationParameters 
     * @param {Pointer} InitializationParametersSizeInBytes 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist2-initializeextensioncommand
     */
    InitializeExtensionCommand(pExtensionCommand, pInitializationParameters, InitializationParametersSizeInBytes) {
        ComCall(25, this, "ptr", pExtensionCommand, "ptr", pInitializationParameters, "ptr", InitializationParametersSizeInBytes)
    }

    /**
     * 
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand 
     * @param {Pointer} pExecutionParameters 
     * @param {Pointer} ExecutionParametersSizeInBytes 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist2-executeextensioncommand
     */
    ExecuteExtensionCommand(pExtensionCommand, pExecutionParameters, ExecutionParametersSizeInBytes) {
        ComCall(26, this, "ptr", pExtensionCommand, "ptr", pExecutionParameters, "ptr", ExecutionParametersSizeInBytes)
    }
}
