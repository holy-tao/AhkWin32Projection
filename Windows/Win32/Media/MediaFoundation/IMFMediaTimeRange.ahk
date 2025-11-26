#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a list of time ranges, where each range is defined by a start and end time.
 * @remarks
 * 
 * The <b>IMFMediaTimeRange</b> interface corresponds to the <b>TimeRanges</b> interface in HTML5.
 * 
 * Several <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengine">IMFMediaEngine</a> methods return <b>IMFMediaTimeRange</b> pointers.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediatimerange
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaTimeRange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaTimeRange
     * @type {Guid}
     */
    static IID => Guid("{db71a2fc-078a-414e-9df9-8c2531b0aa6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLength", "GetStart", "GetEnd", "ContainsTime", "AddRange", "Clear"]

    /**
     * Gets the number of time ranges contained in the object.
     * @returns {Integer} Returns the number of time ranges.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediatimerange-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Gets the start time for a specified time range.
     * @param {Integer} index The zero-based index of the time range to query. To get the  number of time ranges, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getlength">IMFMediaTimeRange::GetLength</a>.
     * @returns {Float} Receives the start time, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediatimerange-getstart
     */
    GetStart(index) {
        result := ComCall(4, this, "uint", index, "double*", &pStart := 0, "HRESULT")
        return pStart
    }

    /**
     * Gets the end time for a specified time range.
     * @param {Integer} index The zero-based index of the time range to query. To get the  number of time ranges, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getlength">IMFMediaTimeRange::GetLength</a>.
     * @returns {Float} Receives the end time, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediatimerange-getend
     */
    GetEnd(index) {
        result := ComCall(5, this, "uint", index, "double*", &pEnd := 0, "HRESULT")
        return pEnd
    }

    /**
     * Queries whether a specified time falls within any of the time ranges.
     * @param {Float} time The time, in seconds.
     * @returns {BOOL} Returns <b>TRUE</b> if any time range contained in this object spans the value of the <i>time</i> parameter. Otherwise, returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediatimerange-containstime
     */
    ContainsTime(time) {
        result := ComCall(6, this, "double", time, "int")
        return result
    }

    /**
     * Adds a new range to the list of time ranges.
     * @param {Float} startTime The start time, in seconds.
     * @param {Float} endTime The end time, in seconds.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediatimerange-addrange
     */
    AddRange(startTime, endTime) {
        result := ComCall(7, this, "double", startTime, "double", endTime, "HRESULT")
        return result
    }

    /**
     * Clears the list of time ranges.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediatimerange-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
