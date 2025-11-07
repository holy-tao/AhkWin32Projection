#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob.ahk
#Include .\IEnumBackgroundCopyJobs.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IEnumBackgroundCopyJobs interface to enumerate the list of jobs in the transfer queue. To get an IEnumBackgroundCopyJobs interface pointer, call the IBackgroundCopyManager::EnumJobs method.
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ienumbackgroundcopyjobs
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IEnumBackgroundCopyJobs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumBackgroundCopyJobs
     * @type {Guid}
     */
    static IID => Guid("{1af4f612-3b71-466f-8f58-7b6f73ac57ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "GetCount"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {IBackgroundCopyJob} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyjobs-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IBackgroundCopyJob(rgelt)
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyjobs-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyjobs-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumBackgroundCopyJobs} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyjobs-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumBackgroundCopyJobs(ppenum)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyjobs-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }
}
