#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentStatistics.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentStatusPresentStatistics extends IPresentStatistics{
    /**
     * The interface identifier for IPresentStatusPresentStatistics
     * @type {Guid}
     */
    static IID => Guid("{c9ed2a41-79cb-435e-964e-c8553055420c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @returns {Integer} 
     */
    GetCompositionFrameId() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPresentStatus() {
        result := ComCall(6, this, "int")
        return result
    }
}
