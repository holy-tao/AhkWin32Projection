#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISBE2EnumStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Handles the mapping between output pins and streams for the Stream Buffer Source filter.
 * @remarks
 * 
  * In version 1 of the Stream Buffer Engine (SBE), each output pin is mapped to a single stream for the lifetime of the filter. Starting in version 2 of SBE,   the application can change the mapping, as follows:
  * 
  * <ol>
  * <li>Query the Stream Buffer Source filter for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-isbe2crossbar">ISBE2Crossbar</a> interface.</li>
  * <li>Disable default stream mode by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2crossbar-enabledefaultmode">ISBE2Crossbar::EnableDefaultMode</a> method without the DEF_MODE_STREAMS flag.</li>
  * <li>Query the output pin for the <b>ISBE2StreamMap</b> interface.</li>
  * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2streammap-mapstream">ISBE2StreamMap::MapStream</a>.</li>
  * </ol>
  *     For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/stream-buffer-source-filter-enhancements-in-windows-7">Stream Buffer Source Filter Enhancements in Windows 7</a>.
  * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2StreamMap)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2streammap
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2StreamMap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2StreamMap
     * @type {Guid}
     */
    static IID => Guid("{667c7745-85b1-4c55-ae55-4e25056159fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapStream", "UnmapStream", "EnumMappedStreams"]

    /**
     * 
     * @param {Integer} Stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2streammap-mapstream
     */
    MapStream(Stream) {
        result := ComCall(3, this, "uint", Stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2streammap-unmapstream
     */
    UnmapStream(Stream) {
        result := ComCall(4, this, "uint", Stream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISBE2EnumStream} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2streammap-enummappedstreams
     */
    EnumMappedStreams() {
        result := ComCall(5, this, "ptr*", &ppStreams := 0, "HRESULT")
        return ISBE2EnumStream(ppStreams)
    }
}
