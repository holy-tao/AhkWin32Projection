#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by the disk cleanup manager to communicate with a disk cleanup handler. Exposes methods that enable the manager to request information from a handler, and notify it of events such as the start of a scan or purge.
 * @remarks
 * 
 * This interface must be implemented by disk cleanup handlers running on Windows 98. Handlers running on Windows 2000 should also expose <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecache2">IEmptyVolumeCache2</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nn-emptyvc-iemptyvolumecache
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
     * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nf-emptyvc-iemptyvolumecache-initialize
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
     * @param {IEmptyVolumeCacheCallBack} picb Type: <b>IEmptyVolumeCacheCallback*</b>
     * 
     * A pointer to the disk cleanup manager's <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecachecallback">IEmptyVolumeCacheCallback</a> interface. This pointer can be used to call that interface's <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-scanprogress">ScanProgress</a> method to report on the progress of the operation.
     * @returns {Integer} Type: <b>DWORDLONG*</b>
     * 
     * The amount of disk space, in bytes, that the handler can free. This value will be displayed in the disk cleanup manager's list, to the right of the handler's check box. To indicate that you do not know how much disk space can be freed, set this parameter to -1, and "???MB" will be displayed. If you set the <b>EVCF_DONTSHOWIFZERO</b> flag when <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-initialize">Initialize</a> was called, setting <i>pdwSpaceUsed</i> to zero will notify the disk cleanup manager to omit the handler from its list.
     * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nf-emptyvc-iemptyvolumecache-getspaceused
     */
    GetSpaceUsed(picb) {
        result := ComCall(4, this, "uint*", &pdwlSpaceUsed := 0, "ptr", picb, "HRESULT")
        return pdwlSpaceUsed
    }

    /**
     * Notifies the handler to start deleting its unneeded files.
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
     * The operation was ended prematurely. This value is usually returned when <a href="/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecachecallback-purgeprogress">PurgeProgress</a> returns E_ABORT. This typically happens when the user cancels the operation by clicking the disk cleanup manager's <b>Cancel</b> button.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nf-emptyvc-iemptyvolumecache-purge
     */
    Purge(dwlSpaceToFree, picb) {
        result := ComCall(5, this, "uint", dwlSpaceToFree, "ptr", picb, "HRESULT")
        return result
    }

    /**
     * Notifies the handler to display its UI.
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
     * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nf-emptyvc-iemptyvolumecache-showproperties
     */
    ShowProperties(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Notifies the handler that the disk cleanup manager is shutting down.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A flag that can be set to return information to the disk cleanup manager. It can have the following value.
     * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nf-emptyvc-iemptyvolumecache-deactivate
     */
    Deactivate() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
