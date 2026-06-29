#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISBE2EnumStream.ahk" { ISBE2EnumStream }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Handles the mapping between output pins and streams for the Stream Buffer Source filter.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-isbe2streammap
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ISBE2StreamMap extends IUnknown {
    /**
     * The interface identifier for ISBE2StreamMap
     * @type {Guid}
     */
    static IID := Guid("{667c7745-85b1-4c55-ae55-4e25056159fc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISBE2StreamMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MapStream         : IntPtr
        UnmapStream       : IntPtr
        EnumMappedStreams : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISBE2StreamMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Maps a stream to an output pin for a Stream Buffer Source filter.
     * @remarks
     * If the new stream has different media type from the previously mapped stream, the output pin follows the dynamic format change procedure described in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dynamic-format-changes">Dynamic Format Changes</a>, and flushes downstream pins as described in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/flushing">Flushing</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2streammap-mapstream
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2streammap-unmapstream
     */
    UnmapStream(Stream) {
        result := ComCall(4, this, "uint", Stream, "HRESULT")
        return result
    }

    /**
     * Enumerates streams that are mapped to output pins in a Stream Buffer Source filter.
     * @remarks
     * In Windows 7, only one stream at a time can be mapped to an output pin, although a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2streammap-mapstream">ISBE2StreamMap::MapStream</a> method can be used to change the stream mapped to any particular pin while the graph is running. In previous versions of Windows, a stream mapped to a pin could not be changed while the graph was running.
     * @returns {ISBE2EnumStream} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-isbe2enumstream">ISBE2EnumStream</a> interface for an enumeration object that lists all streams mapped to the filter outputs pin.
     *           The caller is responsible for freeing the interface.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2streammap-enummappedstreams
     */
    EnumMappedStreams() {
        result := ComCall(5, this, "ptr*", &ppStreams := 0, "HRESULT")
        return ISBE2EnumStream(ppStreams)
    }

    Query(iid) {
        if (ISBE2StreamMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MapStream := CallbackCreate(GetMethod(implObj, "MapStream"), flags, 2)
        this.vtbl.UnmapStream := CallbackCreate(GetMethod(implObj, "UnmapStream"), flags, 2)
        this.vtbl.EnumMappedStreams := CallbackCreate(GetMethod(implObj, "EnumMappedStreams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MapStream)
        CallbackFree(this.vtbl.UnmapStream)
        CallbackFree(this.vtbl.EnumMappedStreams)
    }
}
