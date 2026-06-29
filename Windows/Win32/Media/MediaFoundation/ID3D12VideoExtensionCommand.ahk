#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_VIDEO_EXTENSION_COMMAND_DESC.ahk" { D3D12_VIDEO_EXTENSION_COMMAND_DESC }
#Import "..\..\Graphics\Direct3D12\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * A reference counted object representing the video extension command.
 * @remarks
 * Create an instance of this interface by calling [ID3D12VideoDevice2::CreateVideoExtensionCommand](nf-d3d12video-id3d12videodevice2-createvideoextensioncommand.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoextensioncommand
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoExtensionCommand extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12VideoExtensionCommand
     * @type {Guid}
     */
    static IID := Guid("{554e41e8-ae8e-4a8c-b7d2-5b4f274a30e4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoExtensionCommand interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetDesc                     : IntPtr
        GetProtectedResourceSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoExtensionCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the D3D12_VIDEO_EXTENSION_COMMAND_DESC provided when the interface was created.
     * @returns {D3D12_VIDEO_EXTENSION_COMMAND_DESC} The [D3D12_VIDEO_EXTENSION_COMMAND_DESC](ns-d3d12video-d3d12_video_extension_command_desc.md) provided when the interface was created.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoextensioncommand-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, D3D12_VIDEO_EXTENSION_COMMAND_DESC)
        return result
    }

    /**
     * Gets the ID3D12ProtectedResourceSession that was passed into ID3D12VideoDevice2::CreateVideoExtensionCommand when the ID3D12VideoExtensionCommand was created.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12ProtectedResourceSession** interface.
     * @returns {Pointer<Void>} Receives a void pointer representing the **ID3D12ProtectedResourceSession** interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoextensioncommand-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid) {
        result := ComCall(9, this, Guid.Ptr, riid, "ptr*", &ppProtectedSession := 0, "HRESULT")
        return ppProtectedSession
    }

    Query(iid) {
        if (ID3D12VideoExtensionCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 1)
        this.vtbl.GetProtectedResourceSession := CallbackCreate(GetMethod(implObj, "GetProtectedResourceSession"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.GetProtectedResourceSession)
    }
}
