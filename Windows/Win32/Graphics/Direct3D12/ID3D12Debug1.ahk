#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Adds GPU-Based Validation and Dependent Command Queue Synchronization to the debug layer.
 * @remarks
 * 
  * This interface is currently in Preview mode.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debug1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug1 extends IUnknown{
    /**
     * The interface identifier for ID3D12Debug1
     * @type {Guid}
     */
    static IID => Guid("{affaa4ca-63fe-4d8e-b8ad-159000af4304}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    EnableDebugLayer() {
        ComCall(3, this)
        return result
    }

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
}
