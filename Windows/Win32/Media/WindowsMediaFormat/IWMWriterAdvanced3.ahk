#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMWriterAdvanced2.ahk" { IWMWriterAdvanced2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WM_WRITER_STATISTICS_EX.ahk" { WM_WRITER_STATISTICS_EX }

/**
 * The IWMWriterAdvanced3 interface provides additional functionality for the writer object.IWMWriterAdvanced3 exists for every instance of the writer object. To obtain a pointer to this interface, call QueryInterface on the writer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwriteradvanced3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWriterAdvanced3 extends IWMWriterAdvanced2 {
    /**
     * The interface identifier for IWMWriterAdvanced3
     * @type {Guid}
     */
    static IID := Guid("{2cd6492d-7c37-4e76-9d3b-59261183a22e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWriterAdvanced3 interfaces
    */
    struct Vtbl extends IWMWriterAdvanced2.Vtbl {
        GetStatisticsEx : IntPtr
        SetNonBlocking  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWriterAdvanced3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetStatisticsEx method retrieves extended statistics for the writer.
     * @remarks
     * <b>GetStatisticsEx</b> is not an improved version of <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getstatistics">IWMWriterAdvanced::GetStatistics</a>. The statistics retrieved by <b>GetStatistics</b> are not retrieved by <b>GetStatisticsEx</b>; if you want to get all available statistics you must call both methods.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number for which you want to get statistics. You can pass 0 to obtain extended statistics for the entire file. Stream numbers are in the range of 1 through 63.
     * @returns {WM_WRITER_STATISTICS_EX} Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_writer_statistics_ex">WM_WRITER_STATISTICS_EX</a> structure that receives the statistics.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced3-getstatisticsex
     */
    GetStatisticsEx(wStreamNum) {
        pStats := WM_WRITER_STATISTICS_EX()
        result := ComCall(16, this, "ushort", wStreamNum, WM_WRITER_STATISTICS_EX.Ptr, pStats, "HRESULT")
        return pStats
    }

    /**
     * The SetNonBlocking method configures the writer so that the calling thread is not blocked while writing samples.
     * @remarks
     * You should use this method only for time-critical threads. After calling <b>SetNonBlocking</b>, it is the responsibility of the calling application to control the amount of data that is queued to the writer. It is possible to queue too much data for the writer to handle, or to take up too many of the resources of the computer. In extreme cases, the encoding session can stop unexpectedly as a result.
     * 
     * This method has no effect when writing from a live source. It is normal for the writer to refrain from blocking the caller's thread in a live encoding situation.
     * @returns {HRESULT} The method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced3-setnonblocking
     */
    SetNonBlocking() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMWriterAdvanced3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatisticsEx := CallbackCreate(GetMethod(implObj, "GetStatisticsEx"), flags, 3)
        this.vtbl.SetNonBlocking := CallbackCreate(GetMethod(implObj, "SetNonBlocking"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatisticsEx)
        CallbackFree(this.vtbl.SetNonBlocking)
    }
}
