#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentStatistics.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class ICompositionFramePresentStatistics extends IPresentStatistics{
    /**
     * The interface identifier for ICompositionFramePresentStatistics
     * @type {Guid}
     */
    static IID => Guid("{ab41d127-c101-4c0a-911d-f9f2e9d08e64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @returns {Pointer} 
     */
    GetContentTag() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCompositionFrameId() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} displayInstanceArrayCount 
     * @param {Pointer<CompositionFrameDisplayInstance>} displayInstanceArray 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDisplayInstanceArray(displayInstanceArrayCount, displayInstanceArray) {
        ComCall(7, this, "uint*", displayInstanceArrayCount, "ptr", displayInstanceArray)
        return result
    }
}
