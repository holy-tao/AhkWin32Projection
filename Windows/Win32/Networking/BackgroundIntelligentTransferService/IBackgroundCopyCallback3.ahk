#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBackgroundCopyJob.ahk" { IBackgroundCopyJob }
#Import ".\IBackgroundCopyFile.ahk" { IBackgroundCopyFile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBackgroundCopyCallback2.ahk" { IBackgroundCopyCallback2 }
#Import ".\BG_FILE_RANGE.ahk" { BG_FILE_RANGE }

/**
 * Clients implement the IBackgroundCopyCallback3 interface to receive notification that ranges of a file have completed downloading.
 * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nn-bits10_1-ibackgroundcopycallback3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyCallback3 extends IBackgroundCopyCallback2 {
    /**
     * The interface identifier for IBackgroundCopyCallback3
     * @type {Guid}
     */
    static IID := Guid("{98c97bd2-e32b-4ad8-a528-95fd8b16bd42}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyCallback3 interfaces
    */
    struct Vtbl extends IBackgroundCopyCallback2.Vtbl {
        FileRangesTransferred : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyCallback3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * BITS calls your implementation of the FileRangesTransferred method when one or more file ranges have been downloaded. File ranges are added to the job using the IBackgroundCopyFile6::RequestFileRanges method.
     * @remarks
     * The ranges returned in this method may not match the ranges you requested.  This is because BITS will not download the same byte range twice, and because BITS can report when part of a range is downloaded.
     * 
     * Your implementation may not receive all modification events under maximum resource load conditions.
     * 
     * BITS generates a high volume of events; consider creating a timer and polling for state and progress information or limiting your use of this callback. If you use this callback, keep your implementation short.  You should set the <b>BITS_JOB_PROPERTY_MINIMUM_NOTIFICATION_INTERVAL</b> property to the highest value that still meets your needs; this will reduce the number of unneeded callbacks.
     * 
     * 
     * <div class="alert"><b>Note</b>  BITS supports up to four simultaneous notifications per user. If one or more applications block all four notifications for a user from returning, an application running as the same user will not receive notifications until one or more of the blocking notifications return. 
     * </div>
     * <div> </div>
     * @param {IBackgroundCopyJob} job An <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob</a> object that contains the  methods for accessing property, progress, and state information of the job. Do not release <i>pJob</i>; BITS releases the interface when the method returns.
     * @param {IBackgroundCopyFile} _file An <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyfile">IBackgroundCopyFile</a> object that contains information about the file whose ranges have changed. Do not release <i>pFile</i>; BITS releases the interface when the method returns.
     * @param {Integer} rangeCount The count of entries in the ranges array.
     * @param {Pointer<BG_FILE_RANGE>} ranges An array of the files ranges that have transferred since the last call to <b>FileRangesTransferred</b>  or the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/bits10_1/nf-bits10_1-ibackgroundcopyfile6-requestfileranges">IBackgroundCopyFile6::RequestFileRanges</a> method. Do not free <i>ranges</i>; BITS frees the ranges memory when the <b>FileRangesTransferred</b> method returns.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nf-bits10_1-ibackgroundcopycallback3-filerangestransferred
     */
    FileRangesTransferred(job, _file, rangeCount, ranges) {
        result := ComCall(7, this, "ptr", job, "ptr", _file, "uint", rangeCount, BG_FILE_RANGE.Ptr, ranges, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBackgroundCopyCallback3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FileRangesTransferred := CallbackCreate(GetMethod(implObj, "FileRangesTransferred"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FileRangesTransferred)
    }
}
