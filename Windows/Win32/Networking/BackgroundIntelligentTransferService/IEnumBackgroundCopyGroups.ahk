#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumBackgroundCopyGroups.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IEnumBackgroundCopyGroups interface to enumerate the list of groups in the download queue. To get an IEnumBackgroundCopyGroups interface pointer, call the IBackgroundCopyQMgr::EnumGroups method.
 * @see https://docs.microsoft.com/windows/win32/api//qmgr/nn-qmgr-ienumbackgroundcopygroups
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IEnumBackgroundCopyGroups extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumBackgroundCopyGroups
     * @type {Guid}
     */
    static IID => Guid("{d993e603-4aa4-47c5-8665-c20d39c2ba4f}")

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
     * Use the Next method to retrieve the specified number of items in the enumeration sequence. If there are fewer than the requested number of elements left in the sequence, it retrieves the remaining elements.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Guid>} rgelt Array of GUIDs that identify the groups. To retrieve a group, call the <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nf-qmgr-ibackgroundcopyqmgr-getgroup">IBackgroundCopyQMgr::GetGroup</a> method with the GUID.
     * @param {Pointer<Integer>} pceltFetched Number of elements in <i>rgelt</i>. You can set <i>pceltFetched</i> to <b>NULL</b> if <i>celt</i> is one.
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
     * Successfully returned the number of requested elements.
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
     * Returned less than the number of requested elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ienumbackgroundcopygroups-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Use the Skip method to skip the next specified number of elements in the enumeration sequence. If there are fewer elements left in the sequence than the requested number of elements to skip, it skips past the last element in the sequence.
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
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ienumbackgroundcopygroups-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Use the Reset method to reset the enumeration sequence to the beginning.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ienumbackgroundcopygroups-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Use the Clone method to create another IEnumBackgroundCopyGroups enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumBackgroundCopyGroups} Receives the interface pointer to the enumeration object. If the method is unsuccessful, the value of this output variable is undefined. You must release <i>ppenum</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ienumbackgroundcopygroups-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumBackgroundCopyGroups(ppenum)
    }

    /**
     * Use the GetCount method to retrieve a count of the number of groups in the enumeration.
     * @returns {Integer} Number of groups in the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ienumbackgroundcopygroups-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }
}
