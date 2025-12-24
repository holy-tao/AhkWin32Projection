#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyFile.ahk
#Include .\IEnumBackgroundCopyFiles.ahk
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
     * Retrieves a specified number of items in the enumeration sequence. If there are fewer than the requested number of elements left in the sequence, it retrieves the remaining elements.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pceltFetched Number of elements returned in <i>rgelt</i>. You can set <i>pceltFetched</i> to <b>NULL</b> if <i>celt</i> is one. Otherwise, initialize the value of <i>pceltFetched</i> to 0 before calling this method.
     * @returns {IBackgroundCopyFile} Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyfile">IBackgroundCopyFile</a> objects. You must release each object in <i>rgelt</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ienumbackgroundcopyfiles-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IBackgroundCopyFile(rgelt)
    }

    /**
     * Skips the next specified number of elements in the enumeration sequence. If there are fewer elements left in the sequence than the requested number of elements to skip, it skips past the last element in the sequence.
     * @param {Integer} celt Number of elements to skip.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully skipped the number of requested elements.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Skipped less than the number of requested elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ienumbackgroundcopyfiles-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success or one of the standard COM <b>HRESULT</b> values on error.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ienumbackgroundcopyfiles-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates another IEnumBackgroundCopyFiles enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumBackgroundCopyFiles} Receives the interface pointer to the enumeration object. If the method is unsuccessful, the value of this output variable is undefined. You must release <i>ppEnumFiles</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ienumbackgroundcopyfiles-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumBackgroundCopyFiles(ppenum)
    }

    /**
     * Retrieves a count of the number of files in the enumeration.
     * @returns {Integer} Number of files in the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ienumbackgroundcopyfiles-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }
}
