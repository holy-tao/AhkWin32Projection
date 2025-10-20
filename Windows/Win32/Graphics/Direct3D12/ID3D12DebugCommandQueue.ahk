#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to monitor and debug a command queue.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandqueue
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DebugCommandQueue extends IUnknown{
    /**
     * The interface identifier for ID3D12DebugCommandQueue
     * @type {Guid}
     */
    static IID => Guid("{09e0bf36-54ac-484f-8847-4baeeab6053a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Integer} Subresource 
     * @param {Integer} State 
     * @returns {BOOL} 
     */
    AssertResourceState(pResource, Subresource, State) {
        result := ComCall(3, this, "ptr", pResource, "uint", Subresource, "uint", State, "int")
        return result
    }
}
