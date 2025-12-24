#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEmptyVolumeCache.ahk

/**
 * Extends IEmptyVolumeCache. This interface defines one additional method, InitializeEx, that provides better localization support than IEmptyVolumeCache::Initialize.
 * @remarks
 * 
 * This interface should be exported by disk cleanup handlers running on Windows 2000. Handlers running on Windows 98 must export <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecache">IEmptyVolumeCache</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nn-emptyvc-iemptyvolumecache2
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IEmptyVolumeCache2 extends IEmptyVolumeCache{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmptyVolumeCache2
     * @type {Guid}
     */
    static IID => Guid("{02b7e3ba-4db3-11d2-b2d9-00c04f8eec8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEx"]

    /**
     * Initializes the disk cleanup handler. It provides better support for localization than Initialize.
     * @param {HKEY} hkRegKey Type: <b>HKEY</b>
     * 
     * A handle to the registry key that holds the information about the handler object.
     * @param {PWSTR} pcwszVolume Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string with the volume root—for example, "C:\".
     * @param {PWSTR} pcwszKeyName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string with the name of the handler's registry key.
     * @param {Pointer<PWSTR>} ppwszDisplayName Type: <b>LPWSTR*</b>
     * 
     * A pointer to a null-terminated Unicode string with the name that will be displayed in the disk cleanup manager's list of handlers. You must assign a value to this parameter.
     * @param {Pointer<PWSTR>} ppwszDescription Type: <b>LPWSTR*</b>
     * 
     * A pointer to a null-terminated Unicode string that will be displayed when this object is selected from the disk cleanup manager's list of available disk cleaners. You must assign a value to this parameter.
     * @param {Pointer<PWSTR>} ppwszBtnText Type: <b>LPWSTR*</b>
     * 
     * A pointer to a null-terminated Unicode string with the text that will be displayed on the disk cleanup manager's <b>Settings</b> button. If the <b>EVCF_HASSETTINGS</b> flag is set, you must assign a value to <i>ppwszBtnText</i>. Otherwise, you can set it to <b>NULL</b>.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * 
     * Flags that are used to pass information to the handler, and back to the disk cleanup manager.
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
     * @see https://docs.microsoft.com/windows/win32/api//emptyvc/nf-emptyvc-iemptyvolumecache2-initializeex
     */
    InitializeEx(hkRegKey, pcwszVolume, pcwszKeyName, ppwszDisplayName, ppwszDescription, ppwszBtnText, pdwFlags) {
        hkRegKey := hkRegKey is Win32Handle ? NumGet(hkRegKey, "ptr") : hkRegKey
        pcwszVolume := pcwszVolume is String ? StrPtr(pcwszVolume) : pcwszVolume
        pcwszKeyName := pcwszKeyName is String ? StrPtr(pcwszKeyName) : pcwszKeyName

        ppwszDisplayNameMarshal := ppwszDisplayName is VarRef ? "ptr*" : "ptr"
        ppwszDescriptionMarshal := ppwszDescription is VarRef ? "ptr*" : "ptr"
        ppwszBtnTextMarshal := ppwszBtnText is VarRef ? "ptr*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", hkRegKey, "ptr", pcwszVolume, "ptr", pcwszKeyName, ppwszDisplayNameMarshal, ppwszDisplayName, ppwszDescriptionMarshal, ppwszDescription, ppwszBtnTextMarshal, ppwszBtnText, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }
}
