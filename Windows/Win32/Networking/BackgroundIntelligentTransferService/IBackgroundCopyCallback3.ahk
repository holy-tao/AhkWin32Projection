#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyCallback2.ahk

/**
 * Clients implement the IBackgroundCopyCallback3 interface to receive notification that ranges of a file have completed downloading.
 * @see https://docs.microsoft.com/windows/win32/api//bits10_1/nn-bits10_1-ibackgroundcopycallback3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyCallback3 extends IBackgroundCopyCallback2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyCallback3
     * @type {Guid}
     */
    static IID => Guid("{98c97bd2-e32b-4ad8-a528-95fd8b16bd42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FileRangesTransferred"]

    /**
     * BITS calls your implementation of the FileRangesTransferred method when one or more file ranges have been downloaded. File ranges are added to the job using the IBackgroundCopyFile6::RequestFileRanges method.
     * @param {IBackgroundCopyJob} job An <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob</a> object that contains the  methods for accessing property, progress, and state information of the job. Do not release <i>pJob</i>; BITS releases the interface when the method returns.
     * @param {IBackgroundCopyFile} file An <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyfile">IBackgroundCopyFile</a> object that contains information about the file whose ranges have changed. Do not release <i>pFile</i>; BITS releases the interface when the method returns.
     * @param {Integer} rangeCount The count of entries in the ranges array.
     * @param {Pointer<BG_FILE_RANGE>} ranges An array of the files ranges that have transferred since the last call to <b>FileRangesTransferred</b>  or the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/bits10_1/nf-bits10_1-ibackgroundcopyfile6-requestfileranges">IBackgroundCopyFile6::RequestFileRanges</a> method. Do not free <i>ranges</i>; BITS frees the ranges memory when the <b>FileRangesTransferred</b> method returns.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success; otherwise, returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bits10_1/nf-bits10_1-ibackgroundcopycallback3-filerangestransferred
     */
    FileRangesTransferred(job, file, rangeCount, ranges) {
        result := ComCall(7, this, "ptr", job, "ptr", file, "uint", rangeCount, "ptr", ranges, "HRESULT")
        return result
    }
}
