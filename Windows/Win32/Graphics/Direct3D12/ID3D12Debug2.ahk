#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Adds configurable levels of GPU-based validation to the debug layer.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debug2
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Debug2
     * @type {Guid}
     */
    static IID => Guid("{93a665c4-a3b2-4e5d-b692-a26ae14e3374}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGPUBasedValidationFlags"]

    /**
     * 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug2-setgpubasedvalidationflags
     */
    SetGPUBasedValidationFlags(Flags) {
        ComCall(3, this, "int", Flags)
    }
}
