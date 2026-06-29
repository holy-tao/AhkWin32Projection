#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import ".\EMPTY_VOLUME_CACHE_FLAGS.ahk" { EMPTY_VOLUME_CACHE_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEmptyVolumeCache.ahk" { IEmptyVolumeCache }

/**
 * Extends IEmptyVolumeCache. This interface defines one additional method, InitializeEx, that provides better localization support than IEmptyVolumeCache::Initialize.
 * @remarks
 * This interface should be exported by disk cleanup handlers running on Windows 2000. Handlers running on Windows 98 must export <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecache">IEmptyVolumeCache</a>.
 * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nn-emptyvc-iemptyvolumecache2
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
export default struct IEmptyVolumeCache2 extends IEmptyVolumeCache {
    /**
     * The interface identifier for IEmptyVolumeCache2
     * @type {Guid}
     */
    static IID := Guid("{02b7e3ba-4db3-11d2-b2d9-00c04f8eec8c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEmptyVolumeCache2 interfaces
    */
    struct Vtbl extends IEmptyVolumeCache.Vtbl {
        InitializeEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEmptyVolumeCache2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the disk cleanup handler. It provides better support for localization than Initialize.
     * @remarks
     * The Windows 2000 disk cleanup manager will first call <b>IEmptyVolumeCache2::InitializeEx</b> to initialize a disk cleanup handler. It will only call <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-initialize">Initialize</a> if the <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nn-emptyvc-iemptyvolumecache2">IEmptyVolumeCache2</a> interface is not implemented. The Windows 98 disk cleanup manager only supports <b>Initialize</b>.
     * 
     * <b>InitializeEx</b> is intended to provide better localization support than <a href="https://docs.microsoft.com/windows/desktop/api/emptyvc/nf-emptyvc-iemptyvolumecache-initialize">Initialize</a>. When <b>InitializeEx</b> is called, the handler application must assign appropriately localized values to the <i>ppwszDisplayName</i> and <i>ppwszDescription</i> parameters. If the <b>Settings</b> button is enabled, you must also assign a value to the <i>ppwszBtnText</i> parameter. Unlike <b>Initialize</b>, if you set these strings to <b>NULL</b> to notify the disk cleanup manager to retrieve the default values from the registry, <b>InitializeEx</b> will fail. 
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> to allocate memory for the strings returned through <i>ppwszDisplayName</i>, <i>ppwszDescription</i>, and <i>ppwszBtnText</i>. The disk cleanup manager will free the memory when it is no longer needed.
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
     * @param {Pointer<EMPTY_VOLUME_CACHE_FLAGS>} pdwFlags Type: <b>DWORD*</b>
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
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache2-initializeex
     */
    InitializeEx(hkRegKey, pcwszVolume, pcwszKeyName, ppwszDisplayName, ppwszDescription, ppwszBtnText, pdwFlags) {
        pcwszVolume := pcwszVolume is String ? StrPtr(pcwszVolume) : pcwszVolume
        pcwszKeyName := pcwszKeyName is String ? StrPtr(pcwszKeyName) : pcwszKeyName

        ppwszDisplayNameMarshal := ppwszDisplayName is VarRef ? "ptr*" : "ptr"
        ppwszDescriptionMarshal := ppwszDescription is VarRef ? "ptr*" : "ptr"
        ppwszBtnTextMarshal := ppwszBtnText is VarRef ? "ptr*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, HKEY, hkRegKey, "ptr", pcwszVolume, "ptr", pcwszKeyName, ppwszDisplayNameMarshal, ppwszDisplayName, ppwszDescriptionMarshal, ppwszDescription, ppwszBtnTextMarshal, ppwszBtnText, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEmptyVolumeCache2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeEx := CallbackCreate(GetMethod(implObj, "InitializeEx"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeEx)
    }
}
