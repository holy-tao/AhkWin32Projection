#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Part of a contract between D3D11On12 diagnostic layers and graphics diagnostics tools.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12sharingcontract
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12SharingContract extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12SharingContract
     * @type {Guid}
     */
    static IID => Guid("{0adf7d52-929c-4e61-addb-ffed30de66ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Present", "SharedFenceSignal", "BeginCapturableWork", "EndCapturableWork"]

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Integer} Subresource 
     * @param {HWND} window 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12sharingcontract-present
     */
    Present(pResource, Subresource, window) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        ComCall(3, this, "ptr", pResource, "uint", Subresource, "ptr", window)
    }

    /**
     * 
     * @param {ID3D12Fence} pFence 
     * @param {Integer} FenceValue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12sharingcontract-sharedfencesignal
     */
    SharedFenceSignal(pFence, FenceValue) {
        ComCall(4, this, "ptr", pFence, "uint", FenceValue)
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginCapturableWork(guid) {
        ComCall(5, this, "ptr", guid)
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {String} Nothing - always returns an empty string
     */
    EndCapturableWork(guid) {
        ComCall(6, this, "ptr", guid)
    }
}
