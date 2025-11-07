#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface controls Device Removed Extended Data (DRED) settings.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12deviceremovedextendeddatasettings
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceRemovedExtendedDataSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedDataSettings
     * @type {Guid}
     */
    static IID => Guid("{82bc481c-6b9b-4030-aedb-7ee3d1df1e63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAutoBreadcrumbsEnablement", "SetPageFaultEnablement", "SetWatsonDumpEnablement"]

    /**
     * 
     * @param {Integer} Enablement 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddatasettings-setautobreadcrumbsenablement
     */
    SetAutoBreadcrumbsEnablement(Enablement) {
        ComCall(3, this, "int", Enablement)
    }

    /**
     * 
     * @param {Integer} Enablement 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddatasettings-setpagefaultenablement
     */
    SetPageFaultEnablement(Enablement) {
        ComCall(4, this, "int", Enablement)
    }

    /**
     * 
     * @param {Integer} Enablement 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddatasettings-setwatsondumpenablement
     */
    SetWatsonDumpEnablement(Enablement) {
        ComCall(5, this, "int", Enablement)
    }
}
