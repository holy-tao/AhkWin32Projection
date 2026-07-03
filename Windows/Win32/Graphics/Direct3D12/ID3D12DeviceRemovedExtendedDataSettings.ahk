#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_DRED_ENABLEMENT.ahk" { D3D12_DRED_ENABLEMENT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface controls Device Removed Extended Data (DRED) settings.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddatasettings
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceRemovedExtendedDataSettings extends IUnknown {
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedDataSettings
     * @type {Guid}
     */
    static IID := Guid("{82bc481c-6b9b-4030-aedb-7ee3d1df1e63}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceRemovedExtendedDataSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAutoBreadcrumbsEnablement : IntPtr
        SetPageFaultEnablement       : IntPtr
        SetWatsonDumpEnablement      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceRemovedExtendedDataSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Configures the enablement settings for Device Removed Extended Data (DRED) auto-breadcrumbs.
     * @param {D3D12_DRED_ENABLEMENT} Enablement A [D3D12_DRED_ENABLEMENT](ne-d3d12-d3d12_dred_enablement.md) value. The default is **D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED**.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddatasettings-setautobreadcrumbsenablement
     */
    SetAutoBreadcrumbsEnablement(Enablement) {
        ComCall(3, this, D3D12_DRED_ENABLEMENT, Enablement)
    }

    /**
     * Configures the enablement settings for Device Removed Extended Data (DRED) page fault reporting.
     * @param {D3D12_DRED_ENABLEMENT} Enablement A [D3D12_DRED_ENABLEMENT](ne-d3d12-d3d12_dred_enablement.md) value. The default is **D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED**.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddatasettings-setpagefaultenablement
     */
    SetPageFaultEnablement(Enablement) {
        ComCall(4, this, D3D12_DRED_ENABLEMENT, Enablement)
    }

    /**
     * Configures the enablement settings for Device Removed Extended Data (DRED) Watson dump creation.
     * @param {D3D12_DRED_ENABLEMENT} Enablement A [D3D12_DRED_ENABLEMENT](ne-d3d12-d3d12_dred_enablement.md) value. The default is **D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED**.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddatasettings-setwatsondumpenablement
     */
    SetWatsonDumpEnablement(Enablement) {
        ComCall(5, this, D3D12_DRED_ENABLEMENT, Enablement)
    }

    Query(iid) {
        if (ID3D12DeviceRemovedExtendedDataSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAutoBreadcrumbsEnablement := CallbackCreate(GetMethod(implObj, "SetAutoBreadcrumbsEnablement"), flags, 2)
        this.vtbl.SetPageFaultEnablement := CallbackCreate(GetMethod(implObj, "SetPageFaultEnablement"), flags, 2)
        this.vtbl.SetWatsonDumpEnablement := CallbackCreate(GetMethod(implObj, "SetWatsonDumpEnablement"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAutoBreadcrumbsEnablement)
        CallbackFree(this.vtbl.SetPageFaultEnablement)
        CallbackFree(this.vtbl.SetWatsonDumpEnablement)
    }
}
