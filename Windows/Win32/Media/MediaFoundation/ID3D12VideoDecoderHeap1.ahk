#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDecoderHeap.ahk

/**
 * The ID3D12VideoDecoderHeap1 interface (d3d12video.h) inherits from ID3D12VideoDecoderHeap and introduces support for protected resources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videodecoderheap1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDecoderHeap1 extends ID3D12VideoDecoderHeap{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDecoderHeap1
     * @type {Guid}
     */
    static IID => Guid("{da1d98c5-539f-41b2-bf6b-1198a03b6d26}")

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
     * Gets the ID3D12ProtectedResourceSession that was passed into ID3D12VideoDevice2::CreateVideoDecoderHeap1 when the ID3D12VideoDecoderHeap1 was created.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12ProtectedResourceSession** interface.
     * @returns {Pointer<Pointer<Void>>} Receives a void pointer representing the **ID3D12ProtectedResourceSession** interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodecoderheap1-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppProtectedSession := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppProtectedSession
    }
}
