#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that are used by a disk cleanup handler to communicate with the disk cleanup manager.
 * @remarks
 * A disk cleanup handler uses this interface to report to the disk cleanup manager on the progress either of deleting files or of scanning for deletable files. It also provides a way to query the manager, to find out if the user has canceled the operation. The handler receives a pointer to this interface when the manager calls the <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-getspaceused">IEmptyVolumeCache::GetSpaceUsed</a> or <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-purge">IEmptyVolumeCache::Purge</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nn-emptyvc-iemptyvolumecachecallback
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
export default struct IEmptyVolumeCacheCallBack extends IUnknown {
    /**
     * The interface identifier for IEmptyVolumeCacheCallBack
     * @type {Guid}
     */
    static IID := Guid("{6e793361-73c6-11d0-8469-00aa00442901}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEmptyVolumeCacheCallBack interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ScanProgress  : IntPtr
        PurgeProgress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEmptyVolumeCacheCallBack.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by a disk cleanup handler to update the disk cleanup manager on the progress of a scan for deletable files.
     * @remarks
     * This method is typically called by the handler's <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-getspaceused">GetSpaceUsed</a> method while the handler is scanning for deletable files.
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
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-scanprogress
     */
    ScanProgress(dwlSpaceUsed, dwFlags, pcwszStatus) {
        pcwszStatus := pcwszStatus is String ? StrPtr(pcwszStatus) : pcwszStatus

        result := ComCall(3, this, "uint", dwlSpaceUsed, "uint", dwFlags, "ptr", pcwszStatus, "HRESULT")
        return result
    }

    /**
     * Called periodically by a disk cleanup handler to update the disk cleanup manager on the progress of a purge of deletable files.
     * @remarks
     * This method is typically called by the handler's <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-purge">Purge</a> method while the handler is purging deletable files. Handlers should call <b>PurgeProgress</b> periodically to keep the user informed of progress, especially if the purge will take a long time. Calling this method frequently also allows the handler to shut down promptly if a user cancels a purge.
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
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-purgeprogress
     */
    PurgeProgress(dwlSpaceFreed, dwlSpaceToFree, dwFlags, pcwszStatus) {
        pcwszStatus := pcwszStatus is String ? StrPtr(pcwszStatus) : pcwszStatus

        result := ComCall(4, this, "uint", dwlSpaceFreed, "uint", dwlSpaceToFree, "uint", dwFlags, "ptr", pcwszStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEmptyVolumeCacheCallBack.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ScanProgress := CallbackCreate(GetMethod(implObj, "ScanProgress"), flags, 4)
        this.vtbl.PurgeProgress := CallbackCreate(GetMethod(implObj, "PurgeProgress"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ScanProgress)
        CallbackFree(this.vtbl.PurgeProgress)
    }
}
