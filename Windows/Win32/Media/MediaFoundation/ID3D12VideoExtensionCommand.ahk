#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * A reference counted object representing the video extension command.
 * @remarks
 * 
  * Create an instance of this interface by calling [ID3D12VideoDevice2::CreateVideoExtensionCommand](nf-d3d12video-id3d12videodevice2-createvideoextensioncommand.md).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videoextensioncommand
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoExtensionCommand extends ID3D12Pageable{
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
     * 
     * @returns {D3D12_VIDEO_EXTENSION_COMMAND_DESC} 
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppProtectedSession 
     * @returns {HRESULT} 
     */
    GetProtectedResourceSession(riid, ppProtectedSession) {
        result := ComCall(9, this, "ptr", riid, "ptr", ppProtectedSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
