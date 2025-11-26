#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncProviderConfigUIInfos.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates ISyncProviderConfigUIInfo objects that contain configuration UI information used to build and register a synchronization provider.
 * @remarks
 * 
 * This interface is obtained from the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317197(v=vs.85)">ISyncProviderRegistration::EnumerateSyncProviderConfigUIsForContentType</a> method. The method will return an  <b>IEnumSyncProviderConfigUIInfos</b> enumerator for all registered <b>ISyncProviderConfigUI</b> objects or for just the registered <b>ISyncProviderConfigUI</b> objects of a particular content type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-ienumsyncproviderconfiguiinfos
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncProviderConfigUIInfos extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncProviderConfigUIInfos
     * @type {Guid}
     */
    static IID => Guid("{f6be2602-17c6-4658-a2d7-68ed3330f641}")

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
     * Returns the next ISyncProviderConfigUIInfo object.
     * @param {Integer} cFactories The number of <b>ISyncProviderConfigUIInfo</b> objects to retrieve in the range of zero to 1.
     * @param {Pointer<ISyncProviderConfigUIInfo>} ppSyncProviderConfigUIInfo Returns the next <i>pcFetched</i><b>ISyncProviderConfigUIInfo</b> objects.
     * @param {Pointer<Integer>} pcFetched Returns the number of <b>ISyncProviderConfigUIInfo</b> objects that are retrieved.
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
     * There was not enough memory available to return the next  <b>ISyncProviderConfigUIInfo</b> object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-ienumsyncproviderconfiguiinfos-next
     */
    Next(cFactories, ppSyncProviderConfigUIInfo, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFactories, "ptr*", ppSyncProviderConfigUIInfo, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * Skips the specified number of ISyncProviderConfigUIInfo objects.
     * @param {Integer} cFactories The number of <b>ISyncProviderConfigUIInfo</b> objects to skip.
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
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-ienumsyncproviderconfiguiinfos-skip
     */
    Skip(cFactories) {
        result := ComCall(4, this, "uint", cFactories, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the collection of ISyncProviderConfigUIInfo objects.
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
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-ienumsyncproviderconfiguiinfos-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones the enumerator and returns a new enumerator that is in the same state as the current one.
     * @returns {IEnumSyncProviderConfigUIInfos} Returns the newly cloned enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-ienumsyncproviderconfiguiinfos-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncProviderConfigUIInfos(ppEnum)
    }
}
