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
     * 
     * @param {IBackgroundCopyJob} job 
     * @param {IBackgroundCopyFile} file 
     * @param {Integer} rangeCount 
     * @param {Pointer<BG_FILE_RANGE>} ranges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nf-bits10_1-ibackgroundcopycallback3-filerangestransferred
     */
    FileRangesTransferred(job, file, rangeCount, ranges) {
        result := ComCall(7, this, "ptr", job, "ptr", file, "uint", rangeCount, "ptr", ranges, "HRESULT")
        return result
    }
}
