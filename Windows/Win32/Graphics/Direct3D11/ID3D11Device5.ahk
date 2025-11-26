#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Device4.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device5 adds new methods to those in ID3D11Device4.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nn-d3d11_4-id3d11device5
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device5 extends ID3D11Device4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device5
     * @type {Guid}
     */
    static IID => Guid("{8ffde202-a0e7-45df-9e01-e837801b5ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 67

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenSharedFence", "CreateFence"]

    /**
     * Opens a handle for a shared fence by using HANDLE and REFIID.
     * @param {HANDLE} hFence Type: <b>HANDLE</b>
     * 
     * The handle that was returned by a call to <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-createsharedhandle">ID3D11Fence::CreateSharedHandle</a> or <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createsharedhandle">ID3D12Device::CreateSharedHandle</a>.
     * @param {Pointer<Guid>} ReturnedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> interface. The <b>REFIID</b>, or <b>GUID</b>, of the interface can be obtained by using the __uuidof() macro. For example, __uuidof(ID3D11Fence) will get the <b>GUID</b> of the interface to the fence.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11device5-opensharedfence
     */
    OpenSharedFence(hFence, ReturnedInterface) {
        hFence := hFence is Win32Handle ? NumGet(hFence, "ptr") : hFence

        result := ComCall(67, this, "ptr", hFence, "ptr", ReturnedInterface, "ptr*", &ppFence := 0, "HRESULT")
        return ppFence
    }

    /**
     * Creates a fence object.
     * @param {Integer} InitialValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The initial value for the fence.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_fence_flag">D3D11_FENCE_FLAG</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_fence_flag">D3D11_FENCE_FLAG</a>-typed values that are combined by using a bitwise OR operation. 
     *             The resulting value specifies options for the fence.
     * @param {Pointer<Guid>} ReturnedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the fence interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a>).
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the fence can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(ID3D11Fence) will get the <b>GUID</b> of the interface to a fence.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> interface that is used to access the fence.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11device5-createfence
     */
    CreateFence(InitialValue, Flags, ReturnedInterface) {
        result := ComCall(68, this, "uint", InitialValue, "int", Flags, "ptr", ReturnedInterface, "ptr*", &ppFence := 0, "HRESULT")
        return ppFence
    }
}
