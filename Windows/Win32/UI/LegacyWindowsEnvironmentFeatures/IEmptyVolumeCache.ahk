#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by the disk cleanup manager to communicate with a disk cleanup handler. Exposes methods that enable the manager to request information from a handler, and notify it of events such as the start of a scan or purge.
 * @remarks
 * This interface must be implemented by disk cleanup handlers running on Windows 98. Handlers running on Windows 2000 should also expose <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecache2">IEmptyVolumeCache2</a>.
 * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nn-emptyvc-iemptyvolumecache
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IEmptyVolumeCache extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmptyVolumeCache
     * @type {Guid}
     */
    static IID => Guid("{8fce5227-04da-11d1-a004-00805f8abe06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetSpaceUsed", "Purge", "ShowProperties", "Deactivate"]

    /**
     * Initializes the disk cleanup handler, based on the information stored under the specified registry key.
     * @remarks
     * This method is used by the Windows 98 disk cleanup manager. Windows 2000 uses the <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache2-initializeex">InitializeEx</a> method exported by <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecache2">IEmptyVolumeCache2</a>. 
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> to allocate memory for the strings returned through <i>ppwszDisplayName</i> and <i>ppwszDescription</i>. The disk cleanup manager will free the memory when it is no longer needed.
     * @param {HKEY} hkRegKey Type: <b>HKEY</b>
     * 
     * A handle to the registry key that holds the information about the handler object.
     * @param {PWSTR} pcwszVolume Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string with the volume root—for example, "C:\".
     * @param {Pointer<PWSTR>} ppwszDisplayName Type: <b>LPWSTR*</b>
     * 
     * A pointer to a null-terminated Unicode string with the name that will be displayed in the disk cleanup manager's list of handlers. If no value is assigned, the registry value will be used.
     * @param {Pointer<PWSTR>} ppwszDescription Type: <b>LPWSTR*</b>
     * 
     * A pointer to a null-terminated Unicode string that will be displayed when this object is selected from the disk cleanup manager's list of available disk cleanup handlers. If no value is assigned, the registry value will be used.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * 
     * The flags that are used to pass information to the handler and back to the disk cleanup manager.
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
     * Success.
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
     * There are no files to delete.
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
     * The cleanup operation was ended prematurely.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cleanup operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-initialize
     */
    Initialize(hkRegKey, pcwszVolume, ppwszDisplayName, ppwszDescription, pdwFlags) {
        hkRegKey := hkRegKey is Win32Handle ? NumGet(hkRegKey, "ptr") : hkRegKey
        pcwszVolume := pcwszVolume is String ? StrPtr(pcwszVolume) : pcwszVolume

        ppwszDisplayNameMarshal := ppwszDisplayName is VarRef ? "ptr*" : "ptr"
        ppwszDescriptionMarshal := ppwszDescription is VarRef ? "ptr*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hkRegKey, "ptr", pcwszVolume, ppwszDisplayNameMarshal, ppwszDisplayName, ppwszDescriptionMarshal, ppwszDescription, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Requests the amount of disk space that the disk cleanup handler can free.
     * @remarks
     * When this method is called by the disk cleanup manager, the handler should start scanning its files to determine which of them can be deleted, and how much disk space will be freed. Handlers should call <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-scanprogress">IEmptyVolumeCache::ScanProgress</a> periodically to keep the user informed of the progress of the scan, especially if it will take a long time. Calling this method frequently also allows the handler to determine whether the user has canceled the operation. If <b>ScanProgress</b> returns E_ABORT, the user has canceled the scan. The handler should immediately stop scanning and return E_ABORT.
     *       
     * 
     * You should only set the <i>pdwSpaceUsed</i> parameter to -1 as a last resort. The handler is of limited value to a user if they don't know how much space will be freed.
     * @param {IEmptyVolumeCacheCallBack} picb Type: <b>IEmptyVolumeCacheCallback*</b>
     * 
     * A pointer to the disk cleanup manager's <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecachecallback">IEmptyVolumeCacheCallback</a> interface. This pointer can be used to call that interface's <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-scanprogress">ScanProgress</a> method to report on the progress of the operation.
     * @returns {Integer} Type: <b>DWORDLONG*</b>
     * 
     * The amount of disk space, in bytes, that the handler can free. This value will be displayed in the disk cleanup manager's list, to the right of the handler's check box. To indicate that you do not know how much disk space can be freed, set this parameter to -1, and "???MB" will be displayed. If you set the <b>EVCF_DONTSHOWIFZERO</b> flag when <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-initialize">Initialize</a> was called, setting <i>pdwSpaceUsed</i> to zero will notify the disk cleanup manager to omit the handler from its list.
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-getspaceused
     */
    GetSpaceUsed(picb) {
        result := ComCall(4, this, "uint*", &pdwlSpaceUsed := 0, "ptr", picb, "HRESULT")
        return pdwlSpaceUsed
    }

    /**
     * Notifies the handler to start deleting its unneeded files.
     * @remarks
     * For Windows 98, the <i>dwSpaceToFree</i> parameter is always set to the value specified by the handler when <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-getspaceused">IEmptyVolumeCache::GetSpaceUsed</a> was called.
     * 
     * In general, handlers should be kept simple and delete all of their files when this function is called. If there are significant performance advantages to only deleting a portion of the files, the handler should implement the <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-showproperties">ShowProperties</a> method. When called, this method displays a UI that allows the user to select the files to be deleted.
     * @param {Integer} dwlSpaceToFree Type: <b>DWORDLONG</b>
     * 
     * The amount of disk space that the handler should free. If this parameter is set to -1, the handler should delete all its files.
     * @param {IEmptyVolumeCacheCallBack} picb Type: <b>IEmptyVolumeCacheCallback*</b>
     * 
     * A pointer to the disk cleanup manager's <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecachecallback">IEmptyVolumeCacheCallBack</a> interface. This pointer can be used to call the interface's <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-purgeprogress">PurgeProgress</a> method to report on the progress of the operation.
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
     * Success.
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
     * The operation was ended prematurely. This value is usually returned when <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-purgeprogress">PurgeProgress</a> returns E_ABORT. This typically happens when the user cancels the operation by clicking the disk cleanup manager's <b>Cancel</b> button.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-purge
     */
    Purge(dwlSpaceToFree, picb) {
        result := ComCall(5, this, "uint", dwlSpaceToFree, "ptr", picb, "HRESULT")
        return result
    }

    /**
     * Notifies the handler to display its UI.
     * @remarks
     * A handler can display a UI, which is typically used to allow the user to select which files are to be cleaned up and how. To do so, the handler sets the <b>EVCF_HASSETTINGS</b> flag in the <i>pdwFlags</i> parameter when <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-initialize">Initialize</a> is called. The disk cleanup manager will then display a <b>Settings</b> button. When that button is clicked, the disk cleanup manager calls <b>ShowProperties</b> to notify the handler to display its UI.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The parent window to be used when displaying the UI.
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
     * The user changed one or more settings.
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
     * No settings were changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-showproperties
     */
    ShowProperties(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Notifies the handler that the disk cleanup manager is shutting down.
     * @remarks
     * If the <b>EVCF_REMOVEFROMLIST</b> flag is set, the handler will not be run again unless the registry entries are reestablished. This flag is typically used for a handler that will only run once.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A flag that can be set to return information to the disk cleanup manager. It can have the following value.
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-deactivate
     */
    Deactivate() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
