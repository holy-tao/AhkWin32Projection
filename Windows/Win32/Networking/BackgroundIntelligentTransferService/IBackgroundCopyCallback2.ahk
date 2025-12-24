#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyCallback.ahk

/**
 * Implement this interface to receive notification that a file has completed downloading.
 * @remarks
 * 
 * For more details on implementing this interface, see the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibackgroundcopycallback2
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyCallback2 extends IBackgroundCopyCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyCallback2
     * @type {Guid}
     */
    static IID => Guid("{659cdeac-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FileTransferred"]

    /**
     * BITS calls your implementation of the FileTransferred method when BITS successfully finishes transferring a file.
     * @param {IBackgroundCopyJob} pJob Contains job-related information. Do not release <i>pJob</i>; BITS releases the interface when this method returns.
     * @param {IBackgroundCopyFile} pFile Contains file-related information. Do not release <i>pFile</i>; BITS releases the interface when this method returns.
     * @returns {HRESULT} This method should return <b>S_OK</b>; otherwise,  if negative, BITS continues to call this method until <b>S_OK</b> is returned. For performance reasons, you should limit the number  of times you return a value other than <b>S_OK</b> to a few times. As an alternative to returning an error code, consider always returning <b>S_OK</b> and handling the error internally. The interval at which this method is called is arbitrary.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopycallback2-filetransferred
     */
    FileTransferred(pJob, pFile) {
        result := ComCall(6, this, "ptr", pJob, "ptr", pFile, "HRESULT")
        return result
    }
}
