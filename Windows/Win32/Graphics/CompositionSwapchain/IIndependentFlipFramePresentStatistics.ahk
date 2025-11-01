#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentStatistics.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-iindependentflipframepresentstatistics
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IIndependentFlipFramePresentStatistics extends IPresentStatistics{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutputAdapterLUID", "GetOutputVidPnSourceId", "GetContentTag", "GetDisplayedTime", "GetPresentDuration"]

    /**
     * 
     * @returns {LUID} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getoutputadapterluid
     */
    GetOutputAdapterLUID() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getoutputvidpnsourceid
     */
    GetOutputVidPnSourceId() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getcontenttag
     */
    GetContentTag() {
        result := ComCall(7, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {SystemInterruptTime} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getdisplayedtime
     */
    GetDisplayedTime() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {SystemInterruptTime} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getpresentduration
     */
    GetPresentDuration() {
        result := ComCall(9, this, "ptr")
        return result
    }
}
