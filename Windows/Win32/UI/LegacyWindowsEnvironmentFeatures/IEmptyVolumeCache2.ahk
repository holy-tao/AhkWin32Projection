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
     * 
     * @param {HKEY} hkRegKey 
     * @param {PWSTR} pcwszVolume 
     * @param {PWSTR} pcwszKeyName 
     * @param {Pointer<PWSTR>} ppwszDisplayName 
     * @param {Pointer<PWSTR>} ppwszDescription 
     * @param {Pointer<PWSTR>} ppwszBtnText 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/emptyvc/nf-emptyvc-iemptyvolumecache2-initializeex
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
