#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentStatistics.ahk

/**
 * Describes how the system displayed an instance of a particular piece of content within a particular present.
 * @remarks
 * There may be many frames for which a present is on screen. Statistics are only reported for the first composition frame on which a present appears.
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
     * Gets the tag of the content on which statistics are being reporting. (ICompositionFramePresentStatistics::GetContentTag)
     * @returns {Pointer} Type: **[UINT_PTR_](/windows/desktop/winprog/windows-data-types)**
     * 
     * The tag of the content on which statistics are being reporting.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getcontenttag
     */
    GetContentTag() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * Gets the ID of the composition frame, to be used in other APIs to get more detailed information.
     * @returns {Integer} TYPE: **CompositionFrameId**
     * 
     * The ID of the composition frame, to be used in other APIs to get more detailed information.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getcompositionframeid
     */
    GetCompositionFrameId() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Gets the array of display instances and its count.
     * @remarks
     * This data is valid for the lifetime of the `ICompositionFramePresentStatistics`, and should not be read after the `ICompositionFramePresentStatistics` is released.
     * @param {Pointer<Integer>} displayInstanceArrayCount Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The count of the _`displayInstanceArray`_.
     * @param {Pointer<Pointer<CompositionFrameDisplayInstance>>} displayInstanceArray Type: **[CompositionFrameDisplayInstance](ns-presentation-compositionframedisplayinstance.md) \*\***
     * 
     * The array of display instances.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getdisplayinstancearray
     */
    GetDisplayInstanceArray(displayInstanceArrayCount, displayInstanceArray) {
        displayInstanceArrayCountMarshal := displayInstanceArrayCount is VarRef ? "uint*" : "ptr"
        displayInstanceArrayMarshal := displayInstanceArray is VarRef ? "ptr*" : "ptr"

        ComCall(7, this, displayInstanceArrayCountMarshal, displayInstanceArrayCount, displayInstanceArrayMarshal, displayInstanceArray)
    }
}
