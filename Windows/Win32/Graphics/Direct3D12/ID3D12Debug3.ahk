#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Debug.ahk

/**
 * Adds configurable levels of GPU-based validation to the debug layer.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debug3
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug3 extends ID3D12Debug{
    /**
     * The interface identifier for ID3D12Debug3
     * @type {Guid}
     */
    static IID => Guid("{5cf4e58f-f671-4ff1-a542-3686e3d153d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     */
    SetEnableGPUBasedValidation(Enable) {
        ComCall(4, this, "int", Enable)
        return result
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     */
    SetEnableSynchronizedCommandQueueValidation(Enable) {
        ComCall(5, this, "int", Enable)
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGPUBasedValidationFlags(Flags) {
        ComCall(6, this, "int", Flags)
        return result
    }
}
