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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {HKEY} hkRegKey 
     * @param {PWSTR} pcwszVolume 
     * @param {Pointer<PWSTR>} ppwszDisplayName 
     * @param {Pointer<PWSTR>} ppwszDescription 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
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
     * 
     * @param {IEmptyVolumeCacheCallBack} picb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-getspaceused
     */
    GetSpaceUsed(picb) {
        result := ComCall(4, this, "uint*", &pdwlSpaceUsed := 0, "ptr", picb, "HRESULT")
        return pdwlSpaceUsed
    }

    /**
     * 
     * @param {Integer} dwlSpaceToFree 
     * @param {IEmptyVolumeCacheCallBack} picb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-purge
     */
    Purge(dwlSpaceToFree, picb) {
        result := ComCall(5, this, "uint", dwlSpaceToFree, "ptr", picb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-showproperties
     */
    ShowProperties(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache-deactivate
     */
    Deactivate() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
