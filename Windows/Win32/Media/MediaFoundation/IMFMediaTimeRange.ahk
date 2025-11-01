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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Float>} pStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getstart
     */
    GetStart(index, pStart) {
        result := ComCall(4, this, "uint", index, "double*", pStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Float>} pEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getend
     */
    GetEnd(index, pEnd) {
        result := ComCall(5, this, "uint", index, "double*", pEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-containstime
     */
    ContainsTime(time) {
        result := ComCall(6, this, "double", time, "int")
        return result
    }

    /**
     * 
     * @param {Float} startTime 
     * @param {Float} endTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-addrange
     */
    AddRange(startTime, endTime) {
        result := ComCall(7, this, "double", startTime, "double", endTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
