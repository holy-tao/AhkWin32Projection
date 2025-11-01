#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IEnumBackgroundCopyFiles interface to enumerate the files that a job contains. To get an IEnumBackgroundCopyFiles interface pointer, call the IBackgroundCopyJob::EnumFiles method.
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ienumbackgroundcopyfiles
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IEnumBackgroundCopyFiles extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumBackgroundCopyFiles
     * @type {Guid}
     */
    static IID => Guid("{ca51e165-c365-424c-8d41-24aaa4ff3c40}")

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
     * @param {Pointer<IBackgroundCopyFile>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyfiles-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyfiles-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyfiles-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBackgroundCopyFiles>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyfiles-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ienumbackgroundcopyfiles-getcount
     */
    GetCount(puCount) {
        puCountMarshal := puCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, puCountMarshal, puCount, "HRESULT")
        return result
    }
}
