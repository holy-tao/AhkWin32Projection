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
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @param {IBackgroundCopyFile} pFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopycallback2-filetransferred
     */
    FileTransferred(pJob, pFile) {
        result := ComCall(6, this, "ptr", pJob, "ptr", pFile, "HRESULT")
        return result
    }
}
