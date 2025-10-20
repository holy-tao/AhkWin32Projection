#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentStatistics.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IIndependentFlipFramePresentStatistics extends IPresentStatistics{
    /**
     * The interface identifier for IIndependentFlipFramePresentStatistics
     * @type {Guid}
     */
    static IID => Guid("{8c93be27-ad94-4da0-8fd4-2413132d124e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @returns {LUID} 
     */
    GetOutputAdapterLUID() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputVidPnSourceId() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetContentTag() {
        result := ComCall(7, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {SystemInterruptTime} 
     */
    GetDisplayedTime() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {SystemInterruptTime} 
     */
    GetPresentDuration() {
        result := ComCall(9, this, "ptr")
        return result
    }
}
