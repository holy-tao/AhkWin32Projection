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
     * Maps a stream to an output pin for a Stream Buffer Source filter.
     * @param {Integer} Stream Identifier for the stream mapped to an output pin. The major type of the stream must match the major type of the pin.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified stream has already been mapped to a pin.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot unmap the stream, because the default mode is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32 (ERROR_NOT_FOUND)</b></dt>
     * <dt>0x80070490</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No stream exists with the specified stream identifier.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2streammap-mapstream
     */
    MapStream(Stream) {
        result := ComCall(3, this, "uint", Stream, "HRESULT")
        return result
    }

    /**
     * Removes the mapping between a stream and an output pin for a Stream Buffer Source filter.
     * @param {Integer} Stream Identifier for the stream. This stream will be unmapped from the output pin.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified stream does not exist or was not previously mapped to a pin.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot unmap the stream, because the default mode is enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2streammap-unmapstream
     */
    UnmapStream(Stream) {
        result := ComCall(4, this, "uint", Stream, "HRESULT")
        return result
    }

    /**
     * Enumerates streams that are mapped to output pins in a Stream Buffer Source filter.
     * @returns {ISBE2EnumStream} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-isbe2enumstream">ISBE2EnumStream</a> interface for an enumeration object that lists all streams mapped to the filter outputs pin.
     *           The caller is responsible for freeing the interface.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2streammap-enummappedstreams
     */
    EnumMappedStreams() {
        result := ComCall(5, this, "ptr*", &ppStreams := 0, "HRESULT")
        return ISBE2EnumStream(ppStreams)
    }
}
