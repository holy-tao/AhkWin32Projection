#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that are used by a disk cleanup handler to communicate with the disk cleanup manager.
 * @remarks
 * 
 * A disk cleanup handler uses this interface to report to the disk cleanup manager on the progress either of deleting files or of scanning for deletable files. It also provides a way to query the manager, to find out if the user has canceled the operation. The handler receives a pointer to this interface when the manager calls the <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-getspaceused">IEmptyVolumeCache::GetSpaceUsed</a> or <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-purge">IEmptyVolumeCache::Purge</a> methods.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nn-emptyvc-iemptyvolumecachecallback
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IEmptyVolumeCacheCallBack extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmptyVolumeCacheCallBack
     * @type {Guid}
     */
    static IID => Guid("{6e793361-73c6-11d0-8469-00aa00442901}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ScanProgress", "PurgeProgress"]

    /**
     * Called by a disk cleanup handler to update the disk cleanup manager on the progress of a scan for deletable files.
     * @param {Integer} dwlSpaceUsed Type: <b>DWORDLONG</b>
     * 
     * The amount of disk space that the handler can free at this point in the scan.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * A flag that can be sent to the disk cleanup manager. This flag can have the following value.
     * @param {PWSTR} pcwszStatus Type: <b>LPCWSTR</b>
     * 
     * Reserved.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * The handler should continue scanning for deletable files.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned when the user clicks the <b>Cancel</b> button on the disk cleanup manager's dialog box while a scan is in progress. The handler should stop scanning and shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nf-emptyvc-iemptyvolumecachecallback-scanprogress
     */
    ScanProgress(dwlSpaceUsed, dwFlags, pcwszStatus) {
        pcwszStatus := pcwszStatus is String ? StrPtr(pcwszStatus) : pcwszStatus

        result := ComCall(3, this, "uint", dwlSpaceUsed, "uint", dwFlags, "ptr", pcwszStatus, "HRESULT")
        return result
    }

    /**
     * Called periodically by a disk cleanup handler to update the disk cleanup manager on the progress of a purge of deletable files.
     * @param {Integer} dwlSpaceFreed Type: <b>DWORDLONG</b>
     * 
     * The amount of disk space, in bytes, that has been freed at this point in the purge. The disk cleanup manager uses this value to update its progress bar.
     * @param {Integer} dwlSpaceToFree Type: <b>DWORDLONG</b>
     * 
     * The amount of disk space, in bytes, that remains to be freed at this point in the purge.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * A flag that can be sent to the disk cleanup manager. It can can have the following value:
     * @param {PWSTR} pcwszStatus Type: <b>LPCWSTR</b>
     * 
     * Reserved.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * The handler should continue purging deletable files.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned when the user clicks the <b>Cancel</b> button on the disk cleanup manager's dialog box while a scan is in progress. The handler should stop purging files and shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nf-emptyvc-iemptyvolumecachecallback-purgeprogress
     */
    PurgeProgress(dwlSpaceFreed, dwlSpaceToFree, dwFlags, pcwszStatus) {
        pcwszStatus := pcwszStatus is String ? StrPtr(pcwszStatus) : pcwszStatus

        result := ComCall(4, this, "uint", dwlSpaceFreed, "uint", dwlSpaceToFree, "uint", dwFlags, "ptr", pcwszStatus, "HRESULT")
        return result
    }
}
