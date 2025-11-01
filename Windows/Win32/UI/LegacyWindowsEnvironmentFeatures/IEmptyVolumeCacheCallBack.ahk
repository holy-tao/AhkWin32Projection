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
     * 
     * @param {Integer} dwlSpaceUsed 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pcwszStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-scanprogress
     */
    ScanProgress(dwlSpaceUsed, dwFlags, pcwszStatus) {
        pcwszStatus := pcwszStatus is String ? StrPtr(pcwszStatus) : pcwszStatus

        result := ComCall(3, this, "uint", dwlSpaceUsed, "uint", dwFlags, "ptr", pcwszStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwlSpaceFreed 
     * @param {Integer} dwlSpaceToFree 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pcwszStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-purgeprogress
     */
    PurgeProgress(dwlSpaceFreed, dwlSpaceToFree, dwFlags, pcwszStatus) {
        pcwszStatus := pcwszStatus is String ? StrPtr(pcwszStatus) : pcwszStatus

        result := ComCall(4, this, "uint", dwlSpaceFreed, "uint", dwlSpaceToFree, "uint", dwFlags, "ptr", pcwszStatus, "HRESULT")
        return result
    }
}
