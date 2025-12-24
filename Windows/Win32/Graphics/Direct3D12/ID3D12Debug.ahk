#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An interface used to turn on the debug layer.
 * @remarks
 * 
 * This interface is obtained by querying it from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12getdebuginterface">D3D12GetDebugInterface</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debug
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Debug
     * @type {Guid}
     */
    static IID => Guid("{344488b7-6846-474b-b989-f027448245e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableDebugLayer"]

    /**
     * Enables the debug layer.
     * @remarks
     * 
     * To enable the debug layers using this API, it must be called before the D3D12 device is created. Calling this API after creating the D3D12 device will cause the D3D12 runtime to remove the device.
     * 
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debug-enabledebuglayer
     */
    EnableDebugLayer() {
        ComCall(3, this)
    }
}
