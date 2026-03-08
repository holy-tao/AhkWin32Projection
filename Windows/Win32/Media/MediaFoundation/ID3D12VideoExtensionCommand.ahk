#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * A reference counted object representing the video extension command.
 * @remarks
 * Create an instance of this interface by calling [ID3D12VideoDevice2::CreateVideoExtensionCommand](nf-d3d12video-id3d12videodevice2-createvideoextensioncommand.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoextensioncommand
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoExtensionCommand extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoExtensionCommand
     * @type {Guid}
     */
    static IID => Guid("{554e41e8-ae8e-4a8c-b7d2-5b4f274a30e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetProtectedResourceSession"]

    /**
     * Gets the D3D12_VIDEO_EXTENSION_COMMAND_DESC provided when the interface was created.
     * @returns {D3D12_VIDEO_EXTENSION_COMMAND_DESC} The [D3D12_VIDEO_EXTENSION_COMMAND_DESC](ns-d3d12video-d3d12_video_extension_command_desc.md) provided when the interface was created.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoextensioncommand-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * Gets the ID3D12ProtectedResourceSession that was passed into ID3D12VideoDevice2::CreateVideoExtensionCommand when the ID3D12VideoExtensionCommand was created.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12ProtectedResourceSession** interface.
     * @returns {Pointer<Void>} Receives a void pointer representing the **ID3D12ProtectedResourceSession** interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoextensioncommand-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppProtectedSession := 0, "HRESULT")
        return ppProtectedSession
    }
}
