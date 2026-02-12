#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a single entry in the present statistics queue.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nn-presentation-ipresentstatistics
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentStatistics extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPresentStatistics
     * @type {Guid}
     */
    static IID => Guid("{b44b8bda-7282-495d-9dd7-ceadd8b4bb86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPresentId", "GetKind"]

    /**
     * Gets the identifier of the present to which this statistic corresponds.
     * @returns {Integer} Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * 
     * The identifier of the present to which this statistic corresponds.
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentstatistics-getpresentid
     */
    GetPresentId() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Gets the specific kind of present statistics to which this data corresponds.
     * @returns {Integer} Type: **[PresentStatisticsKind](../presentationtypes/ne-presentationtypes-presentstatisticskind.md)**
     * 
     * The specific kind of present statistics to which this data corresponds.
     * @see https://learn.microsoft.com/windows/win32/api//content/presentation/nf-presentation-ipresentstatistics-getkind
     */
    GetKind() {
        result := ComCall(4, this, "int")
        return result
    }
}
