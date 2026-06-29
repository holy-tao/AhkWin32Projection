#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBackgroundCopyFile5.ahk" { IBackgroundCopyFile5 }
#Import ".\BG_FILE_RANGE.ahk" { BG_FILE_RANGE }

/**
 * Use this interface to request file ranges for On Demand download jobs.
 * @remarks
 * To get an <b>IBackgroundCopyFile6</b> interface    pointer, call the <b>IBackgroundCopyFile::QueryInterface</b> method using "__uuidof(IBackgroundCopyFile6)" for the interface identifier.
 * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nn-bits10_1-ibackgroundcopyfile6
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyFile6 extends IBackgroundCopyFile5 {
    /**
     * The interface identifier for IBackgroundCopyFile6
     * @type {Guid}
     */
    static IID := Guid("{cf6784f7-d677-49fd-9368-cb47aee9d1ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyFile6 interfaces
    */
    struct Vtbl extends IBackgroundCopyFile5.Vtbl {
        UpdateDownloadPosition : IntPtr
        RequestFileRanges      : IntPtr
        GetFilledFileRanges    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyFile6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies a position to prioritize downloading missing data from.
     * @remarks
     * <b>UpdateDownloadPosition</b> can be requested for any download job that also meets the requirements for <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b> jobs.
     * 
     *   
     * The requirements for a <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b> job is that the transfer must be a <b>DOWNLOAD</b> job.  The job must not be <b>DYNAMIC</b> and the server must be an HTTP or HTTPS server and the server requirements for range support must all be met.
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/Bits/http-requirements-for-bits-downloads">HTTP Requirements for BITS Downloads</a>.
     * @param {Integer} offset Specifies the new position to prioritize downloading missing data from.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. It will return <b>BG_E_RANDOM_ACCESS_NOT_SUPPORTED</b> if the job does not meet the requirements of a <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b> job.
     * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nf-bits10_1-ibackgroundcopyfile6-updatedownloadposition
     */
    UpdateDownloadPosition(offset) {
        result := ComCall(15, this, "uint", offset, "HRESULT")
        return result
    }

    /**
     * Adds a new set of file ranges to be prioritized for download.
     * @remarks
     * <b>RequestFileRanges</b> can be requested for any download job that also meets the requirements for <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b> jobs.
     * 
     *   
     * The requirements for a <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b> job is that the transfer must be a <b>DOWNLOAD</b> job.  The job must not be <b>DYNAMIC</b> and the server must be an HTTP or HTTPS server and the server requirements for range support must all be met.
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/Bits/http-requirements-for-bits-downloads">HTTP Requirements for BITS Downloads</a>.
     * 
     * When all of the requested ranges have been downloaded the job state will be set to <b>BG_JOB_STATE_TRANSFERRED</b> if all of the bytes of the file have been transferred.  Otherwise, the job state will be set to <b>BG_JOB_STATE_SUSPENDED</b>.
     * @param {Integer} rangeCount Specifies the size of the <i>Ranges</i> array.
     * @param {Pointer<BG_FILE_RANGE>} ranges An array of file ranges to be downloaded. Requested ranges are allowed to overlap previously downloaded (or pending) ranges. Ranges are automatically split into non-overlapping ranges.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.  <b>BG_E_INVALID_RANGE</b> is returned if any part of the requested range is outside the actual file size; <b>BG_E_RANDOM_ACCESS_NOT_SUPPORTED</b> is returned if the job is not a download job or if the server loses its ability to support download ranges.
     * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nf-bits10_1-ibackgroundcopyfile6-requestfileranges
     */
    RequestFileRanges(rangeCount, ranges) {
        result := ComCall(16, this, "uint", rangeCount, BG_FILE_RANGE.Ptr, ranges, "HRESULT")
        return result
    }

    /**
     * Returns the set of file ranges that have been downloaded.
     * @remarks
     * <b>GetFilledFileRanges</b> can be requested for any download job that also meets the requirements for <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b> jobs.  
     * 
     * 
     * The requirements for a <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b> job is that the transfer must be a <b>DOWNLOAD</b> job.  The job must not be <b>DYNAMIC</b> and the server must be an HTTP or HTTPS server and the server requirements for range support must all be met.
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/Bits/http-requirements-for-bits-downloads">HTTP Requirements for BITS Downloads</a>.
     * @param {Pointer<Integer>} rangeCount The number of elements in <i>Ranges</i>.
     * @param {Pointer<Pointer<BG_FILE_RANGE>>} ranges Array of <b>BG_FILE_RANGE</b> structures that describes the ranges that have been downloaded. Ranges will be merged together as much as possible. The ranges are ordered by offset.  When done, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>Ranges</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.  The error will be <b>E_OUTOFMEMORY</b> if the <i>Ranges</i> array could not be allocated and <b>BG_E_RANDOM_ACCESS_NOT_SUPPORTED</b> if the job is not a download job or if the server loses its ability to support download ranges.
     * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nf-bits10_1-ibackgroundcopyfile6-getfilledfileranges
     */
    GetFilledFileRanges(rangeCount, ranges) {
        rangeCountMarshal := rangeCount is VarRef ? "uint*" : "ptr"
        rangesMarshal := ranges is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, rangeCountMarshal, rangeCount, rangesMarshal, ranges, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBackgroundCopyFile6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateDownloadPosition := CallbackCreate(GetMethod(implObj, "UpdateDownloadPosition"), flags, 2)
        this.vtbl.RequestFileRanges := CallbackCreate(GetMethod(implObj, "RequestFileRanges"), flags, 3)
        this.vtbl.GetFilledFileRanges := CallbackCreate(GetMethod(implObj, "GetFilledFileRanges"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateDownloadPosition)
        CallbackFree(this.vtbl.RequestFileRanges)
        CallbackFree(this.vtbl.GetFilledFileRanges)
    }
}
