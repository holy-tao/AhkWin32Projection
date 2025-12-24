#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList2.ahk

/**
 * Encapsulates a list of graphics commands for rendering.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12graphicscommandlist3
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList3 extends ID3D12GraphicsCommandList2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList3
     * @type {Guid}
     */
    static IID => Guid("{6fda83a7-b84c-4e38-9ac8-c7bd22016b3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 67

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProtectedResourceSession"]

    /**
     * Specifies whether or not protected resources can be accessed by subsequent commands in the command list.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession Type: **[ID3D12ProtectedResourceSession](./nn-d3d12-id3d12protectedresourcesession.md)\***
     * 
     * An optional pointer to an **ID3D12ProtectedResourceSession**. You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](./nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist3-setprotectedresourcesession
     */
    SetProtectedResourceSession(pProtectedResourceSession) {
        ComCall(67, this, "ptr", pProtectedResourceSession)
    }
}
