#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncProviderInfos.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates ISyncProviderInfo objects that contain the information used to create an instance of a synchronization provider.
 * @remarks
 * This interface is obtained from the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-enumeratesyncproviders">ISyncProviderRegistration::EnumerateSyncProviders</a> method. The method will return an  <b>IEnumSyncProviderInfos</b> enumerator for all registered <b>ISyncProviderInfo</b> objects or for just the registered <b>ISyncProviderInfo</b> objects that match the particular filter criteria.
 * @see https://learn.microsoft.com/windows/win32/api//content/syncregistration/nn-syncregistration-ienumsyncproviderinfos
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncProviderInfos extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncProviderInfos
     * @type {Guid}
     */
    static IID => Guid("{a04ba850-5eb1-460d-a973-393fcb608a11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Returns the next ISyncProviderInfo object.
     * @remarks
     * This method will attempt to return the number of items specified by the <i>cInstances</i> parameter.  If the specified number of items is not available, <b>S_FALSE</b> will be returned, and <i>pcFetched</i> will contain the number of items that were able to be retrieved.
     * @param {Integer} cInstances The number of <b>ISyncProviderInfo</b> objects to retrieve in the range of zero to 1.
     * @param {Pointer<ISyncProviderInfo>} ppSyncProviderInfo Returns the next <i>pcFetched</i><b>ISyncProviderInfo</b> objects.
     * @param {Pointer<Integer>} pcFetched Returns the number of <b>ISyncProviderInfo</b> objects that are retrieved.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The requested number of objects was not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory available to return the next  <b>ISyncProviderInfo</b> object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/syncregistration/nf-syncregistration-ienumsyncproviderinfos-next
     */
    Next(cInstances, ppSyncProviderInfo, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cInstances, "ptr*", ppSyncProviderInfo, pcFetchedMarshal, pcFetched, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Skips the specified number of ISyncProviderInfo objects.
     * @remarks
     * If the end of the collection is reached before the number of items to skip is reached, <b>S_FALSE</b> will be returned, and the enumerator will be placed at the end of the collection and subsequent calls to <b>Skip</b> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-ienumsyncproviderinfos-next">Next</a> with a count of 1 will return <b>S_FALSE</b>.
     * @param {Integer} cInstances The number of <b>ISyncProviderInfo</b> objects to skip.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The end of the collection was reached before the specified number of items was skipped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/syncregistration/nf-syncregistration-ienumsyncproviderinfos-skip
     */
    Skip(cInstances) {
        result := ComCall(4, this, "uint", cInstances, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resets the enumerator to the beginning of the ISyncProviderInfo set.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/syncregistration/nf-syncregistration-ienumsyncproviderinfos-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clones the enumerator and returns a new enumerator that is in the same state as the current one. (IEnumSyncProviderInfos.Clone)
     * @returns {IEnumSyncProviderInfos} Returns the newly cloned enumerator.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncregistration/nf-syncregistration-ienumsyncproviderinfos-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSyncProviderInfos(ppEnum)
    }
}
