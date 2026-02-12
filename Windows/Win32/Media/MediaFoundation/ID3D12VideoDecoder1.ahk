#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDecoder.ahk

/**
 * Represents a Direct3D 12 video decoder that contains resolution-independent resources and state for performing the decode operation. Adds support for protected resources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videodecoder1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDecoder1 extends ID3D12VideoDecoder{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDecoder1
     * @type {Guid}
     */
    static IID => Guid("{79a2e5fb-ccd2-469a-9fde-195d10951f7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProtectedResourceSession"]

    /**
     * Gets the ID3D12ProtectedResourceSession that was passed into ID3D12VideoDevice2::CreateVideoDecoder1 when the ID3D12VideoDecoder1 was created.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12ProtectedResourceSession** interface.
     * @returns {Pointer<Pointer<Void>>} Receives a void pointer representing the **ID3D12ProtectedResourceSession** interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodecoder1-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppProtectedSession := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppProtectedSession
    }
}
