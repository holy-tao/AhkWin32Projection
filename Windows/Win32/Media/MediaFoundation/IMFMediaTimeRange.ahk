#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a list of time ranges, where each range is defined by a start and end time.
 * @remarks
 * The <b>IMFMediaTimeRange</b> interface corresponds to the <b>TimeRanges</b> interface in HTML5.
 * 
 * Several <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengine">IMFMediaEngine</a> methods return <b>IMFMediaTimeRange</b> pointers.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaTimeRange extends IUnknown {
    /**
     * The interface identifier for IMFMediaTimeRange
     * @type {Guid}
     */
    static IID := Guid("{db71a2fc-078a-414e-9df9-8c2531b0aa6c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaTimeRange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLength    : IntPtr
        GetStart     : IntPtr
        GetEnd       : IntPtr
        ContainsTime : IntPtr
        AddRange     : IntPtr
        Clear        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaTimeRange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of time ranges contained in the object.
     * @remarks
     * This method corresponds to the <b>TimeRanges.length</b> attribute in HTML5.
     * @returns {Integer} Returns the number of time ranges.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getlength
     */
    GetLength() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Gets the start time for a specified time range.
     * @remarks
     * This method corresponds to the <b>TimeRanges.start</b> method in HTML5.
     * @param {Integer} index The zero-based index of the time range to query. To get the  number of time ranges, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getlength">IMFMediaTimeRange::GetLength</a>.
     * @returns {Float} Receives the start time, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getstart
     */
    GetStart(index) {
        result := ComCall(4, this, "uint", index, "double*", &pStart := 0, "HRESULT")
        return pStart
    }

    /**
     * Gets the end time for a specified time range.
     * @remarks
     * This method corresponds to the <b>TimeRanges.end</b> method in HTML5.
     * @param {Integer} index The zero-based index of the time range to query. To get the  number of time ranges, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getlength">IMFMediaTimeRange::GetLength</a>.
     * @returns {Float} Receives the end time, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-getend
     */
    GetEnd(index) {
        result := ComCall(5, this, "uint", index, "double*", &pEnd := 0, "HRESULT")
        return pEnd
    }

    /**
     * Queries whether a specified time falls within any of the time ranges.
     * @remarks
     * This method returns <b>TRUE</b> if the following condition holds for any time range in the list:
     * 
     * <i>start</i>
     * <i>time</i>
     * <i>time</i>
     * <i>end</i>
     * @param {Float} time The time, in seconds.
     * @returns {BOOL} Returns <b>TRUE</b> if any time range contained in this object spans the value of the <i>time</i> parameter. Otherwise, returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-containstime
     */
    ContainsTime(time) {
        result := ComCall(6, this, "double", time, BOOL)
        return result
    }

    /**
     * Adds a new range to the list of time ranges.
     * @remarks
     * If the new range intersects a range already in the list, the two ranges are combined. Otherwise, the new range is added to the list.
     * @param {Float} startTime The start time, in seconds.
     * @param {Float} endTime The end time, in seconds.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-addrange
     */
    AddRange(startTime, endTime) {
        result := ComCall(7, this, "double", startTime, "double", endTime, "HRESULT")
        return result
    }

    /**
     * Clears the list of time ranges.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediatimerange-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaTimeRange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 1)
        this.vtbl.GetStart := CallbackCreate(GetMethod(implObj, "GetStart"), flags, 3)
        this.vtbl.GetEnd := CallbackCreate(GetMethod(implObj, "GetEnd"), flags, 3)
        this.vtbl.ContainsTime := CallbackCreate(GetMethod(implObj, "ContainsTime"), flags, 2)
        this.vtbl.AddRange := CallbackCreate(GetMethod(implObj, "AddRange"), flags, 3)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetStart)
        CallbackFree(this.vtbl.GetEnd)
        CallbackFree(this.vtbl.ContainsTime)
        CallbackFree(this.vtbl.AddRange)
        CallbackFree(this.vtbl.Clear)
    }
}
