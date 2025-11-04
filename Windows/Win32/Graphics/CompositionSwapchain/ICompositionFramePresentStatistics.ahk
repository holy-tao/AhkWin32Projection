#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentStatistics.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-icompositionframepresentstatistics
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class ICompositionFramePresentStatistics extends IPresentStatistics{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContentTag", "GetCompositionFrameId", "GetDisplayInstanceArray"]

    /**
     * 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getcontenttag
     */
    GetContentTag() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getcompositionframeid
     */
    GetCompositionFrameId() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} displayInstanceArrayCount 
     * @param {Pointer<Pointer<CompositionFrameDisplayInstance>>} displayInstanceArray 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getdisplayinstancearray
     */
    GetDisplayInstanceArray(displayInstanceArrayCount, displayInstanceArray) {
        displayInstanceArrayCountMarshal := displayInstanceArrayCount is VarRef ? "uint*" : "ptr"
        displayInstanceArrayMarshal := displayInstanceArray is VarRef ? "ptr*" : "ptr"

        ComCall(7, this, displayInstanceArrayCountMarshal, displayInstanceArrayCount, displayInstanceArrayMarshal, displayInstanceArray)
    }
}
